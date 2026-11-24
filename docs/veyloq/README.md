# Pacotes originais VEYLOQ

## Finalidade

Este diretório é a localização oficial dos arquivos ZIP originais da VEYLOQ preservados neste repositório. Use caminhos relativos à raiz: `docs/veyloq/<arquivo>.zip`.

Os ZIPs são referências originais e somente leitura. Não extraia, modifique, renomeie ou exclua estes arquivos. A instalação de componentes deve ser feita a partir do conteúdo da pasta `agents/` para a raiz do repositório, conforme o `README.md` de cada pacote, sem sobrescrever arquivos existentes sem autorização.

## Caminhos anteriores

O Git registra duas movimentações anteriores, preservadas nos relatórios históricos de `reports/`:

- `pacote-desenvolvimento-com-ia-v1.0-agents.zip` esteve na raiz no commit `1c09ead`, passou para `docs/` no commit `7f30460` e hoje está em `docs/veyloq/`.
- `agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` esteve em `docs/` no commit `7f30460` e hoje está em `docs/veyloq/`.
- Os outros 12 ZIPs foram adicionados diretamente em `docs/veyloq/` no commit `246627f`.
- Os quatro ZIPs instalados nesta rodada (`blueprint`, `spec-kit`, `markitdown`, `microsoft-docs`) também foram movidos manualmente para `docs/veyloq/`; não possuem histórico de commit próprio até a presente reorganização.

Evidências antigas que citam `docs/` ou a raiz não foram reescritas: `reports/RELATORIO-AUDITORIA-PACOTE-IA-2026-11-23.txt`, `reports/RELATORIO-HOMOLOGACAO-3-IAS-2026-11-23.txt` e `reports/RELATORIO-HOMOLOGACAO-FINAL-GFM-IA-2026-11-23.txt`.

## Inventário

Todos os pacotes declaram `format: 1`, `version: 1.0` e publicação em 05/11/2026 nos respectivos `manifest.json`. O SHA-256 abaixo foi calculado sobre o arquivo ZIP completo; a integridade foi confirmada pela leitura integral de todas as entradas, sem gravação do conteúdo extraído.

| Arquivo | Tipo / slug | Entradas | Bytes | SHA-256 | Origem registrada |
|---|---|---:|---:|---|---|
| `agente-arquiteto-de-backend-v1.0-agents.zip` | agent · `agente-arquiteto-de-backend` | 6 | 10332 | `89b7b1cef6490585d4eaf1914c661d5bf9cf0a113c5cb350bb4357166e4803cc` | `https://app.veyloq.org/agents/agente-arquiteto-de-backend` |
| `agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` | agent · `agente-revisor-de-csharp-e-dotnet` | 6 | 6276 | `9a499592add27da4c3ba6501869bc6821b1dfbd34fd74fcdb75c3bcdfd11ffcc` | `https://app.veyloq.org/agents/agente-revisor-de-csharp-e-dotnet` |
| `agente-revisor-de-react-v1.0-agents.zip` | agent · `agente-revisor-de-react` | 6 | 8575 | `bf671a472e977eefa44db8863b6288df9aa2204327a42f2282d88cc1554b53dd` | `https://app.veyloq.org/agents/agente-revisor-de-react` |
| `agente-revisor-de-typescript-v1.0-agents.zip` | agent · `agente-revisor-de-typescript` | 6 | 7622 | `8017288c554a4415dc7fb886c23fcdee2775c78b61a43b6b732818c6894a0a9f` | `https://app.veyloq.org/agents/agente-revisor-de-typescript` |
| `awesome-llm-apps-guia-v1.0-agents.zip` | guide · `awesome-llm-apps-guia` | 5 | 3852 | `3804a2df2b7348c18b9cdd6544ed60c47cae8e7a51379804aaa0d7bc41b32817` | `https://app.veyloq.org/guides/awesome-llm-apps-guia` |
| `blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip` | skill · `blueprint-plano-de-obra-em-varias-sessoes` | 6 | 5986 | `f83753c5b7010ba4f82f076111def63fa9abf09206c7c9c664a5d0c467c064bd` | `https://app.veyloq.org/skills/blueprint-plano-de-obra-em-varias-sessoes` |
| `equipe-de-agentes-back-end-v1.0-agents.zip` | agent_team · `equipe-de-agentes-back-end` | 7 | 12475 | `87cc246bed47f7a6f2b96c4cddeeefb72bac83e18b56ad0bb32c7db511ec1ba9` | `https://app.veyloq.org/agent-teams/equipe-de-agentes-back-end` |
| `equipe-de-agentes-dados-v1.0-agents.zip` | agent_team · `equipe-de-agentes-dados` | 7 | 12740 | `d4fc63c924df45447839b1c720332cb29997c91f00c8bde0ab1b9f44ebc51b33` | `https://app.veyloq.org/agent-teams/equipe-de-agentes-dados` |
| `equipe-de-agentes-front-end-v1.0-agents.zip` | agent_team · `equipe-de-agentes-front-end` | 7 | 13953 | `8d2ad0b61cd452f3f5eae4cb29ac93be761917f40be7fd7aa020e6be127724e1` | `https://app.veyloq.org/agent-teams/equipe-de-agentes-front-end` |
| `markitdown-documentos-para-a-ia-v1.0-agents.zip` | skill · `markitdown-documentos-para-a-ia` | 5 | 3071 | `b1d1085c383cf8b193b8f57a5310429c35a14b05542e6ffbcce7087f44efdc9e` | `https://app.veyloq.org/skills/markitdown-documentos-para-a-ia` |
| `microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip` | skill · `microsoft-docs-a-ia-consulta-a-documentacao-oficial` | 6 | 4994 | `7df08b1b0d803e1c8aaf3fa51e0091631436e91b1ccf3ba3ed7c965b817a4aed` | `https://app.veyloq.org/skills/microsoft-docs-a-ia-consulta-a-documentacao-oficial` |
| `pacote-desenvolvimento-com-ia-v1.0-agents.zip` | bundle · `pacote-desenvolvimento-com-ia` | 102 | 281456 | `a07411330af58267a324f8a4131e70822b0d251c4c78f4bda98d06be9a2ba640` | `https://app.veyloq.org/bundles/pacote-desenvolvimento-com-ia` |
| `spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip` | skill · `spec-kit-desenvolvimento-guiado-por-especificacao` | 5 | 3737 | `2b45f3e5ae1613f5b0a5e87490f8b53e315e32639a86a994b194418ead655fc5` | `https://app.veyloq.org/skills/spec-kit-desenvolvimento-guiado-por-especificacao` |
| `sql-code-review-revisao-de-sql-e-seguranca-v1.0-agents.zip` | skill · `sql-code-review-revisao-de-sql-e-seguranca` | 6 | 7325 | `770df3b7c6da5768fe93d5e4cb6d9e9f9b9f772fd89685086a334758a9ca6b8f` | `https://app.veyloq.org/skills/sql-code-review-revisao-de-sql-e-seguranca` |
| `superpowers-fluxo-de-entrega-v1.0-agents.zip` | kit · `superpowers-fluxo-de-entrega` | 36 | 69221 | `12f91c589212cbc2bc4cf90624bbc5091b5994398fc48eb3d21f43efd9ca101c` | `https://app.veyloq.org/kits/superpowers-fluxo-de-entrega` |
| `superpowers-git-worktrees-v1.0-agents.zip` | skill · `superpowers-git-worktrees` | 6 | 6426 | `b4dba33c4d5b6d464f80463d9aa1d0c98634cef6a34fa9b6898eb0fdfa3c012e` | `https://app.veyloq.org/skills/superpowers-git-worktrees` |
| `superpowers-metodo-completo-v1.0-agents.zip` | kit · `superpowers-metodo-completo` | 26 | 65580 | `9119e0a2acaf7192d9b1b6fca37bd50c0b70fbe66ba67143dc2d5d1278e9d442` | `https://app.veyloq.org/kits/superpowers-metodo-completo` |
| `ui-ux-pro-max-design-system-v1.0-agents.zip` | skill · `ui-ux-pro-max-design-system` | 5 | 3378 | `d50541889875c769ff7144fa7f85d3f856be367d454b3dc508eb01b803c206f2` | `https://app.veyloq.org/skills/ui-ux-pro-max-design-system` |

Não há duplicidade de ZIP por SHA-256 nem por `manifest.id`. Há sobreposição de conteúdo esperada entre o bundle `pacote-desenvolvimento-com-ia` e os pacotes avulsos `superpowers-metodo-completo` (22 entradas idênticas) e `superpowers-fluxo-de-entrega` (32 entradas idênticas), além do `LICENSE.txt` comum a todos os pacotes. Isso reflete o fato de o bundle conter os kits e skills avulsos, não uma duplicação indevida.

## Licenças e restrições

Cada ZIP contém um `LICENSE.txt` com as mesmas regras:

- Itens de terceiros seguem a licença original de cada autor, registrada em `ATTRIBUTION.md` com autor, repositório e commit. Para os componentes instalados aqui, as licenças originais são MIT.
- Textos escritos pela VEYLOQ (páginas, instruções e guias de uso) seguem a licença de uso da VEYLOQ: uso pessoal e profissional, sem redistribuir nem revender como se fossem seus.
- VEYLOQ é marca da GAX TECH LTDA, CNPJ 59.313.787/0001-94.

Publicar ZIPs ou textos da VEYLOQ em remote exige autorização comprovada de redistribuição. Até que essa autorização exista, os arquivos devem permanecer como referência local; o bloqueio está registrado em `reports/RELATORIO-REORGANIZACAO-VEYLOQ-GFM-IA-2026-11-24.txt`.

## Relação com os componentes instalados

| ZIP original | Componente instalado no repositório |
|---|---|
| `pacote-desenvolvimento-com-ia-v1.0-agents.zip` | 6 kits em `kits/`, 14 skills canônicas em `.agents/skills/`, 8 comandos e as licenças dos agentes em `agents/` |
| `blueprint-plano-de-obra-em-varias-sessoes-v1.0-agents.zip` | `.agents/skills/blueprint/SKILL.md` |
| `spec-kit-desenvolvimento-guiado-por-especificacao-v1.0-agents.zip` | `.agents/skills/spec-kit-sdd/SKILL.md` |
| `markitdown-documentos-para-a-ia-v1.0-agents.zip` | `.agents/skills/markitdown-convert/SKILL.md` |
| `microsoft-docs-a-ia-consulta-a-documentacao-oficial-v1.0-agents.zip` | `.agents/skills/microsoft-docs/SKILL.md` e `LICENSE.txt` |
| `sql-code-review-revisao-de-sql-e-seguranca-v1.0-agents.zip` | `.agents/skills/sql-code-review/SKILL.md` e `LICENSE.txt` |
| `agente-revisor-de-csharp-e-dotnet-v1.0-agents.zip` | `docs/ai/reference/agents/csharp-reviewer.md`, `.opencode/agents/csharp-reviewer.md` e `agents/csharp-reviewer/LICENSE.txt` |
| `agente-revisor-de-typescript-v1.0-agents.zip`, `agente-revisor-de-react-v1.0-agents.zip`, `agente-arquiteto-de-backend-v1.0-agents.zip` | Referência local; equivalentes funcionais já presentes no bundle, sem instalação separada |
| `superpowers-*.zip`, `equipe-de-agentes-*.zip`, `awesome-llm-apps-guia-*.zip`, `ui-ux-pro-max-*.zip` | Referência local; conteúdo sobreposto ao bundle ou não instalado separadamente |

## Procedimento para futuras atualizações

1. Mantenha o ZIP em `docs/veyloq/` com o nome original; registre SHA-256 e `manifest.id` neste arquivo.
2. Valide a integridade por leitura integral das entradas, sem extrair para o repositório.
3. Confira licença e autorização de redistribuição antes de incluir o arquivo em commit/push.
4. Instale somente o conteúdo da pasta `agents/` do ZIP, sem apagar nem sobrescrever arquivos existentes sem aprovação; se houver `AGENTS.md`, mostre o diff e pergunte antes de juntar.
5. Atualize `ATTRIBUTION.md`, `docs/ai/CATALOGO.md`, `docs/ai/reference/AGENTS-index.md` e os adaptadores das ferramentas conforme o componente instalado.
6. Execute a validação final: hashes dos ZIPs, integridade das skills, links relativos, segredos, `git diff --check` e status do Git.
