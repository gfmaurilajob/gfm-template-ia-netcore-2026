# Matriz de homologação — GFM.Template

Data: 24/11/2026 · Repositório: `gfm-template-ia-netcore-2026` · Branch: `main`

## 1. Regra de ouro

**Nota explícita:** para a governança canônica de `AGENTS.md`, itens sem **teste operacional controlado** equivalem a `PENDENTE` para fins de uso, e **nenhum item deve ser chamado de `HOMOLOGADO` sem execução real**. `CONFIGURADO` e `DESCOBERTO` descrevem apenas estado de inventário/configuração; não são atestado de homologação. `HOMOLOGADO` abaixo significa exclusivamente: comando de consulta/verificação executado de fato, com saída registrada, e escopo limitado ao que foi executado. Não foram executados agentes ou skills com modelo, não houve custo de API autorizado e nenhuma evidência foi inventada.

Inventário: 186 itens individualizados nas tabelas das seções 4 a 12.

## 2. Legenda das células

- **Origem:** `O1` = bundle `pacote-desenvolvimento-com-ia-v1.0-agents.zip` (VEYLOQ, 05/11/2026); `O2` = ZIP VEYLOQ indicado na linha; `O3` = acréscimo documental de 24/11/2026; `O4` = arquivo de configuração do repositório; `O5` = instalação local ou ferramenta.
- **Licença:** `L1` = MIT dos componentes de terceiros conforme `ATTRIBUTION.md`, com textos VEYLOQ de uso pessoal/profissional sem redistribuição; `L2` = texto VEYLOQ sem redistribuir nem revender, terceiros MIT; `L3` = licença da ferramenta, não auditada neste repositório; `L4` = não declarada no repositório, uso local.
- **Ferramenta:** `C` = OpenAI Codex CLI; `O` = OpenCode; `K` = Claude Code; `T` = compatível com as três por adaptadores; `—` = sem ferramenta de IA.
- **Descoberta:** `D1` = `codex debug prompt-input`; `D2` = `opencode debug skill` / `opencode agent list`; `D3` = inventário de arquivos e `docs/ai/CATALOGO.md`; `D4` = `Get-Command` / `--version`; `D5` = relatórios em `reports/`.
- **Invocação:** `I1` = `/skills`, `$<skill>`, `/agents` ou linguagem natural; `I2` = modo subagente, `/<comando>` ou skill por nome, com `OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1`; `I3` = ferramenta `Task`, `/<comando>` e `.claude/skills/`; `I4` = CLI/shell; `I5` = não invocável no estado atual.
- **Teste previsto:** `TP1` = prompt operacional mínimo com modelo em projeto descartável; `TP2` = validação estática de configuração/frontmatter e descoberta; `TP3` = execução controlada da CLI; `TP4` = `--version` ou consulta de versão; `TP5` = build/run/teste do runtime; `TP6` = extração verificada por hash mais autorização de redistribuição; `TP7` = execução do validador no CI/local.
- **Teste realizado:** `TR1` = nenhum teste com modelo (E12); `TR2` = validação estática/descoberta executadas (E1–E7); `TR3` = versão/consulta executada com sucesso (E8/E9); `TR4` = não executado por ausência de dependência, autorização ou artefato (E6/E12/E14); `TR5` = falha verificada (E8).

## 3. Evidências registradas

| ID | Evidência |
|---|---|
| E1 | `codex --strict-config --version` → `codex-cli 0.171.0`; `codex doctor --summary --no-color --ascii` → `19 ok \| 4 notes \| 3 warn \| 0 fail degraded`; sandbox `restricted fs + restricted network`, aprovação `OnRequest`, nenhum MCP configurado; avisos: Microsoft Defender, worktree fora de Dev Drive, socket obsoleto do app-server. |
| E2 | `codex debug prompt-input` → exit 0; `AGENTS.md` carregado; `r0=8` skills de comando em `.codex/skills`, `r1=4` bundled, `r2=20` cache de plugin Postman, `r3=19` skills canônicas em `.agents/skills`, incluindo as 5 VEYLOQ. |
| E3 | `opencode debug config` → exit 0; `opencode.json` V1 válido, lido novamente nesta data. |
| E4 | `opencode debug skill` com `OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1` → 19 skills canônicas + `customize-opencode` (20 no total), 0 duplicatas. Antes das 5 skills VEYLOQ: 12/12 execuções isoladas com 14 canônicas e 0 adaptadores Claude; sem a variável, 6/12 execuções apresentaram substituição por nome. |
| E5 | `opencode agent list` → 27 agentes: 7 embutidos + 20 subagentes, incluindo `csharp-reviewer`. |
| E6 | `Get-Command claude` → não encontrado; nova consulta nesta data a `codex`, `opencode`, `claude`, `uv`, `specify`, `markitdown` retornou apenas `codex.ps1` e `opencode.ps1`. |
| E7 | Script temporário `final_validate.ps1` (fora do Git), 24/11/2026: `compared=10`, `byte_diffs=0`, `canonical_skills=19`, `claude_skill_adapters=14`, `opencode_agents=20`, `codex_agents=19`, `claude_agents=19`, `codex_skills=8`, `opencode_commands=8`, `claude_commands=8`, `broken_relative_links=0`, `secret_suspects=0`, hash de `AGENTS-original.md` íntegro, JSON/TOML válidos. Relatório de 23/11 registra frontmatter válido para 8 skills Codex, 14 skills canônicas, 14 adaptadores Claude, 19 agentes OpenCode, 8 comandos OpenCode, 19 agentes Claude e 8 comandos Claude. |
| E8 | Versões consultadas nesta data: Git `2.55.0.windows.5`; PowerShell `5.1.26100.10068` e `7.7.0`; .NET `10.0.402`; Node `24.20.0`; npm `11.19.0`; Python `3.13.15`; Docker CLI `29.8.2`; Docker Compose `v5.6.0`; WSL `3.0.5.0`. `docker info` falhou: `failed to connect to the docker API at npipe:////./pipe/dockerDesktopLinuxEngine`. |
| E9 | `git diff --check`: exit 0 em 23/11/2026; em 24/11/2026, antes da consolidação final, apresentou avisos de normalização LF→CRLF e trailing whitespace oriundos de conteúdo byte-idêntico dos ZIPs e de quebras Markdown intencionais, sem conflito ou erro de sintaxe. O relatório final registra o resultado após a consolidação. |
| E10 | `docs/veyloq/README.md`: 18 ZIPs com SHA-256; `root_zips=0`, `docs_veyloq_zips=18`, `integrity_bad=0`, `unique_ids=18`. |
| E11 | `LICENSE.txt` dos pacotes e `ATTRIBUTION.md`: componentes de terceiros sob MIT; textos escritos pela VEYLOQ para uso pessoal e profissional, sem redistribuir nem revender; VEYLOQ é marca da GAX TECH LTDA. |
| E12 | Nenhum teste operacional com modelo foi executado (relatório de 23/11, item 14; nesta tarefa, por solicitação explícita). Nenhum scaffold, migração, SAST, auditoria de dependências ou revisão de PR foi disparado. |
| E13 | Inventário de diretórios nesta data: 19 skills canônicas; 20 arquivos em `docs/ai/reference/agents/`; 19 `.codex/agents/*.toml`; 20 `.opencode/agents/*.md`; 19 `.claude/agents/*.md`; 14 `.claude/skills/*/SKILL.md`; 8 `.codex/skills/*/SKILL.md`; 8 comandos em cada um de `docs/ai/reference/commands/`, `.opencode/commands/` e `.claude/commands/`. |
| E14 | Inventário anterior registrava ausência de `.github/workflows`, pipelines e validadores dedicados; em 24/11/2026 foram criados `scripts/validate-template.ps1`, `tests/template/validate-template.Tests.ps1` e `.github/workflows/validate-template.yml`. O estado anterior permanece como evidência histórica, não como estado final. |

## 4. Skills canônicas — 19 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| brainstorming | Pré-requisito antes de trabalho criativo | `.agents/skills/brainstorming/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| systematic-debugging | Causa raiz a partir de evidência | `.agents/skills/systematic-debugging/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| test-driven-development | Testes antes da implementação | `.agents/skills/test-driven-development/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| writing-plans | Plano a partir de spec ou requisitos | `.agents/skills/writing-plans/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| executing-plans | Execução do plano na sessão atual | `.agents/skills/executing-plans/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| subagent-driven-development | Execução de plano com tarefas independentes | `.agents/skills/subagent-driven-development/SKILL.md` | O1 | L1 | T | Modelo; subagentes; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| using-git-worktrees | Isolamento por worktree antes de implementar | `.agents/skills/using-git-worktrees/SKILL.md` | O1 | L1 | T | Git; modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado em workspace descartável |
| requesting-code-review | Solicitar revisão antes de mesclar | `.agents/skills/requesting-code-review/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| receiving-code-review | Receber revisão com rigor técnico | `.agents/skills/receiving-code-review/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| verification-before-completion | Verificar antes de declarar conclusão | `.agents/skills/verification-before-completion/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| finishing-a-development-branch | Decidir integração da branch concluída | `.agents/skills/finishing-a-development-branch/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| context-fundamentals | Explicar fundamentos de engenharia de contexto | `.agents/skills/context-fundamentals/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| context-degradation | Diagnosticar degradação e confusão de contexto | `.agents/skills/context-degradation/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| context-optimization | Reduzir custo e melhorar eficiência de contexto | `.agents/skills/context-optimization/SKILL.md` | O1 | L1 | T | Modelo; adaptador K | D1, D2, D3 | I1, I2, I3 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Prompt controlado com modelo |
| blueprint | Plano de obra em várias sessões e PRs | `.agents/skills/blueprint/SKILL.md` | O2 `blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip` | L2 | C, O | Modelo; `LICENSE.txt` local | D1, D2, D3 | I1, I2 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Execução controlada; adaptador K ausente |
| spec-kit-sdd | Desenvolvimento guiado por especificação | `.agents/skills/spec-kit-sdd/SKILL.md` | O2 `spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip` | L2 | C, O | Specify CLI indisponível (E6) | D1, D2, D3 | I1, I2 | TP1 | TR1 | E2, E4, E6, E12 | PENDENTE DE TESTE OPERACIONAL | Instalar Specify com autorização; adaptador K ausente |
| markitdown-convert | Converter PDF/Office/HTML/imagem/áudio para Markdown | `.agents/skills/markitdown-convert/SKILL.md` | O2 `markitdown-documentos-para-a-ia-v1.0-agents.zip` | L2 | C, O | MarkItDown CLI indisponível (E6) | D1, D2, D3 | I1, I2 | TP1 | TR1 | E2, E4, E6, E12 | PENDENTE DE TESTE OPERACIONAL | Instalar MarkItDown com autorização; adaptador K ausente |
| microsoft-docs | Consultar documentação oficial Microsoft | `.agents/skills/microsoft-docs/SKILL.md` | O2 `microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip` | L2 | C, O | Learn CLI indisponível (E6); `LICENSE.txt` | D1, D2, D3 | I1, I2 | TP1 | TR1 | E2, E4, E6, E12 | PENDENTE DE TESTE OPERACIONAL | Instalar Learn CLI com autorização; adaptador K ausente |
| sql-code-review | Revisar SQL quanto a segurança e qualidade | `.agents/skills/sql-code-review/SKILL.md` | O2 `sql-code-review-revisao-de-sql-e-seguranca-v1.0-agents.zip` | L2 | C, O | Modelo; `LICENSE.txt` | D1, D2, D3 | I1, I2 | TP1 | TR1 | E2, E4, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Execução controlada; adaptador K ausente |

## 5. Agentes canônicos — 20 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| frontend-developer | Telas completas em React, Vue ou Angular | `docs/ai/reference/agents/frontend-developer.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| react-specialist | Performance e estado sob controle em React | `docs/ai/reference/agents/react-specialist.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| nextjs-developer | App Router, SEO e Web Vitals | `docs/ai/reference/agents/nextjs-developer.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| typescript-pro | Tipos que barram erro cedo | `docs/ai/reference/agents/typescript-pro.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| ui-designer | Design system e telas consistentes | `docs/ai/reference/agents/ui-designer.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| accessibility-tester | Conferência WCAG | `docs/ai/reference/agents/accessibility-tester.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| backend-developer | API e serviço prontos para produção | `docs/ai/reference/agents/backend-developer.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| api-designer | Contrato REST e GraphQL | `docs/ai/reference/agents/api-designer.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| node-specialist | Back-end JavaScript estável | `docs/ai/reference/agents/node-specialist.md` | O1 | L1 | T | Modelo; Node instalado; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E8, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| python-pro | Código Python tipado, assíncrono e testado | `docs/ai/reference/agents/python-pro.md` | O1 | L1 | T | Modelo; Python instalado; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E8, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| sql-pro | Consulta rápida e esquema bem feito | `docs/ai/reference/agents/sql-pro.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| postgres-pro | Desempenho, réplica e backup PostgreSQL | `docs/ai/reference/agents/postgres-pro.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| docker-expert | Imagem pequena, segura e rápida | `docs/ai/reference/agents/docker-expert.md` | O1 | L1 | T | Modelo; Docker Engine (E8); adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E8, E12 | PENDENTE DE TESTE OPERACIONAL | Engine indisponível e alocação real |
| qa-expert | Estratégia de qualidade do produto | `docs/ai/reference/agents/qa-expert.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| test-automator | Framework e CI testando sozinhos | `docs/ai/reference/agents/test-automator.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real; CI inexistente (E14) |
| debugger | Causa do bug achada pela evidência | `docs/ai/reference/agents/debugger.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| security-auditor | Riscos e conformidade mapeados | `docs/ai/reference/agents/security-auditor.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| performance-engineer | Gargalo medido e eliminado | `docs/ai/reference/agents/performance-engineer.md` | O1 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| context-manager | Consolidar contexto e restrições antes de trabalho especializado | `docs/ai/reference/agents/context-manager.md` | O3 | L1 | T | Modelo; adaptadores | D2, D3, D5 | I1, I2, I3 | TP1 | TR1 | E5, E7, E12 | PENDENTE DE TESTE OPERACIONAL | Alocação real de subagente |
| csharp-reviewer | Revisar C#/.NET, async, nullable e segurança | `docs/ai/reference/agents/csharp-reviewer.md` | O2 `agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` | L1 | O | Modelo; `dotnet build`/`format` se disponíveis | D2, D3, D5 | I2 | TP1 | TR1 | E5, E7, E8, E12 | PENDENTE DE TESTE OPERACIONAL | Adaptadores C e K ausentes; alocação real |

## 6. Adaptadores — 80 itens

### 6.1 Codex CLI: 19 `.toml`

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| accessibility-tester | Adaptador TOML do agente | `.codex/agents/accessibility-tester.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| api-designer | Adaptador TOML do agente | `.codex/agents/api-designer.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| backend-developer | Adaptador TOML do agente | `.codex/agents/backend-developer.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| context-manager | Adaptador TOML do agente | `.codex/agents/context-manager.toml` | O3 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| debugger | Adaptador TOML do agente | `.codex/agents/debugger.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| docker-expert | Adaptador TOML do agente | `.codex/agents/docker-expert.toml` | O1 | L1 | C | Codex 0.171.0; Engine (E8) | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real e Engine |
| frontend-developer | Adaptador TOML do agente | `.codex/agents/frontend-developer.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| nextjs-developer | Adaptador TOML do agente | `.codex/agents/nextjs-developer.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| node-specialist | Adaptador TOML do agente | `.codex/agents/node-specialist.toml` | O1 | L1 | C | Codex 0.171.0; Node (E8) | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| performance-engineer | Adaptador TOML do agente | `.codex/agents/performance-engineer.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| postgres-pro | Adaptador TOML do agente | `.codex/agents/postgres-pro.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| python-pro | Adaptador TOML do agente | `.codex/agents/python-pro.toml` | O1 | L1 | C | Codex 0.171.0; Python (E8) | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| qa-expert | Adaptador TOML do agente | `.codex/agents/qa-expert.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| react-specialist | Adaptador TOML do agente | `.codex/agents/react-specialist.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| security-auditor | Adaptador TOML do agente | `.codex/agents/security-auditor.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| sql-pro | Adaptador TOML do agente | `.codex/agents/sql-pro.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| test-automator | Adaptador TOML do agente | `.codex/agents/test-automator.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| typescript-pro | Adaptador TOML do agente | `.codex/agents/typescript-pro.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |
| ui-designer | Adaptador TOML do agente | `.codex/agents/ui-designer.toml` | O1 | L1 | C | Codex 0.171.0; definição canônica | D3, D5 | I1 | TP2 | TR2 | E1, E7, E13 | HOMOLOGADO COM RESSALVAS | Alocação real não comprovada |

### 6.2 OpenCode: 20 `.md`

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| accessibility-tester | Subagente OpenCode | `.opencode/agents/accessibility-tester.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| api-designer | Subagente OpenCode | `.opencode/agents/api-designer.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| backend-developer | Subagente OpenCode | `.opencode/agents/backend-developer.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| context-manager | Subagente OpenCode | `.opencode/agents/context-manager.md` | O3 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| csharp-reviewer | Subagente OpenCode | `.opencode/agents/csharp-reviewer.md` | O2 `agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` | L1 | O | OpenCode 1.19.0; .NET 10.0.402 | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| debugger | Subagente OpenCode | `.opencode/agents/debugger.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| docker-expert | Subagente OpenCode | `.opencode/agents/docker-expert.md` | O1 | L1 | O | OpenCode 1.19.0; Engine (E8) | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Engine indisponível |
| frontend-developer | Subagente OpenCode | `.opencode/agents/frontend-developer.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| nextjs-developer | Subagente OpenCode | `.opencode/agents/nextjs-developer.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| node-specialist | Subagente OpenCode | `.opencode/agents/node-specialist.md` | O1 | L1 | O | OpenCode 1.19.0; Node (E8) | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| performance-engineer | Subagente OpenCode | `.opencode/agents/performance-engineer.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| postgres-pro | Subagente OpenCode | `.opencode/agents/postgres-pro.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| python-pro | Subagente OpenCode | `.opencode/agents/python-pro.md` | O1 | L1 | O | OpenCode 1.19.0; Python (E8) | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| qa-expert | Subagente OpenCode | `.opencode/agents/qa-expert.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| react-specialist | Subagente OpenCode | `.opencode/agents/react-specialist.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| security-auditor | Subagente OpenCode | `.opencode/agents/security-auditor.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| sql-pro | Subagente OpenCode | `.opencode/agents/sql-pro.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| test-automator | Subagente OpenCode | `.opencode/agents/test-automator.md` | O1 | L1 | O | OpenCode 1.19.0; CI (E14) | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo; CI ausente |
| typescript-pro | Subagente OpenCode | `.opencode/agents/typescript-pro.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |
| ui-designer | Subagente OpenCode | `.opencode/agents/ui-designer.md` | O1 | L1 | O | OpenCode 1.19.0; definição canônica | D2, D3 | I2 | TP2 | TR2 | E3, E5, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com modelo |

### 6.3 Claude Code: 19 agentes

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| accessibility-tester | Adaptador Claude do agente | `.claude/agents/accessibility-tester.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| api-designer | Adaptador Claude do agente | `.claude/agents/api-designer.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| backend-developer | Adaptador Claude do agente | `.claude/agents/backend-developer.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| context-manager | Adaptador Claude do agente | `.claude/agents/context-manager.md` | O3 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| debugger | Adaptador Claude do agente | `.claude/agents/debugger.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| docker-expert | Adaptador Claude do agente | `.claude/agents/docker-expert.md` | O1 | L1 | K | CLI `claude`; Engine (E8) | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI; Engine indisponível |
| frontend-developer | Adaptador Claude do agente | `.claude/agents/frontend-developer.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| nextjs-developer | Adaptador Claude do agente | `.claude/agents/nextjs-developer.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| node-specialist | Adaptador Claude do agente | `.claude/agents/node-specialist.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| performance-engineer | Adaptador Claude do agente | `.claude/agents/performance-engineer.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| postgres-pro | Adaptador Claude do agente | `.claude/agents/postgres-pro.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| python-pro | Adaptador Claude do agente | `.claude/agents/python-pro.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| qa-expert | Adaptador Claude do agente | `.claude/agents/qa-expert.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| react-specialist | Adaptador Claude do agente | `.claude/agents/react-specialist.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| security-auditor | Adaptador Claude do agente | `.claude/agents/security-auditor.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| sql-pro | Adaptador Claude do agente | `.claude/agents/sql-pro.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| test-automator | Adaptador Claude do agente | `.claude/agents/test-automator.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| typescript-pro | Adaptador Claude do agente | `.claude/agents/typescript-pro.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |
| ui-designer | Adaptador Claude do agente | `.claude/agents/ui-designer.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e validar `Task` |

### 6.4 Claude Code: 14 adaptadores de skills

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| brainstorming | Interface Claude da skill canônica | `.claude/skills/brainstorming/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| context-degradation | Interface Claude da skill canônica | `.claude/skills/context-degradation/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| context-fundamentals | Interface Claude da skill canônica | `.claude/skills/context-fundamentals/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| context-optimization | Interface Claude da skill canônica | `.claude/skills/context-optimization/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| executing-plans | Interface Claude da skill canônica | `.claude/skills/executing-plans/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| finishing-a-development-branch | Interface Claude da skill canônica | `.claude/skills/finishing-a-development-branch/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| receiving-code-review | Interface Claude da skill canônica | `.claude/skills/receiving-code-review/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| requesting-code-review | Interface Claude da skill canônica | `.claude/skills/requesting-code-review/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| subagent-driven-development | Interface Claude da skill canônica | `.claude/skills/subagent-driven-development/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| systematic-debugging | Interface Claude da skill canônica | `.claude/skills/systematic-debugging/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| test-driven-development | Interface Claude da skill canônica | `.claude/skills/test-driven-development/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| using-git-worktrees | Interface Claude da skill canônica | `.claude/skills/using-git-worktrees/SKILL.md` | O1 | L1 | K, O | CLI `claude`; Git; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| verification-before-completion | Interface Claude da skill canônica | `.claude/skills/verification-before-completion/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |
| writing-plans | Interface Claude da skill canônica | `.claude/skills/writing-plans/SKILL.md` | O1 | L1 | K, O | CLI `claude`; skill canônica | D3, D5 | I3 | TP2 | TR4 | E4, E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | CLI ausente; duplicidade no O mitigada por env var |

### 6.5 Codex CLI: 8 skills de comando

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| typescript-scaffold | Criar projeto TypeScript: Next.js, Vite, Node ou biblioteca | `.codex/skills/typescript-scaffold/SKILL.md` | O1 | L1 | C | Codex 0.171.0; Node/npm | D1, D3 | I1 (`$typescript-scaffold`) | TP2 | TR2 | E1, E2, E7, E8 | HOMOLOGADO COM RESSALVAS | Execução do scaffold com modelo |
| component-scaffold | Criar componente React com tipos, teste, estilo e Storybook | `.codex/skills/component-scaffold/SKILL.md` | O1 | L1 | C | Codex 0.171.0; Node/npm | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7, E8 | HOMOLOGADO COM RESSALVAS | Execução do scaffold com modelo |
| python-scaffold | Criar projeto Python: FastAPI, Django, biblioteca ou CLI | `.codex/skills/python-scaffold/SKILL.md` | O1 | L1 | C | Codex 0.171.0; Python | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7, E8 | HOMOLOGADO COM RESSALVAS | Execução do scaffold com modelo |
| sql-migrations | Migração de banco sem parar o sistema | `.codex/skills/sql-migrations/SKILL.md` | O1 | L1 | C | Codex 0.171.0; banco de teste | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7 | HOMOLOGADO COM RESSALVAS | Execução controlada com banco isolado |
| test-generate | Gerar testes unitários com casos de borda e mocks | `.codex/skills/test-generate/SKILL.md` | O1 | L1 | C | Codex 0.171.0; runtime da stack | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7 | HOMOLOGADO COM RESSALVAS | Execução em projeto descartável |
| security-sast | Análise estática de segurança no código | `.codex/skills/security-sast/SKILL.md` | O1 | L1 | C | Codex 0.171.0; scanner SAST | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7 | HOMOLOGADO COM RESSALVAS | Execução com scanner real |
| deps-audit | Auditar dependências: vulnerabilidade, licença e risco | `.codex/skills/deps-audit/SKILL.md` | O1 | L1 | C | Codex 0.171.0; npm/pip/dotnet | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7, E8 | HOMOLOGADO COM RESSALVAS | Execução da auditoria |
| pr-enhance | Melhorar descrição, checklist e riscos de PR | `.codex/skills/pr-enhance/SKILL.md` | O1 | L1 | C | Codex 0.171.0; Git | D1, D3 | I1 | TP2 | TR2 | E1, E2, E7, E9 | HOMOLOGADO COM RESSALVAS | Execução em PR de teste |

## 7. Comandos — 24 itens

### 7.1 Definições canônicas: 8

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| /typescript-scaffold | Criar projeto TypeScript | `docs/ai/reference/commands/typescript-scaffold.md` | O1 | L1 | T | Ferramenta de IA; Node/npm | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução em projeto descartável |
| /component-scaffold | Criar componente React | `docs/ai/reference/commands/component-scaffold.md` | O1 | L1 | T | Ferramenta de IA; Node/npm | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução em projeto descartável |
| /python-scaffold | Criar projeto Python | `docs/ai/reference/commands/python-scaffold.md` | O1 | L1 | T | Ferramenta de IA; Python | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução em projeto descartável |
| /sql-migrations | Migração de banco sem indisponibilidade | `docs/ai/reference/commands/sql-migrations.md` | O1 | L1 | T | Ferramenta de IA; banco isolado | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Exige banco de teste autorizado |
| /test-generate | Gerar testes unitários | `docs/ai/reference/commands/test-generate.md` | O1 | L1 | T | Ferramenta de IA; runtime | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução em projeto descartável |
| /security-sast | Análise estática de segurança | `docs/ai/reference/commands/security-sast.md` | O1 | L1 | T | Ferramenta de IA; scanner | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução com scanner real |
| /deps-audit | Auditar dependências e licenças | `docs/ai/reference/commands/deps-audit.md` | O1 | L1 | T | Ferramenta de IA; gestor de pacotes | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução da auditoria |
| /pr-enhance | Melhorar PR com checklist e riscos | `docs/ai/reference/commands/pr-enhance.md` | O1 | L1 | T | Ferramenta de IA; Git | D3, D5 | I1, I2, I3 | TP1 | TR1 | E7, E12, E13 | PENDENTE DE TESTE OPERACIONAL | Execução em PR de teste |

### 7.2 OpenCode: 8 comandos

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| /typescript-scaffold | Adaptador OpenCode do comando | `.opencode/commands/typescript-scaffold.md` | O1 | L1 | O | OpenCode 1.19.0; Node/npm | D3, D5 | I2 | TP2 | TR2 | E3, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução do comando com modelo |
| /component-scaffold | Adaptador OpenCode do comando | `.opencode/commands/component-scaffold.md` | O1 | L1 | O | OpenCode 1.19.0; Node/npm | D3, D5 | I2 | TP2 | TR2 | E3, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução do comando com modelo |
| /python-scaffold | Adaptador OpenCode do comando | `.opencode/commands/python-scaffold.md` | O1 | L1 | O | OpenCode 1.19.0; Python | D3, D5 | I2 | TP2 | TR2 | E3, E7, E8, E13 | HOMOLOGADO COM RESSALVAS | Execução do comando com modelo |
| /sql-migrations | Adaptador OpenCode do comando | `.opencode/commands/sql-migrations.md` | O1 | L1 | O | OpenCode 1.19.0; banco isolado | D3, D5 | I2 | TP2 | TR2 | E3, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com banco de teste |
| /test-generate | Adaptador OpenCode do comando | `.opencode/commands/test-generate.md` | O1 | L1 | O | OpenCode 1.19.0; runtime | D3, D5 | I2 | TP2 | TR2 | E3, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução do comando com modelo |
| /security-sast | Adaptador OpenCode do comando | `.opencode/commands/security-sast.md` | O1 | L1 | O | OpenCode 1.19.0; scanner | D3, D5 | I2 | TP2 | TR2 | E3, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução com scanner real |
| /deps-audit | Adaptador OpenCode do comando | `.opencode/commands/deps-audit.md` | O1 | L1 | O | OpenCode 1.19.0; gestor de pacotes | D3, D5 | I2 | TP2 | TR2 | E3, E7, E13 | HOMOLOGADO COM RESSALVAS | Execução da auditoria |
| /pr-enhance | Adaptador OpenCode do comando | `.opencode/commands/pr-enhance.md` | O1 | L1 | O | OpenCode 1.19.0; Git | D3, D5 | I2 | TP2 | TR2 | E3, E7, E9, E13 | HOMOLOGADO COM RESSALVAS | Execução em PR de teste |

### 7.3 Claude Code: 8 comandos

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| /typescript-scaffold | Adaptador Claude do comando | `.claude/commands/typescript-scaffold.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /component-scaffold | Adaptador Claude do comando | `.claude/commands/component-scaffold.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /python-scaffold | Adaptador Claude do comando | `.claude/commands/python-scaffold.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /sql-migrations | Adaptador Claude do comando | `.claude/commands/sql-migrations.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /test-generate | Adaptador Claude do comando | `.claude/commands/test-generate.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /security-sast | Adaptador Claude do comando | `.claude/commands/security-sast.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /deps-audit | Adaptador Claude do comando | `.claude/commands/deps-audit.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |
| /pr-enhance | Adaptador Claude do comando | `.claude/commands/pr-enhance.md` | O1 | L1 | K | CLI `claude` indisponível | D3, D5 | I3 | TP2 | TR4 | E6, E7, E13 | PENDENTE DE DEPENDÊNCIA | Instalar CLI e testar `/<comando>` |

## 8. Ferramentas — 3 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| OpenAI Codex CLI 0.171.0 | Descoberta e uso de governança, skills e agentes | `codex.ps1` no PATH; `.codex/config.toml` | O5 | L3 | C | `AGENTS.md`; config válida; sem MCP | D4, D1, D5 | I1 | TP3 | TR2 | E1, E2, E7, E9 | HOMOLOGADO COM RESSALVAS | Execução com modelo; 4 notes/3 warn; agentes não listados no prompt-input |
| OpenCode 1.19.0 | Subagentes, comandos e skills com governança compartilhada | `opencode.ps1` no PATH; `opencode.json` | O5 | L3 | O | Config V1; `OPENCODE_DISABLE_CLAUDE_CODE_SKILLS=1` | D4, D2, D5 | I2 | TP3 | TR2 | E3, E4, E5, E7 | HOMOLOGADO COM RESSALVAS | Execução com modelo; revisar config se migrar para V2 |
| Claude Code | Terceira ferramenta do uso combinado | `claude` — não encontrado no PATH; `CLAUDE.md`, `.claude/settings.json` | O5 | L3 | K | CLI disponível; credencial configurada pelo usuário | D4, D5 | I3 | TP3 | TR4 | E6, E7 | PENDENTE DE DEPENDÊNCIA | Instalar CLI; validar entrypoint, permissões, `Task`, comandos e skills |

## 9. Itens descobertos não canônicos — 4 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| customize-opencode | Skill embutida listada pelo OpenCode | Interna ao OpenCode 1.19.0 | O5 | L3 | O | Instalação do OpenCode | D2 | I2 | TP2 | TR2 | E4 | DESCOBERTO | Não é canônica; não executada |
| 7 agentes embutidos OpenCode | Agentes padrão da ferramenta | Internos ao OpenCode 1.19.0 | O5 | L3 | O | Instalação do OpenCode | D2 | I2 | TP2 | TR2 | E5 | DESCOBERTO | Não são canônicos; não executados |
| 4 skills bundled Codex | Skills padrão do prompt do Codex | `~/.codex/skills/.system` (`r1`) | O5 | L3 | C | Instalação do Codex | D1 | I1 | TP2 | TR2 | E2 | DESCOBERTO | Não são canônicas; não executadas |
| 20 skills do cache de plugin Postman | Itens do cache de plugin listados no prompt | Cache de plugin (`r2`) | O5 | L3 | C | Plugin instalado no ambiente | D1 | I1 | TP2 | TR2 | E2 | DESCOBERTO | Não são canônicas; fora do repositório |

## 10. Dependências externas — 16 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Git 2.55.0.windows.5 | Consulta de versão, status, diff e log | `git` no PATH | O5 | L3 | C, O, K | Nenhuma para leitura | D4, D5 | I4 | TP4 | TR3 | E8, E9 | HOMOLOGADO | Escopo apenas leitura/verificação; sem commit ou push |
| PowerShell 5.1 | Shell do ambiente e execução de consultas | `powershell.exe` | O5 | L3 | C, O, K | Windows | D4 | I4 | TP4 | TR3 | E8 | CONFIGURADO | Sem teste funcional além de versão |
| PowerShell 7.7.0 | Shell alternativo (`pwsh`) | `pwsh` no PATH | O5 | L3 | C, O, K | Windows | D4 | I4 | TP4 | TR3 | E8 | CONFIGURADO | Sem teste funcional além de versão |
| .NET SDK 10.0.402 | Suporte documental a revisão C# | `dotnet` no PATH | O5 | L3 | O | SDK instalado | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Sem build executado neste repositório documental |
| Node 24.20.0 | Runtime para stacks TypeScript/React | `node` no PATH | O5 | L3 | C, O | Nenhuma para consulta | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Sem build ou scaffold executado |
| npm 11.19.0 | Gestor de pacotes Node | `npm` no PATH | O5 | L3 | C, O | Node 24.20.0 | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Nenhuma instalação executada |
| Python 3.13.15 | Runtime para stacks Python e MarkItDown | `python` no PATH | O5 | L3 | C, O | Nenhuma para consulta | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Sem execução de projeto |
| Docker CLI 29.8.2 | Cliente Docker | `docker` no PATH | O5 | L3 | C, O | Engine em execução | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Engine indisponível impede uso |
| Docker Engine | Daemon necessário para containers | `npipe:////./pipe/dockerDesktopLinuxEngine` | O5 | L3 | C, O | Docker Desktop/daemon ativo | D4 | I4 | TP5 | TR5 | E8 | PENDENTE DE DEPENDÊNCIA | Iniciar/configurar daemon com autorização |
| Docker Compose 5.6.0 | Orquestração local declarativa | `docker compose` | O5 | L3 | C, O | Docker Engine | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Engine indisponível; nenhum Compose executado |
| WSL 3.0.5.0 | Subsistema Windows para Linux | `wsl` no PATH | O5 | L3 | C, O | Windows com WSL habilitado | D4 | I4 | TP5 | TR3 | E8 | CONFIGURADO | Sem distribuição executada nesta tarefa |
| uv | Instalador exigido por `specify-cli` | `uv` — não encontrado | O5 | L3 | C, O | Instalação autorizada | D4 | I5 | TP5 | TR4 | E6 | PENDENTE DE DEPENDÊNCIA | Comando `uv tool install specify-cli` não executado |
| Specify CLI | Ferramenta open-source Spec Kit exigida por `spec-kit-sdd` | `specify` — não encontrado | O5 | L3 | C, O | `uv` instalado | D4 | I5 | TP5 | TR4 | E6, E7 | PENDENTE DE DEPENDÊNCIA | Instalação documentada, não executada |
| MarkItDown CLI | Conversão de documentos exigida por `markitdown-convert` | `markitdown` — não encontrado | O5 | L3 | C, O | Python 3.13.15 | D4 | I5 | TP5 | TR4 | E6, E7 | PENDENTE DE DEPENDÊNCIA | `pip install "markitdown[all]"` não executado |
| Microsoft Learn CLI | Consulta oficial exigida por `microsoft-docs` | Learn CLI — não encontrado | O5 | L3 | C, O | Node/npm | D4 | I5 | TP5 | TR4 | E6, E7 | PENDENTE DE DEPENDÊNCIA | `npm install -g @microsoft/learn-cli` não executado |
| MCPs não configurados | Integrações externas via protocolo MCP | Nenhuma entrada de MCP em `codex doctor` | O5 | L3 | C, O, K | Configuração e autorização de acesso | D1, D5 | I5 | TP3 | TR4 | E1, E7 | PENDENTE DE DEPENDÊNCIA | Configurar e testar somente com autorização |

## 11. Validador permanente e pipeline CI — 2 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| Validador permanente | Repetir hashes, integridade, frontmatter, links, segredos e `git diff --check` | Ausente no repositório; apenas `final_validate.ps1` temporário fora do Git | O4 | L4 | C, O, K | Aprovação explícita para criar script versionado | D3, D5 | I5 | TP7 | TR4 | E7, E14 | BLOQUEADO | Criar e versionar script exige aprovação; não há validador permanente |
| Pipeline CI | Executar validação automática em cada PR antes de homologação | Ausente: nenhum `.github/workflows` nem YAML de pipeline | O4 | L4 | — | Aplicação executável, gates e autorização de automação | D3, D5 | I5 | TP7 | TR4 | E14 | INCOMPATÍVEL | Repositório documental; capacidade apenas planejada em `README.md` e `docs/architecture/devops.md` |

## 12. Pacotes VEYLOQ restritos — 18 itens

| Nome | Finalidade | Caminho | Origem | Licença | Ferramenta | Dependências | Descoberta | Invocação | Teste previsto | Teste realizado | Evidência | Resultado | Pendências |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| agente-arquiteto-de-backend-v1.0-agents.zip | Referência original de agente | `docs/veyloq/agente-arquiteto-de-backend-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não extrair, publicar ou redistribuir sem autorização |
| agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip | Origem do `csharp-reviewer` | `docs/veyloq/agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Componente instalado; ZIP permanece local |
| agente-revisor-de-react-v1.0-agents.zip | Referência original de agente | `docs/veyloq/agente-revisor-de-react-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não extrair, publicar ou redistribuir sem autorização |
| agente-revisor-de-typescript-v1.0-agents.zip | Referência original de agente | `docs/veyloq/agente-revisor-de-typescript-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não extrair, publicar ou redistribuir sem autorização |
| awesome-llm-apps-guia-v1.0-agents.zip | Guia de referência local | `docs/veyloq/awesome-llm-apps-guia-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não extrair, publicar ou redistribuir sem autorização |
| blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip | Origem da skill `blueprint` | `docs/veyloq/blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Componente instalado; ZIP permanece local |
| equipe-de-agentes-back-end-v1.0-agents.zip | Referência de equipe de agentes | `docs/veyloq/equipe-de-agentes-back-end-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não instalar separadamente sem aprovação |
| equipe-de-agentes-dados-v1.0-agents.zip | Referência de equipe de agentes | `docs/veyloq/equipe-de-agentes-dados-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não instalar separadamente sem aprovação |
| equipe-de-agentes-front-end-v1.0-agents.zip | Referência de equipe de agentes | `docs/veyloq/equipe-de-agentes-front-end-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não instalar separadamente sem aprovação |
| markitdown-documentos-para-a-ia-v1.0-agents.zip | Origem da skill `markitdown-convert` | `docs/veyloq/markitdown-documentos-para-a-ia-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Componente instalado; ZIP permanece local |
| microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip | Origem da skill `microsoft-docs` | `docs/veyloq/microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Componente instalado; ZIP permanece local |
| pacote-desenvolvimento-com-ia-v1.0-agents.zip | Origem do bundle com 6 kits, 14 skills e 8 comandos | `docs/veyloq/pacote-desenvolvimento-com-ia-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | 99 arquivos preservados; ZIP permanece local |
| spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip | Origem da skill `spec-kit-sdd` | `docs/veyloq/spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Componente instalado; ZIP permanece local |
| sql-code-review-revisao-de-sql-e-seguranca-v1.0-agents.zip | Origem da skill `sql-code-review` | `docs/veyloq/sql-code-review-revisao-de-sql-e-seguranca-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Componente instalado; ZIP permanece local |
| superpowers-fluxo-de-entrega-v1.0-agents.zip | Referência de kit com conteúdo sobreposto ao bundle | `docs/veyloq/superpowers-fluxo-de-entrega-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não duplicar conteúdo em `kits/` |
| superpowers-git-worktrees-v1.0-agents.zip | Referência de skill sobreposta ao bundle | `docs/veyloq/superpowers-git-worktrees-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não instalar separadamente sem aprovação |
| superpowers-metodo-completo-v1.0-agents.zip | Referência de kit com conteúdo sobreposto ao bundle | `docs/veyloq/superpowers-metodo-completo-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não duplicar conteúdo em `kits/` |
| ui-ux-pro-max-design-system-v1.0-agents.zip | Referência local de skill de design | `docs/veyloq/ui-ux-pro-max-design-system-v1.0-agents.zip` | O2 | L2 | — | Autorização de redistribuição | D3, D5 | I5 | TP6 | TR4 | E10, E11 | BLOQUEADO | Não extrair, publicar ou redistribuir sem autorização |

## 13. Tabela-resumo

| Categoria | Contagem | Critério aplicado nesta matriz |
|---|---:|---|
| HOMOLOGADO | 1 | Único item com execução real registrada: Git, restrito a comandos de leitura/verificação |
| HOMOLOGADO COM RESSALVAS | 57 | Configuração/descoberta de Codex e OpenCode validadas, sem execução de skills/agentes com modelo |
| CONFIGURADO | 9 | Versões confirmadas por comando de consulta; sem teste funcional do runtime |
| DESCOBERTO | 4 | Itens não canônicos listados pelas ferramentas; fora do inventário governado |
| PENDENTE DE TESTE OPERACIONAL | 47 | Skills, agentes e comandos canônicos: descoberta/integridade verificadas, nenhuma execução com modelo |
| PENDENTE DE DEPENDÊNCIA | 48 | Adaptadores Claude (19 agentes + 14 skills + 8 comandos), ferramenta Claude, Docker Engine, uv, Specify, MarkItDown, Learn CLI e MCPs |
| BLOQUEADO | 19 | 18 ZIPs restritos por licenciamento e validador permanente ausente |
| INCOMPATÍVEL | 1 | Pipeline CI: repositório documental, sem aplicação ou workflow implementado |
| **Total** | **186** | 19 skills + 20 agentes + 80 adaptadores + 24 comandos + 3 ferramentas + 4 descobertas + 16 dependências + 2 governança/CI + 18 ZIPs |

Regras finais reforçadas: nenhum item desta matriz foi promovido a `HOMOLOGADO` por descoberta ou leitura de arquivo; nenhum agente ou skill foi executado com modelo nesta tarefa; a ausência de teste operacional controlado mantém os itens aplicáveis como `PENDENTE` perante `AGENTS.md`.
