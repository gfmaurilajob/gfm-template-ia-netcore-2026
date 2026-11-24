# Catálogo compartilhado de IA

Fonte canônica: `AGENTS.md` (entrypoint) e `docs/ai/reference/` (preservação verificável).
Este catálogo não substitui as definições canônicas; apenas mapeia nomes e caminhos.
Estado operacional por item: `docs/ai/MATRIZ-HOMOLOGACAO.md`. Fluxo de uso: `docs/ai/FLUXO-OFICIAL-DESENVOLVIMENTO-IA.md`.

## Agentes (18 originais + context-manager + csharp-reviewer)

| Nome | Origem canônica | Codex | OpenCode | Claude Code |
|---|---|---|---|---|
| frontend-developer | `docs/ai/reference/agents/frontend-developer.md` | `.codex/agents/frontend-developer.toml` | `.opencode/agents/frontend-developer.md` | `.claude/agents/frontend-developer.md` |
| react-specialist | `docs/ai/reference/agents/react-specialist.md` | `.codex/agents/react-specialist.toml` | `.opencode/agents/react-specialist.md` | `.claude/agents/react-specialist.md` |
| nextjs-developer | `docs/ai/reference/agents/nextjs-developer.md` | `.codex/agents/nextjs-developer.toml` | `.opencode/agents/nextjs-developer.md` | `.claude/agents/nextjs-developer.md` |
| typescript-pro | `docs/ai/reference/agents/typescript-pro.md` | `.codex/agents/typescript-pro.toml` | `.opencode/agents/typescript-pro.md` | `.claude/agents/typescript-pro.md` |
| ui-designer | `docs/ai/reference/agents/ui-designer.md` | `.codex/agents/ui-designer.toml` | `.opencode/agents/ui-designer.md` | `.claude/agents/ui-designer.md` |
| accessibility-tester | `docs/ai/reference/agents/accessibility-tester.md` | `.codex/agents/accessibility-tester.toml` | `.opencode/agents/accessibility-tester.md` | `.claude/agents/accessibility-tester.md` |
| backend-developer | `docs/ai/reference/agents/backend-developer.md` | `.codex/agents/backend-developer.toml` | `.opencode/agents/backend-developer.md` | `.claude/agents/backend-developer.md` |
| api-designer | `docs/ai/reference/agents/api-designer.md` | `.codex/agents/api-designer.toml` | `.opencode/agents/api-designer.md` | `.claude/agents/api-designer.md` |
| node-specialist | `docs/ai/reference/agents/node-specialist.md` | `.codex/agents/node-specialist.toml` | `.opencode/agents/node-specialist.md` | `.claude/agents/node-specialist.md` |
| python-pro | `docs/ai/reference/agents/python-pro.md` | `.codex/agents/python-pro.toml` | `.opencode/agents/python-pro.md` | `.claude/agents/python-pro.md` |
| sql-pro | `docs/ai/reference/agents/sql-pro.md` | `.codex/agents/sql-pro.toml` | `.opencode/agents/sql-pro.md` | `.claude/agents/sql-pro.md` |
| postgres-pro | `docs/ai/reference/agents/postgres-pro.md` | `.codex/agents/postgres-pro.toml` | `.opencode/agents/postgres-pro.md` | `.claude/agents/postgres-pro.md` |
| docker-expert | `docs/ai/reference/agents/docker-expert.md` | `.codex/agents/docker-expert.toml` | `.opencode/agents/docker-expert.md` | `.claude/agents/docker-expert.md` |
| qa-expert | `docs/ai/reference/agents/qa-expert.md` | `.codex/agents/qa-expert.toml` | `.opencode/agents/qa-expert.md` | `.claude/agents/qa-expert.md` |
| test-automator | `docs/ai/reference/agents/test-automator.md` | `.codex/agents/test-automator.toml` | `.opencode/agents/test-automator.md` | `.claude/agents/test-automator.md` |
| debugger | `docs/ai/reference/agents/debugger.md` | `.codex/agents/debugger.toml` | `.opencode/agents/debugger.md` | `.claude/agents/debugger.md` |
| security-auditor | `docs/ai/reference/agents/security-auditor.md` | `.codex/agents/security-auditor.toml` | `.opencode/agents/security-auditor.md` | `.claude/agents/security-auditor.md` |
| performance-engineer | `docs/ai/reference/agents/performance-engineer.md` | `.codex/agents/performance-engineer.toml` | `.opencode/agents/performance-engineer.md` | `.claude/agents/performance-engineer.md` |
| context-manager | `docs/ai/reference/agents/context-manager.md` | `.codex/agents/context-manager.toml` | `.opencode/agents/context-manager.md` | `.claude/agents/context-manager.md` |
| csharp-reviewer | `docs/ai/reference/agents/csharp-reviewer.md` | — | `.opencode/agents/csharp-reviewer.md` | — |

Adaptadores de Codex e Claude Code para `csharp-reviewer`: ausentes (`PENDENTE`). A definição canônica e o adaptador OpenCode estão registrados em `AGENTS.md`.

## Comandos (8)

| Comando | Origem canônica | Codex (skill) | OpenCode | Claude Code |
|---|---|---|---|---|
| /typescript-scaffold | `docs/ai/reference/commands/typescript-scaffold.md` | `.codex/skills/typescript-scaffold/SKILL.md` | `.opencode/commands/typescript-scaffold.md` | `.claude/commands/typescript-scaffold.md` |
| /component-scaffold | `docs/ai/reference/commands/component-scaffold.md` | `.codex/skills/component-scaffold/SKILL.md` | `.opencode/commands/component-scaffold.md` | `.claude/commands/component-scaffold.md` |
| /python-scaffold | `docs/ai/reference/commands/python-scaffold.md` | `.codex/skills/python-scaffold/SKILL.md` | `.opencode/commands/python-scaffold.md` | `.claude/commands/python-scaffold.md` |
| /sql-migrations | `docs/ai/reference/commands/sql-migrations.md` | `.codex/skills/sql-migrations/SKILL.md` | `.opencode/commands/sql-migrations.md` | `.claude/commands/sql-migrations.md` |
| /test-generate | `docs/ai/reference/commands/test-generate.md` | `.codex/skills/test-generate/SKILL.md` | `.opencode/commands/test-generate.md` | `.claude/commands/test-generate.md` |
| /security-sast | `docs/ai/reference/commands/security-sast.md` | `.codex/skills/security-sast/SKILL.md` | `.opencode/commands/security-sast.md` | `.claude/commands/security-sast.md` |
| /deps-audit | `docs/ai/reference/commands/deps-audit.md` | `.codex/skills/deps-audit/SKILL.md` | `.opencode/commands/deps-audit.md` | `.claude/commands/deps-audit.md` |
| /pr-enhance | `docs/ai/reference/commands/pr-enhance.md` | `.codex/skills/pr-enhance/SKILL.md` | `.opencode/commands/pr-enhance.md` | `.claude/commands/pr-enhance.md` |

## Skills (19)

| Skill | Canônica | Adaptador Claude Code |
|---|---|---|
| brainstorming | `.agents/skills/brainstorming/SKILL.md` | `.claude/skills/brainstorming/SKILL.md` |
| context-degradation | `.agents/skills/context-degradation/SKILL.md` | `.claude/skills/context-degradation/SKILL.md` |
| context-fundamentals | `.agents/skills/context-fundamentals/SKILL.md` | `.claude/skills/context-fundamentals/SKILL.md` |
| context-optimization | `.agents/skills/context-optimization/SKILL.md` | `.claude/skills/context-optimization/SKILL.md` |
| executing-plans | `.agents/skills/executing-plans/SKILL.md` | `.claude/skills/executing-plans/SKILL.md` |
| finishing-a-development-branch | `.agents/skills/finishing-a-development-branch/SKILL.md` | `.claude/skills/finishing-a-development-branch/SKILL.md` |
| receiving-code-review | `.agents/skills/receiving-code-review/SKILL.md` | `.claude/skills/receiving-code-review/SKILL.md` |
| requesting-code-review | `.agents/skills/requesting-code-review/SKILL.md` | `.claude/skills/requesting-code-review/SKILL.md` |
| subagent-driven-development | `.agents/skills/subagent-driven-development/SKILL.md` | `.claude/skills/subagent-driven-development/SKILL.md` |
| systematic-debugging | `.agents/skills/systematic-debugging/SKILL.md` | `.claude/skills/systematic-debugging/SKILL.md` |
| test-driven-development | `.agents/skills/test-driven-development/SKILL.md` | `.claude/skills/test-driven-development/SKILL.md` |
| using-git-worktrees | `.agents/skills/using-git-worktrees/SKILL.md` | `.claude/skills/using-git-worktrees/SKILL.md` |
| verification-before-completion | `.agents/skills/verification-before-completion/SKILL.md` | `.claude/skills/verification-before-completion/SKILL.md` |
| writing-plans | `.agents/skills/writing-plans/SKILL.md` | `.claude/skills/writing-plans/SKILL.md` |
| blueprint | `.agents/skills/blueprint/SKILL.md` | — |
| markitdown-convert | `.agents/skills/markitdown-convert/SKILL.md` | — |
| microsoft-docs | `.agents/skills/microsoft-docs/SKILL.md` | — |
| spec-kit-sdd | `.agents/skills/spec-kit-sdd/SKILL.md` | — |
| sql-code-review | `.agents/skills/sql-code-review/SKILL.md` | — |

Adaptadores Claude Code para as 5 skills VEYLOQ: ausentes (`PENDENTE`). Codex CLI 0.171.0 descobre as 8 skills de comando em `.codex/skills/` e as 19 skills canônicas em `.agents/skills/`. OpenCode 1.19.0 combina `.agents/skills/` e `.claude/skills/`, com precedência instável por `name`; use `OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1` para revelar somente as 19 skills canônicas. Não exclua `.claude/skills/`: ele é necessário ao Claude Code.

## Kits (6)

| Pasta | Título |
|---|---|
| `kits/kit-engenharia-de-contexto-para-agentes/` | Kit de engenharia de contexto para agentes |
| `kits/kit-qualidade-e-seguranca/` | Qualidade e segurança |
| `kits/kit-time-de-back-end/` | Time de back-end |
| `kits/kit-time-de-front-end/` | Time de front-end |
| `kits/superpowers-fluxo-de-entrega/` | Superpowers: o fluxo de entrega |
| `kits/superpowers-metodo-completo/` | Superpowers: o método completo |

## Pacotes VEYLOQ originais

`docs/veyloq/` é o diretório oficial dos 18 ZIPs originais da VEYLOQ. Inventário, SHA-256, origens, licenças e procedimento de atualização: `docs/veyloq/README.md`.

Relação resumida: o bundle `pacote-desenvolvimento-com-ia` produziu os 6 kits e as 14 skills originais; `blueprint`, `spec-kit`, `markitdown`, `microsoft-docs` e `sql-code-review` produziram as 5 skills VEYLOQ; o agente de C# produziu a definição canônica e o adaptador OpenCode. Os demais ZIPs ficam como referência local. Status operacional das instalações: `PENDENTE` até teste controlado. Publicação dos ZIPs depende de autorização de redistribuição, nos termos do `LICENSE.txt` de cada pacote.

## Pontos de entrada por ferramenta

- Codex CLI: `AGENTS.md`, `.codex/config.toml`, `.codex/agents/`, `.codex/skills/`.
- OpenCode: `AGENTS.md`, `opencode.json`, `.opencode/agents/`, `.opencode/commands/`, `.agents/skills/`.
- Claude Code: `CLAUDE.md` (importa `@AGENTS.md`), `.claude/settings.json`, `.claude/agents/`, `.claude/commands/`, `.claude/skills/`.

## Decisão sobre context-manager

As referências históricas a `context-manager` foram preservadas no original. Para satisfazê-las sem apagar nada, foi criado um agente `context-manager` com adaptadores nas três ferramentas e definição em `docs/ai/reference/agents/context-manager.md`.
