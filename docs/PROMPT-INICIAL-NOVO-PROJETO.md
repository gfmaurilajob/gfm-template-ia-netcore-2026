# Prompt inicial para novo projeto

Use o texto abaixo como primeira mensagem da IA em um repositório novo baseado no GFM.Template. Substitua apenas os campos entre colchetes. Não mencione produto, domínio, stack ou caminho pessoal que não esteja confirmado nos arquivos do repositório.

## Prompt reutilizável

````text
Você está trabalhando em um repositório documental inspirado no GFM.Template, usado para preparar projetos futuros de software com IA. Este repositório não é uma aplicação: não contém código C#, produto de exemplo, dependências instaladas nem infraestrutura executável.

Idioma obrigatório: português do Brasil (pt-BR). Use caminhos relativos ao repositório. Não registre credenciais, tokens, segredos nem caminhos pessoais.

Objetivo do projeto: [OBJETIVO_DO_PROJETO]
Restrições conhecidas: [RESTRICOES_CONHECIDAS]
Ferramentas disponíveis nesta sessão: [FERRAMENTAS_DISPONIVEIS]

Antes de propor qualquer solução:
1. Leia `AGENTS.md`, `README.md`, `docs/ai/CATALOGO.md`, `docs/ai/reference/AGENTS-index.md`, `docs/veyloq/README.md` e `docs/architecture/README.md`.
2. Identifique os pontos de entrada das ferramentas disponíveis: `AGENTS.md`, `.codex/config.toml`, `opencode.json`, `CLAUDE.md`, `.opencode/`, `.claude/` e `.agents/skills/`.
3. Identifique o contexto existente: documentos já presentes, decisões registradas, componentes homologados, pendências e riscos conhecidos. Use `context-manager` para trabalho especializado.
4. Respeite as regras não negociáveis de `AGENTS.md`: preservar originais, não apagar arquivos, não sobrescrever sem diff e autorização, não alterar remote/branch principal/histórico/tags/autenticação e não executar operações destrutivas.
5. Classifique evidências apenas como `HOMOLOGADO`, `HOMOLOGADO COM RESSALVAS`, `PENDENTE` ou `REPROVADO`. Nunca declare `HOMOLOGADO` sem teste operacional controlado.

Leve ao usuário, antes de qualquer implementação:
1. Os requisitos entendidos, separando fatos confirmados de inferências.
2. As dúvidas que mudariam o escopo, uma por vez, em linguagem simples.
3. Os riscos, restrições e anti-objetivos, com impacto e mitigação proposta.
4. As opções de arquitetura ou abordagem relevantes, com prós, contras e uma recomendação justificada.
5. A confirmação de que nenhuma stack, produto ou formato de entrega foi assumido sem aprovação.

Produza somente documentação nesta primeira etapa:
1. Um Blueprint para trabalho multi-sessão, quando o escopo justificar, com passos autocontidos, dependências, paralelismo, verificação e critérios de saída. Não crie pastas de execução neste template.
2. Uma SPEC clara, centrada no problema e no usuário, sem tecnologia, com requisitos funcionais, não funcionais, restrições, premissas, critérios de aceitação e itens fora de escopo.
3. Uma proposta de arquitetura com limites, componentes, integrações e decisões técnicas registradas como ADRs em `docs/architecture/decisions/`, sem impor .NET/C# ou qualquer outra stack sem justificativa aprovada.
4. Um plano de implementação em fases, com dependências, riscos e marcos de validação.
5. Tarefas rastreáveis, cada uma com critérios de aceitação, comandos de verificação previstos e evidência exigida.
6. Estratégia de testes proporcionais ao risco: unitários, integração, segurança, dependências e Quality Gates, sem inventar framework ou runner.
7. Estratégia de segurança: menor privilégio, proteção de segredos, logs sem dados sensíveis, revisão e tratamento de vulnerabilidades.
8. Estratégia de DevOps: builds, ambientes, artefatos, aprovações, reversão e publicação como decisões a aprovar, não como automação pronta.
9. Um relatório de contexto e riscos em `reports/`, sem segredos, tokens ou caminhos pessoais.

Regras de parada:
- Não escreva código C#, não crie aplicação, scaffold, migração, container, serviço nem produto de exemplo.
- Não instale dependências, não execute `uv tool install specify-cli`, `pip install "markitdown[all]"` nem `npm install -g @microsoft/learn-cli` sem autorização explícita.
- Não execute comandos de publicação, deployment, push, reset, limpeza ampla, exclusão recursiva nem alteração de remote, branch principal, histórico, tags ou autenticação.
- Commit e push/publicação dependem de autorização explícita; um plano aprovado não autoriza essas ações.
- Componentes VEYLOQ restritos, incluindo os ZIPs em `docs/veyloq/`, textos VEYLOQ e skills sem homologação operacional, permanecem locais e fora de commit/push até autorização de redistribuição.
- Se faltar informação essencial, pergunte e pare. Não preencha lacunas com suposições silenciosas.
- Ao final, pare e aguarde aprovação explícita antes da implementação inicial.

Formato de resposta:
1. Leitura realizada: arquivos lidos e ferramentas identificadas.
2. Contexto: estado atual, decisões existentes e pendências.
3. Requisitos: confirmados x inferidos.
4. Dúvidas abertas.
5. Riscos e restrições.
6. Blueprint proposto.
7. SPEC proposta.
8. Arquitetura e ADRs propostos.
9. Plano e tarefas.
10. Critérios de aceitação, testes, segurança e DevOps.
11. Evidências e relatório.
12. Solicitação clara de aprovação para a implementação inicial.
````
