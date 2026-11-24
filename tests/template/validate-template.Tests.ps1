$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$repoRoot = (Resolve-Path -LiteralPath (Join-Path $PSScriptRoot '..\..')).Path
$scriptPath = Join-Path $repoRoot 'scripts/validate-template.ps1'
$fixture = Join-Path ([System.IO.Path]::GetTempPath()) ('gfm-template-validator-' + [Guid]::NewGuid().ToString('N'))
$publicacaoBloqueada = 'PUBLICA' + [char]0x00C7 + [char]0x00C3 + 'O BLOQUEADA'
$redistribuicaoPermitida = 'REDISTRIBUI' + [char]0x00C7 + [char]0x00C3 + 'O PERMITIDA'
$declaracaoFinal = 'Declara' + [char]0x00C7 + [char]0x00C3 + 'o final'

function New-Directory {
    param([string]$Relative)
    $path = Join-Path $fixture $Relative
    New-Item -ItemType Directory -Path $path -Force | Out-Null
}

function New-File {
    param([string]$Relative, [string]$Content = '')
    $path = Join-Path $fixture $Relative
    $parent = Split-Path -Path $path -Parent
    if (-not (Test-Path -LiteralPath $parent)) {
        New-Item -ItemType Directory -Path $parent -Force | Out-Null
    }
    Set-Content -LiteralPath $path -Value $Content -Encoding UTF8
}

function Invoke-Validator {
    param([string]$Target)
    $output = & powershell.exe -NoProfile -ExecutionPolicy Bypass -File $scriptPath -Root $Target -Mode CI -Format Json -SkipGit -SkipOptional 2>&1 | Out-String
    $code = $LASTEXITCODE
    return [pscustomobject]@{ ExitCode = $code; Json = ($output | ConvertFrom-Json); Output = $output }
}

function Assert-True {
    param([bool]$Condition, [string]$Message)
    if (-not $Condition) { throw $Message }
}

function Shorten {
    param([string]$Text)
    if ($Text.Length -le 500) { return $Text }
    return $Text.Substring(0, 500) + '...'
}

try {
    New-Directory 'kits'
    New-Directory 'reports'
    New-Directory 'scripts'
    New-Directory 'tests/template'
    New-Directory '.github/workflows'
    New-Directory 'docs/ai/reference'
    New-Directory 'docs/veyloq'
    New-Directory 'docs/architecture'

    New-File 'AGENTS.md' @'
# AGENTS

Categorias: HOMOLOGADO, HOMOLOGADO COM RESSALVAS, PENDENTE e REPROVADO.
'@
    New-File 'README.md' '# README'
    New-File 'CLAUDE.md' '# Claude'
    New-File 'ATTRIBUTION.md' '# Attribution'
    New-File '.gitignore' '*.tmp'
    New-File '.gitattributes' '* text=auto'
    New-File 'opencode.json' @'
{
  "permission": {
    "bash": {
      "git push *": "deny"
    }
  }
}
'@
    New-File '.claude/settings.json' @'
{
  "permissions": {
    "deny": [
      "Bash(git push:*)"
    ]
  }
}
'@
    New-File '.codex/config.toml' 'project_doc_max_bytes = 65536'

    New-File 'docs/ai/CATALOGO.md' '# Catalogo'
    New-File 'docs/ai/MATRIZ-HOMOLOGACAO.md' @'
# Matriz

Item sem **teste operacional controlado** equivale a PENDENTE.
'@
    New-File 'docs/ai/FLUXO-OFICIAL-DESENVOLVIMENTO-IA.md' '# Fluxo'
    New-File 'docs/ai/reference/AGENTS-index.md' '# Indice'
    New-File 'docs/ai/reference/AGENTS-original.sha256.txt' 'placeholder'
    Copy-Item -LiteralPath (Join-Path $repoRoot 'docs/ai/reference/AGENTS-original.md') -Destination (Join-Path $fixture 'docs/ai/reference/AGENTS-original.md') -Force

    New-File 'docs/veyloq/README.md' '# Veyloq'
    New-File 'docs/veyloq/MATRIZ-LICENCIAMENTO.md' ("# Licenciamento`n`n{0} e {1}." -f $publicacaoBloqueada, $redistribuicaoPermitida)
    New-File 'docs/architecture/README.md' '# Arquitetura'
    New-File 'docs/architecture/standards/dotnet-patterns.md' '# Dotnet'
    New-File 'docs/architecture/testing.md' '# Testes'
    New-File 'docs/architecture/security.md' '# Seguranca'
    New-File 'docs/architecture/devops.md' '# DevOps'
    New-File 'docs/GUIA-INICIO-NOVO-PROJETO.md' '# Guia'
    New-File 'docs/PROMPT-INICIAL-NOVO-PROJETO.md' '# Prompt'
    New-File 'scripts/validate-template.ps1' '# Validador'
    New-File 'tests/template/validate-template.Tests.ps1' '# Testes'

    New-File '.github/workflows/validate-template.yml' @'
name: validate-template
on:
  push:
    branches:
      - main
  pull_request:
  workflow_dispatch:
jobs:
  validate:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: Validar template
        shell: pwsh
        run: pwsh -File scripts/validate-template.ps1 -Mode CI -Format Text
'@

    New-File 'reports/RELATORIO-FINAL-HOMOLOGACAO-GFM-TEMPLATE-2026-11-24.txt' ("Relatorio final`n`n{0}: B. TEMPLATE ESTRUTURALMENTE FINALIZADO." -f $declaracaoFinal)

    foreach ($i in 1..19) { New-File ('.agents/skills/skill{0}/SKILL.md' -f $i) ('# skill{0}' -f $i) }
    foreach ($i in 1..14) { New-File ('.claude/skills/adapter{0}/SKILL.md' -f $i) ('# adapter{0}' -f $i) }
    foreach ($i in 1..8) { New-File ('.codex/skills/codex{0}/SKILL.md' -f $i) ('# codex{0}' -f $i) }
    foreach ($i in 1..19) { New-File ('.codex/agents/agent{0}.toml' -f $i) ('name = "agent{0}"' -f $i) }
    foreach ($i in 1..20) { New-File ('.opencode/agents/agent{0}.md' -f $i) ('# agent{0}' -f $i) }
    foreach ($i in 1..19) { New-File ('.claude/agents/agent{0}.md' -f $i) ('# agent{0}' -f $i) }
    foreach ($i in 1..8) { New-File ('.opencode/commands/command{0}.md' -f $i) ('# command{0}' -f $i) }
    foreach ($i in 1..8) { New-File ('.claude/commands/command{0}.md' -f $i) ('# command{0}' -f $i) }
    foreach ($i in 1..19) { New-File ('docs/ai/reference/agents/agent{0}.md' -f $i) ('# reference{0}' -f $i) }
    New-File 'docs/ai/reference/agents/csharp-reviewer.md' '# reviewer'
    foreach ($i in 1..8) { New-File ('docs/ai/reference/commands/command{0}.md' -f $i) ('# reference{0}' -f $i) }

    $positive = Invoke-Validator -Target $fixture
    $positiveFailures = @($positive.Json.results | Where-Object { $_.status -eq 'FAIL' } | ForEach-Object { $_.name + ': ' + $_.detail })
    Assert-True ($positive.ExitCode -eq 0) ("cenario valido retornou exit={0}; falhas={1}" -f $positive.ExitCode, (Shorten ($positiveFailures -join '; ')))
    Assert-True ($positive.Json.ok -eq $true) 'cenario valido nao marcou ok=true'
    Assert-True ($positive.Json.checks_failed -eq 0) 'cenario valido apresentou falhas'

    Remove-Item -LiteralPath (Join-Path $fixture 'AGENTS.md') -Force

    $negative = Invoke-Validator -Target $fixture
    Assert-True ($negative.ExitCode -eq 1) ("cenario invalido retornou exit={0}: {1}" -f $negative.ExitCode, (Shorten $negative.Output))
    Assert-True ($negative.Json.ok -eq $false) 'cenario invalido nao marcou ok=false'
    Assert-True ($negative.Json.checks_failed -ge 1) 'cenario invalido nao contabilizou falhas'

    'validate-template.Tests.ps1: 2/2 cenarios aprovados'
}
finally {
    if (Test-Path -LiteralPath $fixture) {
        Remove-Item -LiteralPath $fixture -Recurse -Force
    }
}
