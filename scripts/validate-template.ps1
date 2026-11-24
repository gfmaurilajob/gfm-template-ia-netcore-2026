param(
    [string]$Root,
    [ValidateSet('Local', 'CI')][string]$Mode = 'Local',
    [ValidateSet('Text', 'Json')][string]$Format = 'Text',
    [switch]$SkipOptional,
    [switch]$SkipGit
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'

if ([string]::IsNullOrWhiteSpace($Root)) {
    $Root = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..')).Path
}
$script:Root = (Resolve-Path -LiteralPath $Root).Path
$script:checks = New-Object System.Collections.ArrayList

function Add-Check {
    param(
        [string]$Name,
        [string]$Status,
        [string]$Detail,
        [string]$Scope = 'obrigatoria'
    )
    [void]$script:checks.Add([pscustomobject]@{
        name = $Name
        status = $Status
        scope = $Scope
        detail = $Detail
    })
}

function Get-Rel {
    param([string]$Path)
    if ($Path.StartsWith($script:Root + [System.IO.Path]::DirectorySeparatorChar)) {
        return $Path.Substring($script:Root.Length + 1).Replace('\', '/')
    }
    return $Path
}

function Shorten-Text {
    param([string]$Text, [int]$Max = 320)
    if ([string]::IsNullOrEmpty($Text)) { return '' }
    if ($Text.Length -le $Max) { return $Text }
    return $Text.Substring(0, $Max) + '...'
}

function Get-SHA256 {
    param([string]$Path)
    $algorithm = [System.Security.Cryptography.SHA256]::Create()
    try {
        $bytes = [System.IO.File]::ReadAllBytes($Path)
        return -join ($algorithm.ComputeHash($bytes) | ForEach-Object { $_.ToString('x2') })
    }
    finally {
        $algorithm.Dispose()
    }
}

function Invoke-Git {
    param([Parameter(ValueFromRemainingArguments = $true)][string[]]$GitArgs)
    $previous = $ErrorActionPreference
    $ErrorActionPreference = 'Continue'
    try {
        $output = & git @GitArgs 2>&1 | Out-String
        $code = $LASTEXITCODE
    }
    finally {
        $ErrorActionPreference = $previous
    }
    $lines = @($output -split "`r?`n" | Where-Object { -not [string]::IsNullOrWhiteSpace($_) })
    return [pscustomobject]@{ ExitCode = $code; Output = $output; Lines = $lines }
}

function Count-Files {
    param([string]$Directory, [string]$Pattern, [switch]$Recursive)
    $full = Join-Path $script:Root $Directory
    if (-not (Test-Path -LiteralPath $full -PathType Container)) { return 0 }
    if ($Recursive) {
        return @(Get-ChildItem -LiteralPath $full -Recurse -File -Filter $Pattern -Force -ErrorAction SilentlyContinue).Count
    }
    return @(Get-ChildItem -LiteralPath $full -File -Filter $Pattern -Force -ErrorAction SilentlyContinue).Count
}

function Get-Names {
    param([string]$Directory, [string]$Pattern, [switch]$Recursive)
    $full = Join-Path $script:Root $Directory
    if (-not (Test-Path -LiteralPath $full -PathType Container)) { return @() }
    if ($Recursive) {
        $items = @(Get-ChildItem -LiteralPath $full -Recurse -File -Filter $Pattern -Force -ErrorAction SilentlyContinue)
    }
    else {
        $items = @(Get-ChildItem -LiteralPath $full -File -Filter $Pattern -Force -ErrorAction SilentlyContinue)
    }
    return @($items | ForEach-Object {
        if ($_.Name -eq 'SKILL.md') { $_.Directory.Name } else { $_.BaseName }
    })
}

function Assert-Count {
    param([string]$Name, [string]$Directory, [string]$Pattern, [int]$Expected, [switch]$Recursive)
    $actual = Count-Files -Directory $Directory -Pattern $Pattern -Recursive:$Recursive
    if ($actual -eq $Expected) {
        Add-Check $Name 'PASS' ("Directory={0}; pattern={1}; expected={2}; actual={3}" -f $Directory, $Pattern, $Expected, $actual)
    }
    else {
        Add-Check $Name 'FAIL' ("Directory={0}; pattern={1}; expected={2}; actual={3}" -f $Directory, $Pattern, $Expected, $actual)
    }
}

function Assert-UniqueNames {
    param([string]$Name, [string]$Directory, [string]$Pattern, [switch]$Recursive)
    $names = @(Get-Names -Directory $Directory -Pattern $Pattern -Recursive:$Recursive)
    $duplicates = @($names | Group-Object | Where-Object { $_.Count -gt 1 } | ForEach-Object { $_.Name })
    if ($duplicates.Count -eq 0) {
        Add-Check $Name 'PASS' ("Directory={0}; names={1}; duplicates=0" -f $Directory, $names.Count)
    }
    else {
        Add-Check $Name 'FAIL' ("Directory={0}; duplicates={1}" -f $Directory, ($duplicates -join ', '))
    }
}

$requiredFiles = @(
    'AGENTS.md',
    'README.md',
    'CLAUDE.md',
    'ATTRIBUTION.md',
    'opencode.json',
    '.gitignore',
    '.gitattributes',
    '.codex/config.toml',
    '.claude/settings.json',
    'docs/ai/CATALOGO.md',
    'docs/ai/MATRIZ-HOMOLOGACAO.md',
    'docs/ai/FLUXO-OFICIAL-DESENVOLVIMENTO-IA.md',
    'docs/ai/reference/AGENTS-index.md',
    'docs/ai/reference/AGENTS-original.md',
    'docs/ai/reference/AGENTS-original.sha256.txt',
    'docs/ai/reference/agents/csharp-reviewer.md',
    'docs/veyloq/README.md',
    'docs/veyloq/MATRIZ-LICENCIAMENTO.md',
    'docs/architecture/README.md',
    'docs/architecture/standards/dotnet-patterns.md',
    'docs/architecture/testing.md',
    'docs/architecture/security.md',
    'docs/architecture/devops.md',
    'docs/GUIA-INICIO-NOVO-PROJETO.md',
    'docs/PROMPT-INICIAL-NOVO-PROJETO.md',
    'scripts/validate-template.ps1',
    'tests/template/validate-template.Tests.ps1',
    '.github/workflows/validate-template.yml',
    'reports/RELATORIO-FINAL-HOMOLOGACAO-GFM-TEMPLATE-2026-11-24.txt'
)

$requiredDirectories = @(
    '.agents/skills',
    '.claude/skills',
    '.claude/agents',
    '.claude/commands',
    '.codex/agents',
    '.codex/skills',
    '.opencode/agents',
    '.opencode/commands',
    'docs/ai/reference/agents',
    'docs/ai/reference/commands',
    'docs/veyloq',
    'docs/architecture',
    'kits',
    'reports',
    'scripts',
    'tests/template',
    '.github/workflows'
)

foreach ($relative in $requiredFiles) {
    $path = Join-Path $script:Root $relative
    if (Test-Path -LiteralPath $path -PathType Leaf) {
        Add-Check ('arquivo:' + $relative) 'PASS' 'presente'
    }
    else {
        Add-Check ('arquivo:' + $relative) 'FAIL' 'ausente'
    }
}

foreach ($relative in $requiredDirectories) {
    $path = Join-Path $script:Root $relative
    if (Test-Path -LiteralPath $path -PathType Container) {
        Add-Check ('diretorio:' + $relative) 'PASS' 'presente'
    }
    else {
        Add-Check ('diretorio:' + $relative) 'FAIL' 'ausente'
    }
}

$protectedHash = 'f2d1a15cb5c0d44facd967f50d01d1d76b15bf86bc236b6b94dfeee9edc0f741'
$protectedPath = Join-Path $script:Root 'docs/ai/reference/AGENTS-original.md'
if (Test-Path -LiteralPath $protectedPath -PathType Leaf) {
    $actualHash = Get-SHA256 -Path $protectedPath
    if ($actualHash -eq $protectedHash) {
        Add-Check 'preservacao:AGENTS-original' 'PASS' ('sha256=' + $actualHash)
    }
    else {
        Add-Check 'preservacao:AGENTS-original' 'FAIL' ("expected={0}; actual={1}" -f $protectedHash, $actualHash)
    }
}
else {
    Add-Check 'preservacao:AGENTS-original' 'FAIL' 'arquivo ausente'
}

Assert-Count -Name 'inventario:skills-canonicas' -Directory '.agents/skills' -Pattern 'SKILL.md' -Expected 19 -Recursive
Assert-Count -Name 'inventario:adaptadores-skills-claude' -Directory '.claude/skills' -Pattern 'SKILL.md' -Expected 14 -Recursive
Assert-Count -Name 'inventario:skills-codex' -Directory '.codex/skills' -Pattern 'SKILL.md' -Expected 8 -Recursive
Assert-Count -Name 'inventario:agentes-codex' -Directory '.codex/agents' -Pattern '*.toml' -Expected 19
Assert-Count -Name 'inventario:agentes-opencode' -Directory '.opencode/agents' -Pattern '*.md' -Expected 20
Assert-Count -Name 'inventario:agentes-claude' -Directory '.claude/agents' -Pattern '*.md' -Expected 19
Assert-Count -Name 'inventario:comandos-opencode' -Directory '.opencode/commands' -Pattern '*.md' -Expected 8
Assert-Count -Name 'inventario:comandos-claude' -Directory '.claude/commands' -Pattern '*.md' -Expected 8
Assert-Count -Name 'inventario:agentes-referencia' -Directory 'docs/ai/reference/agents' -Pattern '*.md' -Expected 20
Assert-Count -Name 'inventario:comandos-referencia' -Directory 'docs/ai/reference/commands' -Pattern '*.md' -Expected 8

Assert-UniqueNames -Name 'duplicidade:skills-canonicas' -Directory '.agents/skills' -Pattern 'SKILL.md' -Recursive
Assert-UniqueNames -Name 'duplicidade:adaptadores-skills-claude' -Directory '.claude/skills' -Pattern 'SKILL.md' -Recursive
Assert-UniqueNames -Name 'duplicidade:skills-codex' -Directory '.codex/skills' -Pattern 'SKILL.md' -Recursive
Assert-UniqueNames -Name 'duplicidade:agentes-opencode' -Directory '.opencode/agents' -Pattern '*.md'
Assert-UniqueNames -Name 'duplicidade:agentes-codex' -Directory '.codex/agents' -Pattern '*.toml'
Assert-UniqueNames -Name 'duplicidade:agentes-claude' -Directory '.claude/agents' -Pattern '*.md'

$jsonFiles = @(Get-ChildItem -LiteralPath $script:Root -Recurse -File -Filter '*.json' -Force | Where-Object { $_.FullName -notmatch '\\\.git\\' })
foreach ($file in $jsonFiles) {
    try {
        $null = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8 | ConvertFrom-Json
        Add-Check ('json:' + (Get-Rel $file.FullName)) 'PASS' 'parse ok'
    }
    catch {
        Add-Check ('json:' + (Get-Rel $file.FullName)) 'FAIL' (Shorten-Text $_.Exception.Message)
    }
}

$tomlFiles = @(Get-ChildItem -LiteralPath $script:Root -Recurse -File -Filter '*.toml' -Force | Where-Object { $_.FullName -notmatch '\\\.git\\' })
foreach ($file in $tomlFiles) {
    $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $quoteCount = ([regex]::Matches($text, '"""')).Count
    $inMultiline = $false
    $invalidLines = 0
    foreach ($line in ($text -split "`r?`n")) {
        if ($inMultiline) {
            if ($line -match '"""') { $inMultiline = $false }
            continue
        }
        $trimmed = $line.Trim()
        if ([string]::IsNullOrEmpty($trimmed) -or $trimmed.StartsWith('#')) { continue }
        $lineQuotes = ([regex]::Matches($line, '"""')).Count
        if ($lineQuotes -gt 0) {
            $prefix = $line -replace '"""[\s\S]*$', ''
            if (-not [string]::IsNullOrWhiteSpace($prefix) -and $prefix -notmatch '^\s*[A-Za-z0-9_-]+\s*=') { $invalidLines++ }
            if ($lineQuotes % 2 -eq 1) { $inMultiline = $true }
            continue
        }
        if ($trimmed -notmatch '^(\[[^\]]+\]|[A-Za-z0-9_-]+\s*=)') { $invalidLines++ }
    }
    if (($quoteCount % 2 -eq 0) -and ($invalidLines -eq 0) -and (-not $inMultiline)) {
        Add-Check ('toml:' + (Get-Rel $file.FullName)) 'PASS' 'sintaxe basica ok'
    }
    else {
        Add-Check ('toml:' + (Get-Rel $file.FullName)) 'FAIL' ("quotes={0}; invalidLines={1}; unterminated={2}" -f $quoteCount, $invalidLines, $inMultiline)
    }
}

$workflowPath = Join-Path $script:Root '.github/workflows/validate-template.yml'
if (Test-Path -LiteralPath $workflowPath -PathType Leaf) {
    $workflowText = Get-Content -LiteralPath $workflowPath -Raw -Encoding UTF8
    $problems = @()
    if ($workflowText -match "`t") { $problems += 'tab' }
    if ($workflowText -notmatch '(?m)^name:\s*\S') { $problems += 'name' }
    if ($workflowText -notmatch '(?m)^(on|trigger):') { $problems += 'trigger' }
    if ($workflowText -match 'pull_request_target|workflow_dispatch:\s*\{\}|permissions:\s*write-all|secrets\.') { $problems += 'permissao' }
    if ($workflowText -match 'npm\s+install|pip\s+install|dotnet\s+add\s+package|docker\s+run|git\s+push') { $problems += 'efeito-colateral' }
    if ($workflowText -notmatch 'scripts/validate-template\.ps1') { $problems += 'validador-ausente' }
    if ($problems.Count -eq 0) {
        Add-Check 'workflow:validacao' 'PASS' 'estrutura minima e restricoes ok'
    }
    else {
        Add-Check 'workflow:validacao' 'FAIL' ('problemas=' + ($problems -join ','))
    }
}

$opencodePath = Join-Path $script:Root 'opencode.json'
$claudeSettingsPath = Join-Path $script:Root '.claude/settings.json'
$opencodeText = if (Test-Path -LiteralPath $opencodePath -PathType Leaf) { Get-Content -LiteralPath $opencodePath -Raw -Encoding UTF8 } else { '' }
$claudeSettingsText = if (Test-Path -LiteralPath $claudeSettingsPath -PathType Leaf) { Get-Content -LiteralPath $claudeSettingsPath -Raw -Encoding UTF8 } else { '' }
if ($opencodeText -match '"git push \*"\s*:\s*"deny"' -and $claudeSettingsText -match 'Bash\(git push:\*\)') {
    Add-Check 'permissoes:push-negado' 'PASS' 'Codex/OpenCode e Claude settings negam git push'
}
else {
    Add-Check 'permissoes:push-negado' 'FAIL' 'negacao de git push nao encontrada nas configuracoes'
}
if ($opencodeText -match '"mcp"|"hooks"' -or $claudeSettingsText -match '"hooks"|"mcpServers"') {
    Add-Check 'permissoes:sem-hooks-mcp' 'FAIL' 'declaracao de hooks ou MCP encontrada'
}
else {
    Add-Check 'permissoes:sem-hooks-mcp' 'PASS' 'nenhum hook ou MCP declarado'
}

$agentsPath = Join-Path $script:Root 'AGENTS.md'
$agentsText = if (Test-Path -LiteralPath $agentsPath -PathType Leaf) { Get-Content -LiteralPath $agentsPath -Raw -Encoding UTF8 } else { '' }
$canonicalTerms = @('HOMOLOGADO', 'HOMOLOGADO COM RESSALVAS', 'PENDENTE', 'REPROVADO')
$missingTerms = @($canonicalTerms | Where-Object { $agentsText -notmatch [regex]::Escape($_) })
if ($missingTerms.Count -eq 0) {
    Add-Check 'governanca:categorias-canonicas' 'PASS' 'quatro categorias presentes'
}
else {
    Add-Check 'governanca:categorias-canonicas' 'FAIL' ('ausentes=' + ($missingTerms -join ','))
}

$homologacaoPath = Join-Path $script:Root 'docs/ai/MATRIZ-HOMOLOGACAO.md'
$licenciamentoPath = Join-Path $script:Root 'docs/veyloq/MATRIZ-LICENCIAMENTO.md'
if (Test-Path -LiteralPath $homologacaoPath -PathType Leaf) {
    $homologacaoText = Get-Content -LiteralPath $homologacaoPath -Raw -Encoding UTF8
    if ($homologacaoText -match 'sem\s+\*\*teste operacional controlado\*\*' -and $homologacaoText -match 'PENDENTE') {
        Add-Check 'governanca:matriz-homologacao' 'PASS' 'equivalencia PENDENTE documentada'
    }
    else {
        Add-Check 'governanca:matriz-homologacao' 'FAIL' 'equivalencia PENDENTE ausente'
    }
}
$publicacaoBloqueada = 'PUBLICA' + [char]0x00C7 + [char]0x00C3 + 'O BLOQUEADA'
$redistribuicaoPermitida = 'REDISTRIBUI' + [char]0x00C7 + [char]0x00C3 + 'O PERMITIDA'
if (Test-Path -LiteralPath $licenciamentoPath -PathType Leaf) {
    $licenciamentoText = Get-Content -LiteralPath $licenciamentoPath -Raw -Encoding UTF8
    if ($licenciamentoText -match [regex]::Escape($publicacaoBloqueada) -and $licenciamentoText -match [regex]::Escape($redistribuicaoPermitida)) {
        Add-Check 'governanca:matriz-licenciamento' 'PASS' 'bloqueio e redistribuicao documentados'
    }
    else {
        Add-Check 'governanca:matriz-licenciamento' 'FAIL' 'categorias de licenciamento ausentes'
    }
}

$declaracaoFinal = 'Declara' + [char]0x00C7 + [char]0x00C3 + 'o final'
$reportPath = Join-Path $script:Root 'reports/RELATORIO-FINAL-HOMOLOGACAO-GFM-TEMPLATE-2026-11-24.txt'
if (Test-Path -LiteralPath $reportPath -PathType Leaf) {
    $reportText = Get-Content -LiteralPath $reportPath -Raw -Encoding UTF8
    if ($reportText -match [regex]::Escape($declaracaoFinal) -and $reportText -match '\bB\.') {
        Add-Check 'relatorio:declaracao-final' 'PASS' 'declaracao B registrada'
    }
    else {
        Add-Check 'relatorio:declaracao-final' 'FAIL' 'declaracao final ausente'
    }
}

$forbiddenExtensions = @('.cs', '.csproj', '.sln', '.fs', '.fsproj', '.vb', '.vbproj')
$forbiddenCode = @(Get-ChildItem -LiteralPath $script:Root -Recurse -File -Force | Where-Object {
    $_.FullName -notmatch '\\\.git\\' -and $forbiddenExtensions -contains $_.Extension.ToLowerInvariant()
})
if ($forbiddenCode.Count -eq 0) {
    Add-Check 'escopo:sem-codigo-aplicacao' 'PASS' 'nenhum arquivo de codigo C#/solucao encontrado'
}
else {
    Add-Check 'escopo:sem-codigo-aplicacao' 'FAIL' ('arquivos=' + (@($forbiddenCode | ForEach-Object { Get-Rel $_.FullName }) -join ', '))
}

$linkFiles = @()
$linkFiles += (Join-Path $script:Root 'AGENTS.md')
$linkFiles += (Join-Path $script:Root 'README.md')
$linkFiles += (Join-Path $script:Root 'CLAUDE.md')
$docsRoot = Join-Path $script:Root 'docs'
$linkFiles += @(Get-ChildItem -LiteralPath $docsRoot -Recurse -File -Filter '*.md' -Force | Where-Object { $_.FullName -notmatch '\\reference\\' } | ForEach-Object { $_.FullName })
$brokenLinks = @()
$absoluteDocs = @()
foreach ($file in $linkFiles) {
    if (-not (Test-Path -LiteralPath $file -PathType Leaf)) { continue }
    $text = Get-Content -LiteralPath $file -Raw -Encoding UTF8
    $linkMatches = [regex]::Matches($text, '\]\(([^)\s]+)(?:\s+"[^"]*")?\)')
    foreach ($linkMatch in $linkMatches) {
        $target = $linkMatch.Groups[1].Value
        if ($target -match '^(https?://|mailto:|#|data:)') { continue }
        $cleanTarget = ($target -split '#')[0]
        if ([string]::IsNullOrWhiteSpace($cleanTarget)) { continue }
        if ($cleanTarget -match '^[A-Za-z]:[\\/]') {
            $absoluteDocs += (Get-Rel $file.FullName) + ' -> ' + $cleanTarget
            continue
        }
        $candidate = [System.IO.Path]::GetFullPath((Join-Path (Split-Path -Path $file -Parent) $cleanTarget))
        if (-not (Test-Path -LiteralPath $candidate)) {
            $brokenLinks += (Get-Rel $file.FullName) + ' -> ' + $cleanTarget
        }
    }
}
if ($brokenLinks.Count -eq 0) {
    Add-Check 'links:documentacao' 'PASS' ('arquivos={0}; quebrados=0' -f $linkFiles.Count)
}
else {
    Add-Check 'links:documentacao' 'FAIL' ('quebrados=' + (@($brokenLinks | Select-Object -First 12) -join '; '))
}
if ($absoluteDocs.Count -eq 0) {
    Add-Check 'portabilidade:sem-caminhos-absolutos' 'PASS' 'documentacao sem caminhos absolutos'
}
else {
    Add-Check 'portabilidade:sem-caminhos-absolutos' 'FAIL' ('absolutos=' + (@($absoluteDocs | Select-Object -First 12) -join '; '))
}

$textFiles = @(Get-ChildItem -LiteralPath $script:Root -Recurse -File -Force | Where-Object {
    $full = $_.FullName
    $relative = Get-Rel $full
    $allowed = ($_.Extension -in @('.md', '.ps1', '.yml', '.yaml', '.json', '.toml')) -or ($_.Name -in @('.gitignore', '.gitattributes'))
    $excluded = $full -match '\\\.git\\' -or $relative -match '^(reports/|docs/ai/reference/|scripts/|tests/template/)'
    $allowed -and (-not $excluded)
})
$secretFindings = @()
foreach ($file in $textFiles) {
    $text = Get-Content -LiteralPath $file.FullName -Raw -Encoding UTF8
    $patterns = @(
        '(?i)\b(api[_-]?key|secret|token|password|passwd)\b\s*[:=]\s*["'']?[A-Za-z0-9_\-]{8,}',
        'ghp_[A-Za-z0-9]{20,}',
        'github_pat_[A-Za-z0-9_]{20,}',
        'sk-[A-Za-z0-9]{16,}',
        'xox[baprs]-[A-Za-z0-9-]{10,}'
    )
    foreach ($pattern in $patterns) {
        if ($text -match $pattern) {
            $secretFindings += Get-Rel $file.FullName
            break
        }
    }
}
if ($secretFindings.Count -eq 0) {
    Add-Check 'segredo:varredura-documental' 'PASS' ('arquivos={0}; suspeitos=0' -f $textFiles.Count)
}
else {
    Add-Check 'segredo:varredura-documental' 'FAIL' ('suspeitos=' + (@($secretFindings | Select-Object -First 12) -join ', '))
}

if ($SkipGit) {
    Add-Check 'git:verificacoes' 'SKIP' 'SkipGit solicitado' 'opcional'
}
else {
    $gitCommand = Get-Command git -ErrorAction SilentlyContinue
    if ($null -eq $gitCommand) {
        Add-Check 'git:verificacoes' 'SKIP' 'git indisponivel' 'opcional'
    }
    else {
        $diffCheck = Invoke-Git -C $script:Root diff --check --no-color
        if ($diffCheck.ExitCode -eq 0) {
            Add-Check 'git:diff-check' 'PASS' 'exit=0'
        }
        else {
            Add-Check 'git:diff-check' 'FAIL' (Shorten-Text ($diffCheck.Output -replace "`r?`n", ' | '))
        }
        $staged = Invoke-Git -C $script:Root diff --cached --name-only --no-color
        $stagedZips = @($staged.Lines | Where-Object { $_ -match '\.zip$' })
        if ($stagedZips.Count -eq 0) {
            Add-Check 'git:nenhum-zip-stageado' 'PASS' 'zero ZIPs no indice'
        }
        else {
            Add-Check 'git:nenhum-zip-stageado' 'FAIL' ('zips=' + ($stagedZips -join ', '))
        }
        $status = Invoke-Git -C $script:Root status --porcelain
        Add-Check 'git:working-tree' 'INFO' ('linhas=' + $status.Lines.Count + '; alteracoes locais nao sao falha automatica') 'informativo'
        $remote = Invoke-Git -C $script:Root remote get-url origin
        if ($remote.ExitCode -eq 0) {
            Add-Check 'git:remote' 'INFO' (Shorten-Text $remote.Output 180) 'informativo'
        }
        else {
            Add-Check 'git:remote' 'SKIP' 'remote ausente' 'opcional'
        }
    }
}

if (-not $SkipOptional) {
    $tools = @('codex', 'opencode', 'claude', 'docker', 'uv', 'specify', 'markitdown')
    foreach ($tool in $tools) {
        $command = Get-Command $tool -ErrorAction SilentlyContinue
        if ($null -eq $command) {
            Add-Check ('ferramenta:' + $tool) 'SKIP' 'indisponivel; nao homologada por este check' 'opcional'
        }
        else {
            Add-Check ('ferramenta:' + $tool) 'INFO' ('encontrada em ' + $command.Source) 'informativo'
        }
    }
    $restrictedZips = @{
        'docs/veyloq/blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip' = 'f83753c5b7010ba4f82f076111def63fa9abf09206c7c9c664a5d0c467c064bd'
        'docs/veyloq/markitdown-documentos-para-a-ia-v1.0-agents.zip' = 'b1d1085c383cf8b193b8f57a5310429c35a14b05542e6ffbcce7087f44efdc9e'
        'docs/veyloq/microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip' = '7df08b1b0d803e1c8aaf3fa51e0091631436e91b1ccf3ba3ed7c965b817a4aed'
        'docs/veyloq/spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip' = '2b45f3e5ae1613f5b0a5e87490f8b53e315e32639a86a994b194418ead655fc5'
    }
    $present = 0
    $hashProblems = @()
    foreach ($relative in $restrictedZips.Keys) {
        $path = Join-Path $script:Root $relative
        if (Test-Path -LiteralPath $path -PathType Leaf) {
            $present++
            if ((Get-SHA256 -Path $path) -ne $restrictedZips[$relative]) {
                $hashProblems += $relative
            }
        }
    }
    if ($present -eq 0) {
        Add-Check 'zips:restritos-locais' 'SKIP' 'copias locais ausentes; permitido em CI' 'opcional'
    }
    elseif ($hashProblems.Count -eq 0) {
        Add-Check 'zips:restritos-locais' 'PASS' ('presentes={0}; hashes=ok' -f $present) 'opcional'
    }
    else {
        Add-Check 'zips:restritos-locais' 'FAIL' ('hash divergente=' + ($hashProblems -join ', ')) 'opcional'
    }
}
else {
    Add-Check 'verificacoes:opcionais' 'SKIP' 'SkipOptional solicitado' 'opcional'
}

$passed = @($script:checks | Where-Object { $_.Status -eq 'PASS' }).Count
$failed = @($script:checks | Where-Object { $_.Status -eq 'FAIL' }).Count
$skipped = @($script:checks | Where-Object { $_.Status -eq 'SKIP' }).Count
$warnings = @($script:checks | Where-Object { $_.Status -eq 'WARN' }).Count
$informational = @($script:checks | Where-Object { $_.Status -eq 'INFO' }).Count
$ok = ($failed -eq 0)

$summary = [pscustomobject]@{
    timestamp_utc = [DateTime]::UtcNow.ToString('o')
    root = $script:Root
    mode = $Mode
    checks_total = $script:checks.Count
    checks_passed = $passed
    checks_failed = $failed
    checks_skipped = $skipped
    checks_warnings = $warnings
    checks_informational = $informational
    ok = $ok
    results = @($script:checks)
}

if ($Format -eq 'Json') {
    $summary | ConvertTo-Json -Depth 6
}
else {
    "validation mode=$Mode checks=$($summary.checks_total) passed=$passed failed=$failed skipped=$skipped warnings=$warnings informational=$informational ok=$ok"
    foreach ($check in $script:checks | Where-Object { $_.Status -ne 'PASS' }) {
        ('[{0}] {1} [{2}] {3}' -f $check.Status, $check.name, $check.scope, $check.detail)
    }
}

if (-not $ok) { exit 1 }
exit 0
