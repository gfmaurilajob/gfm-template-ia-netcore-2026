# GFM.Template — governança para agentes de IA

Este repositório é documental e não contém aplicação executável. Nenhuma ferramenta de IA deve tratar documentos como autorização para implementar, executar, instalar, publicar ou alterar recursos externos.

## 1. Entrypoint e preservação

- `AGENTS.md` é o ponto de entrada objetivo e a fonte de governança ativa.
- O conteúdo anterior, com 8.621 linhas, foi preservado integralmente em `docs/ai/reference/AGENTS-original.md`.
- O hash de verificação está em `docs/ai/reference/AGENTS-original.sha256.txt`.
- O índice de seções e a origem de cada agente/comando estão em `docs/ai/reference/AGENTS-index.md`.
- Definições longas de agentes e comandos ficam em `docs/ai/reference/agents/` e `docs/ai/reference/commands/`.
- O inventário de componentes e o mapeamento por ferramenta estão em `docs/ai/CATALOGO.md`.
- Os pacotes originais da VEYLOQ ficam em `docs/veyloq/`; inventário, hashes e restrições estão em `docs/veyloq/README.md`.
- Não apague, resuma, reescreva ou mova os arquivos de preservação sem solicitação explícita.

## 2. Regras não negociáveis

- Responda sempre em português (pt-BR), mantendo comandos, caminhos e identificadores técnicos como estão.
- Preserve arquivos originais. Não exclua nada. Não sobrescreva arquivos existentes sem mostrar a diferença e obter autorização explícita.
- Não modifique o backup de 23/11/2026 nem os artefatos em `docs/ai/reference/`.
- Não altere remote Git, branch principal, histórico, tags ou configuração de autenticação sem autorização explícita.
- Não execute `git push`, `git reset --hard`, limpeza ampla, exclusão recursiva, migrations, scaffolds, serviços, containers, publicação ou scripts com efeito colateral sem autorização explícita.
- Não instale dependências globais ou locais automaticamente. Não copie dados de outros projetos ou clientes.
- Não registre segredos, tokens, credenciais ou dados sensíveis em arquivos, logs ou respostas.
- Antes de modificar arquivos existentes, crie inventário e cópia de segurança fora do Git.
- Operações de leitura e verificação são preferenciais; operações de escrita devem ser precedidas de plano e aprovação.

## 3. Classificação de homologação

Use somente estes conceitos ao avaliar ferramentas ou componentes:

- `HOMOLOGADO`: descoberta, reconhecimento e execução controlada verificados neste repositório.
- `HOMOLOGADO COM RESSALVAS`: configuração válida e riscos conhecidos, com restrições operacionais explícitas.
- `PENDENTE`: não executado ou impossível de verificar no ambiente atual.
- `REPROVADO`: falha verificada ou risco inaceitável.

Nunca declare `HOMOLOGADO` sem evidência de teste operacional controlado.

## 4. Uso combinado

- A governança é compartilhada; arquivos específicos de ferramenta são adaptadores, não fontes concorrentes.
- `context-manager` deve ser consultado antes de trabalho especializado para levantar contexto, restrições, arquivos relevantes, decisões pendentes e riscos.
- Agentes e comandos devem citar a seção canônica correspondente em `docs/ai/reference/` quando precisarem de detalhes.
- O revisor de C# tem definição canônica em `docs/ai/reference/agents/csharp-reviewer.md` e adaptador em `.opencode/agents/csharp-reviewer.md`.
- Skills canônicas permanecem em `.agents/skills/`. O adaptador em `.claude/skills/` apenas aponta para elas.
- No OpenCode 1.19.0, a descoberta combina `.agents/skills/` e `.claude/skills/`; a precedência por `name` não é estável e pode expor adaptadores Claude como duplicados. Inicie o OpenCode com `OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1` para usar somente as 19 skills canônicas (14 originais + 5 VEYLOQ). Não exclua `.claude/skills/`: ele é necessário ao Claude Code.
- Kits permanecem em `kits/`; não duplique seu conteúdo.

## 5. Pontos de entrada por ferramenta

- **OpenAI Codex CLI:** `AGENTS.md`, `.codex/config.toml`, `.codex/agents/`, `.codex/skills/`.
- **OpenCode:** `AGENTS.md`, `opencode.json`, `.opencode/agents/`, `.opencode/commands/`, `.agents/skills/`.
- **Claude Code:** `CLAUDE.md`, `.claude/settings.json`, `.claude/agents/`, `.claude/commands/`, `.claude/skills/`.

Para Codex CLI, use `/skills` para inspecionar skills, `$<skill>` para invocar skills de comando (por exemplo `$typescript-scaffold`) e `/agents` ou linguagem natural para selecionar agentes. Para Claude Code, use a ferramenta `Task` para agentes e `/<comando>` para comandos. Para OpenCode, use o modo subagente e comandos por `/<comando>`; inicie com `OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1` para evitar duplicidade de skills. No PowerShell, use `$env:OPENCODE_DISABLE_CLAUDE_CODE_SKILLS='1'; opencode`. Em caso de dúvida, peça ao `context-manager` o mapeamento correto.

## 6. Configuração e segurança

- `opencode.json` e `.claude/settings.json` aplicam permissões mínimas: leitura/consulta ampla, escrita e shell sob aprovação, operações destrutivas e de publicação negadas por padrão.
- Nenhum hook foi instalado. Se um hook for necessário, mostre o comando exato e aguarde autorização antes de alterar `.claude/settings.json`.
- Claude Code não estava disponível no ambiente de auditoria; sua configuração é considerada `PENDENTE` até teste operacional.
- Relatórios de auditoria e homologação ficam em `reports/`.
