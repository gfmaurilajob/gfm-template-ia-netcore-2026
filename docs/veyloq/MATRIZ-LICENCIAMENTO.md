# Matriz de licenciamento — GFM.Template / pacotes VEYLOQ

Data da auditoria: 24/11/2026. No ato da auditoria a varredura foi documental e somente leitura: nenhum ZIP foi extraído, renomeado ou modificado. A consolidação posterior do template e o commit local não alteram as classificações abaixo. Contagem por ZIP, arquivo instalado ou grupo lógico explicitado.

## 1. Regras de decisão

Categorias admitidas, e somente elas: `AUTORIA PRÓPRIA`, `REDISTRIBUIÇÃO PERMITIDA`, `REDISTRIBUIÇÃO CONDICIONAL`, `USO LOCAL`, `LICENÇA INDETERMINADA`, `PUBLICAÇÃO BLOQUEADA`.

1. O `LICENSE.txt` da raiz de cada um dos 18 ZIPs tem o mesmo texto e estabelece: itens de terceiros seguem a licença original registrada em `ATTRIBUTION.md` (autor, repositório e commit), valendo no lugar das regras gerais; textos escritos pela VEYLOQ (páginas, instruções e guias de uso) seguem a licença de uso da VEYLOQ — uso pessoal e profissional, "sem redistribuir nem revender como se fossem seus"; VEYLOQ é marca da GAX TECH LTDA, CNPJ 59.313.787/0001-94.
2. Repositório privado, presença no Git e instalação local **não** são autorização de redistribuição. Sem autorização comprovada por escrito, ZIPs e textos VEYLOQ são `USO LOCAL` e `PUBLICAÇÃO BLOQUEADA`.
3. Licença de terceiro registrada autoriza apenas o item de terceiro, desde que o aviso de copyright, o texto da licença (MIT ou Apache-2.0) e os créditos sejam preservados integralmente: `REDISTRIBUIÇÃO CONDICIONAL`. Isso não se estende ao texto VEYLOQ nem ao ZIP completo.
4. Material elaborado neste repositório, sem crédito de terceiro, é `AUTORIA PRÓPRIA`.
5. Sem registro verificável de licença ou autoria, usa-se `LICENÇA INDETERMINADA`. Não se presume licença por semelhança com outro arquivo.
6. `REDISTRIBUIÇÃO PERMITIDA` exige autorização expressa e verificável; nenhum item desta auditoria satisfaz esse critério no momento.

## 2. Auditoria individual dos 18 ZIPs

Nomes, tipos/slugs e SHA-256 abaixo são os registrados em `docs/veyloq/README.md`. "Rastreado" = presente no `git ls-files`; "não rastreado" = arquivo local ainda sem histórico de commit. Todos os 18 contêm `manifest.json`, `README.md`, `LICENSE.txt` e `ATTRIBUTION.md`, com `format: 1`, `version: 1.0` e publicação em 05/11/2026.

| # | ZIP · tipo/slug | SHA-256 | Git | Licença de terceiro em `ATTRIBUTION.md` | Classificação do ZIP completo |
|---:|---|---|---|---|---|
| 1 | `agente-arquiteto-de-backend-v1.0-agents.zip` · agent · `agente-arquiteto-de-backend` | `89b7b1cef6490585d4eaf1914c661d5bf9cf0a113c5cb350bb4357166e4803cc` | rastreado | MIT — wshobson/agents | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 2 | `agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` · agent · `agente-revisor-de-csharp-e-dotnet` | `9a499592add27da4c3ba6501869bc6821b1dfbd34fd74fcdb75c3bcdfd11ffcc` | rastreado | MIT — Everything Claude Code (affaan-m) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 3 | `agente-revisor-de-react-v1.0-agents.zip` · agent · `agente-revisor-de-react` | `bf671a472e977eefa44db8863b6288df9aa2204327a42f2282d88cc1554b53dd` | rastreado | MIT — Everything Claude Code (affaan-m) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 4 | `agente-revisor-de-typescript-v1.0-agents.zip` · agent · `agente-revisor-de-typescript` | `8017288c554a4415dc7fb886c23fcdee2775c78b61a43b6b732818c6894a0a9f` | rastreado | MIT — Everything Claude Code (affaan-m) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 5 | `awesome-llm-apps-guia-v1.0-agents.zip` · guide · `awesome-llm-apps-guia` | `3804a2df2b7348c18b9cdd6544ed60c47cae8e7a51379804aaa0d7bc41b32817` | rastreado | Apache-2.0 — Shubham Saboo | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 6 | `blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip` · skill · `blueprint-plano-de-obra-em-varias-sessoes` | `f83753c5b7010ba4f82f076111def63fa9abf09206c7c9c664a5d0c467c064bd` | não rastreado | MIT — Everything Claude Code (affaan-m) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 7 | `equipe-de-agentes-back-end-v1.0-agents.zip` · agent_team · `equipe-de-agentes-back-end` | `87cc246bed47f7a6f2b96c4cddeeefb72bac83e18b56ad0bb32c7db511ec1ba9` | rastreado | MIT — VoltAgent | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 8 | `equipe-de-agentes-dados-v1.0-agents.zip` · agent_team · `equipe-de-agentes-dados` | `d4fc63c924df45447839b1c720332cb29997c91f00c8bde0ab1b9f44ebc51b33` | rastreado | MIT — VoltAgent | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 9 | `equipe-de-agentes-front-end-v1.0-agents.zip` · agent_team · `equipe-de-agentes-front-end` | `8d2ad0b61cd452f3f5eae4cb29ac93be761917f40be7fd7aa020e6be127724e1` | rastreado | MIT — VoltAgent | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 10 | `markitdown-documentos-para-a-ia-v1.0-agents.zip` · skill · `markitdown-documentos-para-a-ia` | `b1d1085c383cf8b193b8f57a5310429c35a14b05542e6ffbcce7087f44efdc9e` | não rastreado | MIT — Microsoft Corporation | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 11 | `microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip` · skill · `microsoft-docs-a-ia-consulta-a-documentacao-oficial` | `7df08b1b0d803e1c8aaf3fa51e0091631436e91b1ccf3ba3ed7c965b817a4aed` | não rastreado | MIT — Microsoft | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 12 | `pacote-desenvolvimento-com-ia-v1.0-agents.zip` · bundle · `pacote-desenvolvimento-com-ia` | `a07411330af58267a324f8a4131e70822b0d251c4c78f4bda98d06be9a2ba640` | rastreado | MIT — 40 blocos (Superpowers, VoltAgent, wshobson/agents, Muratcan Koylan) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 13 | `spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip` · skill · `spec-kit-desenvolvimento-guiado-por-especificacao` | `2b45f3e5ae1613f5b0a5e87490f8b53e315e32639a86a994b194418ead655fc5` | não rastreado | MIT — GitHub, Inc. (spec-kit) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 14 | `sql-code-review-revisao-de-sql-e-seguranca-v1.0-agents.zip` · skill · `sql-code-review-revisao-de-sql-e-seguranca` | `770df3b7c6da5768fe93d5e4cb6d9e9f9b9f772fd89685086a334758a9ca6b8f` | rastreado | MIT — GitHub awesome-copilot contributors | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 15 | `superpowers-fluxo-de-entrega-v1.0-agents.zip` · kit · `superpowers-fluxo-de-entrega` | `12f91c589212cbc2bc4cf90624bbc5091b5994398fc48eb3d21f43efd9ca101c` | rastreado | MIT — Jesse Vincent (7 blocos) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 16 | `superpowers-git-worktrees-v1.0-agents.zip` · skill · `superpowers-git-worktrees` | `b4dba33c4d5b6d464f80463d9aa1d0c98634cef6a34fa9b6898eb0fdfa3c012e` | rastreado | MIT — Jesse Vincent | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 17 | `superpowers-metodo-completo-v1.0-agents.zip` · kit · `superpowers-metodo-completo` | `9119e0a2acaf7192d9b1b6fca37bd50c0b70fbe66ba67143dc2d5d1278e9d442` | rastreado | MIT — Jesse Vincent (4 blocos) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| 18 | `ui-ux-pro-max-design-system-v1.0-agents.zip` · skill · `ui-ux-pro-max-design-system` | `d50541889875c769ff7144fa7f85d3f856be367d454b3dc508eb01b803c206f2` | rastreado | MIT — Next Level Builder | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |

Total: 14 rastreados e 4 não rastreados (itens 6, 10, 11 e 13). A parte de terceiros dos 18 ZIPs é `REDISTRIBUIÇÃO CONDICIONAL` enquanto MIT/Apache-2.0 e créditos forem mantidos; essa condição não autoriza publicar o ZIP nem o texto VEYLOQ. Não há licença registrada para "VEYLOQ" além da regra de uso pessoal/profissional do `LICENSE.txt`, portanto `REDISTRIBUIÇÃO PERMITIDA` não se aplica.

## 3. Componentes instalados, adaptadores e artefatos derivados

### 3.1 Cinco componentes VEYLOQ instalados

| Componente | ZIP de origem | Arquivos instalados | ID no relatório | Terceiro registrado | Classificação |
|---|---|---|---|---|---|
| `blueprint` | item 6 | `.agents/skills/blueprint/SKILL.md` + `LICENSE.txt` | `ddf49518-56d9-4a07-8d10-79f901408eab` | MIT, ECC/affaan-m (`ATTRIBUTION.md:1365`) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| `spec-kit-sdd` | item 13 | `.agents/skills/spec-kit-sdd/SKILL.md` (sem `LICENSE.txt` local) | `4fb0defb-8194-4f3a-856c-61c76b0655af` | MIT, github/spec-kit (`ATTRIBUTION.md:1433`) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| `markitdown-convert` | item 10 | `.agents/skills/markitdown-convert/SKILL.md` (sem `LICENSE.txt` local) | `6dde8afd-ba5a-45ac-b6c5-46ff9e98e828` | MIT, microsoft/markitdown (`ATTRIBUTION.md:1439`) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| `microsoft-docs` | item 11 | `.agents/skills/microsoft-docs/SKILL.md` + `LICENSE.txt` | `bc82f24d-a16f-4454-ab70-f2f458ad95d3` | MIT, microsoft/skills (`ATTRIBUTION.md:1445`) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |
| `sql-code-review` | item 14 | `.agents/skills/sql-code-review/SKILL.md` + `LICENSE.txt` | `21bc67b3-1bd4-428b-85f3-9aabb694de47` | MIT, github/awesome-copilot (`ATTRIBUTION.md:1479`) | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` |

A ausência de `LICENSE.txt` local em `spec-kit-sdd` e `markitdown-convert` não altera a classificação: a licença MIT do terceiro está registrada em `ATTRIBUTION.md` e no ZIP, mas o texto de instrução escrito/revisado pela VEYLOQ continua sem autorização de redistribuição.

### 3.2 Skills, scripts e adaptadores de skill

- 14 skills originais canônicas — `brainstorming`, `context-degradation`, `context-fundamentals`, `context-optimization`, `executing-plans`, `finishing-a-development-branch`, `receiving-code-review`, `requesting-code-review`, `subagent-driven-development`, `systematic-debugging`, `test-driven-development`, `using-git-worktrees`, `verification-before-completion`, `writing-plans` —: `REDISTRIBUIÇÃO CONDICIONAL`, enquanto MIT, `LICENSE.txt`, `ATTRIBUTION.md` e a linha de crédito forem preservados.
- 5 skills VEYLOQ instaladas: `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` (seção 3.1). Total canônico: 19 skills.
- 14 adaptadores em `.claude/skills/` espelham as 14 originais: `REDISTRIBUIÇÃO CONDICIONAL`. As 5 skills VEYLOQ não têm adaptador Claude Code.
- 15 scripts internos das skills originais (`.agents/skills/**/scripts/*` e `find-polluter.sh`): herdam a MIT do respectivo pacote, `REDISTRIBUIÇÃO CONDICIONAL` com avisos e créditos preservados.

### 3.3 Agentes canônicos e adaptadores

- 18 agentes originais — `frontend-developer`, `react-specialist`, `nextjs-developer`, `typescript-pro`, `ui-designer`, `accessibility-tester`, `backend-developer`, `api-designer`, `node-specialist`, `python-pro`, `sql-pro`, `postgres-pro`, `docker-expert`, `qa-expert`, `test-automator`, `debugger`, `security-auditor`, `performance-engineer` —: `REDISTRIBUIÇÃO CONDICIONAL` (MIT registrada; `agents/<nome>/LICENSE.txt` preservado).
- `csharp-reviewer`: `REDISTRIBUIÇÃO CONDICIONAL` — MIT de ECC/affaan-m em `ATTRIBUTION.md:1399`; definição em `docs/ai/reference/agents/csharp-reviewer.md`, adaptador em `.opencode/agents/csharp-reviewer.md` e licença em `agents/csharp-reviewer/LICENSE.txt`. Adaptadores Codex e Claude Code ausentes.
- `context-manager`: `AUTORIA PRÓPRIA` — criado neste repositório para atender às referências históricas (`docs/ai/reference/agents/context-manager.md:12`), com adaptadores em `.codex/agents/context-manager.toml`, `.opencode/agents/context-manager.md` e `.claude/agents/context-manager.md`.
- 58 arquivos adaptadores de agente (19 Codex + 20 OpenCode + 19 Claude): 55 `REDISTRIBUIÇÃO CONDICIONAL` e 3 `AUTORIA PRÓPRIA` (os adaptadores de `context-manager`). Total canônico: 20 agentes.

### 3.4 Comandos

8 comandos canônicos em `docs/ai/reference/commands/`, 8 skills de comando em `.codex/skills/`, 8 adaptadores em `.opencode/commands/` e 8 em `.claude/commands/` (32 itens), com `LICENSE.txt` em `commands/<comando>/` e MIT de wshobson/agents registrada em `ATTRIBUTION.md`: `REDISTRIBUIÇÃO CONDICIONAL` com aviso e crédito preservados.

### 3.5 Kits, documentação, configurações e demais artefatos

| Artefato | Classificação | Base evidencial |
|---|---|---|
| 6 kits em `kits/` (4 próprios do bundle e 2 Superpowers) | `REDISTRIBUIÇÃO CONDICIONAL` | MIT registrada em `ATTRIBUTION.md`; créditos e licenças mantidos |
| 7 configurações/governança: `AGENTS.md`, `CLAUDE.md`, `opencode.json`, `.claude/settings.json`, `.codex/config.toml`, `.gitignore`, `.opencode/.gitignore` | `AUTORIA PRÓPRIA` | textos e permissões definidos neste repositório |
| 13 documentos próprios: `README.md`, `docs/ai/CATALOGO.md`, `docs/ai/FLUXO-OFICIAL-DESENVOLVIMENTO-IA.md`, `docs/ai/MATRIZ-HOMOLOGACAO.md`, `docs/ai/reference/AGENTS-index.md`, `docs/ai/reference/AGENTS-original.md`, `docs/ai/reference/AGENTS-original.sha256.txt`, `docs/veyloq/README.md`, 4 relatórios em `reports/`, mais este `docs/veyloq/MATRIZ-LICENCIAMENTO.md` | `AUTORIA PRÓPRIA` | redação local; preservação verificável por hash em `AGENTS-original.sha256.txt` |
| 33 documentos/diagramas derivados do projeto: 30 arquivos em `docs/architecture/`, `docs/GUIA-INICIO-NOVO-PROJETO.md`, `docs/PROMPT-INICIAL-NOVO-PROJETO.md`, `bundles/pacote-desenvolvimento-com-ia/pacote-desenvolvimento-com-ia.md` | `AUTORIA PRÓPRIA` | texto e diagramas locais do GFM.Template, sem crédito de terceiro |
| `docs/veyloq/leia.txt` e `docs/veyloq/links-candidatos.txt` | `USO LOCAL` + `PUBLICAÇÃO BLOQUEADA` | instruções e guias de uso escritos pela VEYLOQ |
| `docs/o-guia-da-ia-para-devs.pdf` (8.840.590 bytes) | `LICENÇA INDETERMINADA` | sem entrada em `ATTRIBUTION.md`, sem `LICENSE.txt` e sem metadado de licença verificável |
| Scripts temporários de validação citados no relatório, fora do Git (`%TEMP%\opencode\...`) | `LICENÇA INDETERMINADA` | não versionados e sem licença registrada; fora da contagem de itens do repositório |

Não há diretório `scripts/` na raiz do repositório. Os 18 ZIPs permanecem em referência local; os 4 não rastreados não foram incluídos em stage.

## 4. Tabela-resumo

Contagens por tipo de item; um item pode aparecer em duas categorias quando é `USO LOCAL` e, ao mesmo tempo, `PUBLICAÇÃO BLOQUEADA`. Granularidades diferentes (por exemplo, skill e script dentro dela) são contadas separadamente e somadas ao final.

| Categoria | Itens | Composição |
|---|---:|---|
| `AUTORIA PRÓPRIA` | 57 | 1 agente `context-manager` + 3 adaptadores + 7 configurações + 13 documentos próprios + 33 documentos/diagramas derivados |
| `REDISTRIBUIÇÃO PERMITIDA` | 0 | nenhum item com autorização expressa e verificável |
| `REDISTRIBUIÇÃO CONDICIONAL` | 155 | 14 skills + 19 agentes + 55 adaptadores de agente + 14 adaptadores de skill + 32 comandos + 6 kits + 15 scripts |
| `USO LOCAL` | 25 | 18 ZIPs + 5 componentes VEYLOQ instalados + 2 textos em `docs/veyloq/` |
| `LICENÇA INDETERMINADA` | 1 | PDF sem registro de licença (mais scripts temporários externos, fora da contagem) |
| `PUBLICAÇÃO BLOQUEADA` | 25 | os mesmos 25 itens `USO LOCAL` |
| **Itens avaliados (sem duplicar categorias)** | **238** | 57 + 0 + 155 + 25 + 1 |

## 5. Ações futuras de regularização do histórico

1. Os 14 ZIPs rastreados e os textos instalados a partir do bundle já estão em commits anteriores: os dois primeiros passaram por `1c09ead` e `7f30460`; os 14 estão registrados no commit `246627f`; skills, adaptadores, `ATTRIBUTION.md`, `docs/veyloq/README.md` e o relatório de reorganização entraram no commit `5e6cf4f`. Os 4 ZIPs instalados na última rodada continuam não rastreados.
2. Não reescrever histórico, remover commits, alterar branch principal, tags ou remote sem autorização explícita. A presença passada no histórico é evidência de posse, não de autorização de redistribuição.
3. Solicitar à VEYLOQ/GAX TECH LTDA autorização por escrito, enumerando cada ZIP, texto e destino de publicação. Somente com essa prova um item VEYLOQ pode sair de `USO LOCAL`/`PUBLICAÇÃO BLOQUEADA` para `REDISTRIBUIÇÃO CONDICIONAL` ou `REDISTRIBUIÇÃO PERMITIDA`.
4. Manter os 4 ZIPs não rastreados fora do stage e não executar push até decisão formal. Se a autorização for negada, manter referência local e tratar eventual remoção de publicação futura como alteração normal, aprovada e auditável — nunca como reescrita do passado.
5. Em qualquer redistribuição futura de itens de terceiro, preservar integralmente `ATTRIBUTION.md`, `LICENSE.txt`, avisos de copyright e commits de origem; classificar esses itens como `REDISTRIBUIÇÃO CONDICIONAL`. A exceção registrada é `awesome-llm-apps-guia`, cujo terceiro é Apache-2.0, não MIT.
6. Regularizar `docs/o-guia-da-ia-para-devs.pdf`: obter fonte/licença verificável ou mantê-lo como `LICENÇA INDETERMINADA` e fora de qualquer publicação até nova decisão.

## 6. Evidências

- `LICENSE.txt` na raiz dos 18 ZIPs: regra de terceiros, regra dos textos VEYLOQ, proibição de redistribuir/revender como se fossem seus e titularidade da marca.
- `ATTRIBUTION.md` (1.511 linhas): autor, repositório, commit e texto integral das licenças; blocos dos componentes instalados nas linhas 1365, 1399, 1433, 1439, 1445 e 1479; Apache-2.0 no ZIP `awesome-llm-apps-guia-v1.0-agents.zip`.
- `docs/veyloq/README.md`: inventário oficial com nomes, tipos/slugs, entradas, bytes, SHA-256 e origens dos 18 ZIPs; seções "Licenças e restrições" e "Relação com os componentes instalados".
- `reports/RELATORIO-REORGANIZACAO-VEYLOQ-GFM-IA-2026-11-24.txt`: seções 4 (inventário), 5 (IDs instalados), 7 (validação), 9 (bloqueios e decisões) e 10 (resultado).
- `docs/ai/CATALOGO.md` e `docs/ai/reference/agents/context-manager.md`: contagens de skills/agentes/adaptadores e origem de `context-manager`.
- `git ls-files`, `git status --short --untracked-files=all` e `git log --oneline`: 14 ZIPs rastreados, 4 não rastreados e os commits `1c09ead`, `7f30460`, `246627f` e `5e6cf4f`.
