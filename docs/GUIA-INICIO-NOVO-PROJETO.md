# Guia de início de novo projeto

Este guia explica como reutilizar o GFM.Template para iniciar um projeto futuro de software com apoio de IA. O template é documental: ele não contém aplicação executável, código C#, projeto de exemplo, infraestrutura instalada nem produto pronto. Toda implementação pertence a um repositório futuro e depende de especificação, plano e autorização explícita.

## 1. Princípio de uso

1. Leia primeiro `AGENTS.md`; ele é a fonte de governança ativa.
2. Use `README.md` para entender o acervo documental e `docs/ai/CATALOGO.md` para mapear agentes, comandos, skills e kits.
3. Consulte `docs/ai/reference/` somente como preservação canônica; não reescreva seu conteúdo.
4. Respeite as regras em `AGENTS.md`: responder em pt-BR, preservar originais, não executar ações destrutivas, não instalar dependências automaticamente e não registrar segredos.
5. Trate o template como referência. Nunca execute modelos, comandos ou tarefas diretamente a partir dele sem SPEC aprovada, plano aprovado e escopo autorizado.

## 2. Preservar o template canônico

Não altere, mova, renomeie ou exclua:

- `AGENTS.md` e a governança nele definida.
- `docs/ai/reference/`, incluindo `AGENTS-original.md`, `AGENTS-original.sha256.txt` e `AGENTS-index.md`.
- O backup histórico de 23/11/2026 e os relatórios em `reports/`.
- Os ZIPs originais em `docs/veyloq/` e seu inventário em `docs/veyloq/README.md`.
- `.claude/skills/`: ele é necessário ao Claude Code e não deve ser removido para resolver duplicidade no OpenCode.

Se precisar de governança específica do projeto novo, acrescente um arquivo separado e referencie-o. Não sobrescreva arquivos existentes sem mostrar a diferença e obter autorização.

Use somente estes conceitos de homologação: `HOMOLOGADO`, `HOMOLOGADO COM RESSALVAS`, `PENDENTE` e `REPROVADO`. Nunca declare `HOMOLOGADO` sem evidência de teste operacional controlado.

## 3. Iniciar novo repositório

1. Crie um repositório novo em local autorizado; não altere remote, branch principal, histórico, tags nem autenticação do template.
2. Copie para o projeto novo somente a governança e a documentação necessárias, preservando os caminhos relativos: `AGENTS.md`, `README.md`, `opencode.json`, `.codex/`, `.opencode/`, `.claude/`, `.agents/`, `docs/ai/`, `docs/architecture/`, `kits/`, `agents/` e `commands/`.
3. Se quiser manter o histórico de auditoria, copie `reports/`. Se quiser manter pacotes VEYLOQ, mantenha-os apenas como referência local; não os inclua em commit ou push sem autorização de redistribuição.
4. Não crie `src/`, `blueprints/`, `templates/`, `plans/` nem qualquer projeto executável neste template. Essas pastas, se necessárias, pertencem ao repositório futuro.
5. Confira o estado com `git status --short --branch` e `git diff --check` antes de qualquer entrega.

## 4. Configurar ambiente

A configuração é feita no projeto futuro, conforme as ferramentas disponíveis. Não instale nada automaticamente neste template.

Comandos de setup documentados nas skills e **não executados** neste repositório:

```powershell
uv tool install specify-cli
pip install "markitdown[all]"
npm install -g @microsoft/learn-cli
```

Execute-os somente no projeto futuro, com finalidade justificada e autorização explícita. Eles correspondem, respectivamente, a Spec Kit (`spec-kit-sdd`), conversão de documentos (`markitdown-convert`) e consulta à documentação Microsoft (`microsoft-docs`). O uso do template documental não depende dessas instalações.

Para iniciar o OpenCode no PowerShell, use exatamente:

```powershell
$env:OPENCODE_DISABLE_CLAUDE_CODE_SKILLS='1'; opencode
```

Essa variável evita que adaptadores em `.claude/skills/` substituam as skills canônicas em `.agents/skills/` por precedência instável de nome. Ela vale para o processo de inicialização; não exclua `.claude/skills/`.

Nenhum hook foi instalado. Se um hook for necessário, mostre o comando exato e aguarde autorização antes de alterar `.claude/settings.json`.

## 5. Usar as ferramentas de IA

A governança é única; arquivos específicos de ferramenta são apenas pontos de entrada.

### OpenAI Codex CLI

- Pontos de entrada: `AGENTS.md`, `.codex/config.toml`, `.codex/agents/`, `.codex/skills/`.
- Use `/skills` para inspecionar skills, `$<skill>` para skills de comando (por exemplo `$typescript-scaffold`) e `/agents` ou linguagem natural para selecionar agentes.
- Status registrado: `HOMOLOGADO COM RESSALVAS`; descoberta estática verificada, sessão operacional com modelo ainda pendente.

### OpenCode

- Pontos de entrada: `AGENTS.md`, `opencode.json`, `.opencode/agents/`, `.opencode/commands/`, `.agents/skills/`.
- Inicie com o comando PowerShell da seção 4.
- Use modo subagente, comandos por `/<comando>` e skills por nome.
- `opencode.json` permite leitura/consulta e pede aprovação para escrita e shell; nega `git push`, `git reset --hard` e limpeza ampla.
- Status registrado: `HOMOLOGADO COM RESSALVAS`.

### Claude Code

- Pontos de entrada: `CLAUDE.md` (que importa `@AGENTS.md`), `.claude/settings.json`, `.claude/agents/`, `.claude/commands/`, `.claude/skills/`.
- Use a ferramenta `Task` para agentes, `/<comando>` para comandos e skills em `.claude/skills/`.
- Status registrado: `PENDENTE`; a CLI não estava disponível na auditoria e não houve teste operacional.
- Adaptadores Claude para as 5 skills VEYLOQ ainda não existem; use as definições canônicas em `.agents/skills/` quando a ferramenta permitir.

Em caso de dúvida sobre mapeamento, consulte `context-manager` antes de trabalho especializado.

## 6. Iniciar Blueprint

Use a skill `blueprint` em `.agents/skills/blueprint/SKILL.md` quando o esforço for grande, multi-sessão ou multi-agente. Ela não é indicada para mudanças de um único PR nem quando o usuário pede execução direta.

No projeto futuro, o Blueprint deve:

1. Fazer reconhecimento de contexto e dependências sem inventar requisitos.
2. Dividir o objetivo em passos de tamanho de PR, com contexto autocontido.
3. Registrar dependências, paralelismo, verificação e critérios de saída em `plans/`.
4. Submeter o plano a revisão adversária antes de finalizá-lo.
5. Apresentar contagem de passos e resumo de paralelismo para aprovação.

Não crie `plans/` neste template e não trate um plano gerado como autorização de implementação.

## 7. Criar a SPEC

Use `spec-kit-sdd` quando a especificação precisar ser estruturada. A sequência documentada é:

1. `/speckit-constitution` — princípios do projeto, uma vez.
2. `/speckit-specify` — o que e por quê, sem tecnologia.
3. `/speckit-plan` — tecnologia e arquitetura.
4. `/speckit-tasks` — tarefas verificáveis.
5. `/speckit-implement` e `/speckit-converge` — somente após aprovação.

Execute um comando por vez e pare para revisão após cada artefato. Mantenha a SPEC centrada no problema e no usuário; decisões técnicas pertencem ao plano. Se um artefato estiver errado, edite o arquivo e continue, sem refazer o fluxo inteiro.

A SPEC aprovada autoriza apenas a próxima etapa de planejamento, não implementação, acesso externo ou publicação.

## 8. Planejar implementação

Siga o fluxo `SPEC -> ARQUITETURA -> PLAN -> TASKS`:

1. Registrar requisitos e aprovar a SPEC.
2. Propor arquitetura, diagramas e ADRs em `docs/architecture/` e `docs/architecture/decisions/`.
3. Aprovar o PLAN com fases, dependências e riscos.
4. Decompor em TASKs rastreáveis, com critérios de aceitação.
5. Definir estratégias de teste, segurança e DevOps antes de qualquer código.
6. Obter autorização explícita para o escopo de execução.

Use os kits em `kits/` e os padrões em `docs/architecture/` como referência. Escolha a stack somente quando os requisitos a justificarem; .NET/C# é um cenário documental, não uma imposição.

## 9. Usar agentes e skills

Consulte `docs/ai/CATALOGO.md` antes de selecionar um agente. Exemplos de uso:

- `context-manager` para levantar contexto, restrições, arquivos relevantes, decisões pendentes e riscos.
- `api-designer`, `backend-developer`, `csharp-reviewer`, `sql-pro`, `postgres-pro` e `docker-expert` para decisões técnicas, conforme disponibilidade da ferramenta.
- `security-auditor`, `qa-expert`, `test-automator`, `debugger` e `performance-engineer` para qualidade, evidência e diagnóstico.
- `brainstorming`, `writing-plans`, `test-driven-development`, `systematic-debugging`, `verification-before-completion`, `receiving-code-review`, `requesting-code-review`, `using-git-worktrees` e `finishing-a-development-branch` para conduzir o trabalho.

Skills VEYLOQ canônicas em `.agents/skills/`: `blueprint`, `spec-kit-sdd`, `markitdown-convert`, `microsoft-docs` e `sql-code-review`. Seu status operacional permanece `PENDENTE` até teste controlado; não as declare homologadas sem evidência.

## 10. Executar testes

Testes pertencem ao projeto futuro. Neste template não há framework de teste, aplicação nem comando de execução.

No projeto futuro:

1. Leia o `README.md` e as instruções da ferramenta antes de escolher comandos; não assuma um runner.
2. Cubra critérios de aceitação com testes unitários, de integração e de segurança aplicáveis ao risco.
3. Use recursos temporários e isolados para integração com persistência e comprove limpeza.
4. Registre comando, saída, data e resultado como evidência.
5. Falha em gate obrigatório, validação não executada ou ausência de evidência bloqueia a conclusão da tarefa.

`markitdown-convert` pode preparar documentos como Markdown antes da análise; `microsoft-docs` pode consultar documentação oficial; `sql-code-review` pode revisar consultas. Nenhum deles autoriza acesso a dados confidenciais ou serviços externos.

## 11. Validar entregas

Antes de afirmar que uma entrega está pronta:

- `git status --short --branch` e `git diff --check` sem problemas.
- Hashes dos originais preservados conferidos, quando aplicável.
- Links relativos resolvidos e nenhum arquivo de preservação alterado.
- Varredura textual sem segredos, tokens, credenciais ou chaves privadas.
- Testes e Quality Gates executados com evidência registrada.
- Classificação de homologação coerente com a evidência obtida.
- Escopo executado igual ao escopo aprovado; nada além dele.

Use `verification-before-completion`: evidência antes de afirmação.

## 12. Gerar relatórios

Registre auditorias, homologações e validações em `reports/`, com nome no formato `RELATORIO-<ASSUNTO>-<AAAAMMDD>.txt` ou extensão equivalente já adotada.

Cada relatório deve conter: objetivo, escopo, comandos executados, evidências, limitações, riscos, classificação de homologação, estado do Git e pendências. Não registre segredos nem caminhos pessoais. Relatórios históricos são evidência: não reescreva nem apague.

## 13. Commit e push

- Faça commit somente quando explicitamente solicitado.
- Antes do commit, inspecione `git status`, `git diff` e `git log --oneline -10`; stage somente arquivos pretendidos.
- Escreva mensagem concisa e siga o estilo do repositório.
- Não faça commit de segredos, credenciais, ZIPs VEYLOQ sem autorização nem artefatos de publicação não aprovados.
- `git push` e qualquer publicação dependem de autorização explícita. Não altere remote, branch principal, histórico, tags ou autenticação sem permissão.
- Não use `git reset --hard`, limpeza ampla, exclusão recursiva, migrations, scaffolds, serviços, containers nem publicação sem autorização.

## 14. Componentes de uso exclusivamente local

Os 18 ZIPs em `docs/veyloq/`, os textos escritos pela VEYLOQ e os componentes sem homologação operacional permanecem como referência local. Não extraia, modifique, renomeie, exclua, publique ou redistribua sem autorização comprovada.

As 5 skills VEYLOQ, o agente `csharp-reviewer` e seus adaptadores têm restrições específicas registradas em `docs/veyloq/README.md`, `docs/ai/CATALOGO.md` e `docs/ai/reference/AGENTS-index.md`. Se o projeto futuro for remoto, mantenha esses artefatos fora do Git até que a redistribuição seja autorizada.

## 15. Checklist rápido

- [ ] `AGENTS.md` lido e preservado.
- [ ] Repositório novo criado sem copiar a aplicação para o template.
- [ ] Ambiente verificado; nada instalado automaticamente.
- [ ] Ferramenta disponível identificada e comando do OpenCode usado quando aplicável.
- [ ] `context-manager` consultado para trabalho especializado.
- [ ] Blueprint e SPEC criados no projeto futuro, com revisão.
- [ ] Arquitetura, ADRs, plano, tarefas e critérios aprovados.
- [ ] Testes e Quality Gates executados com evidência.
- [ ] Relatório gerado em `reports/` sem dados sensíveis.
- [ ] Commit e push somente após autorização explícita.
- [ ] Componentes VEYLOQ mantidos localmente.
