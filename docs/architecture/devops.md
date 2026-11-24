# Diretrizes de DevOps para Projetos Futuros

Estas diretrizes se aplicam quando existir projeto autorizado. Neste template documental não há deploy automático, container em execução, workflow de publicação ou segredo de ambiente.

## Diretrizes por área

| Área | Diretriz | Gate | Evidência |
| --- | --- | --- | --- |
| Docker | Multi-stage, imagem mínima, usuário não root, `.dockerignore` e healthcheck quando aplicável | Revisão do Dockerfile antes de qualquer build controlado | Dockerfile revisado e camadas sem segredo |
| GitHub Actions | Workflow explícito, `GITHUB_TOKEN` com menor privilégio, ações fixadas por versão ou SHA, sem segredo em `pull_request_target` | Execução em pull request antes da homologação | Log de execução sem segredo |
| CI | Restore, build, testes obrigatórios, análise estática e varredura de dependências | Falha em qualquer etapa bloqueia o merge | Artefato de resultado e identificador do commit |
| CD | Separar build de deploy; promover o mesmo artefato aprovado | Deploy manual e autorizado | Registro de autorização e versão do artefato |
| Ambientes | Configuração por ambiente, valores por cofre e fail-fast na inicialização | Promoção somente após gate anterior | Matriz de ambientes preenchida |
| Segredos | Cofre da plataforma, mascaramento, rotação e acesso por ambiente | Nenhum segredo em repositório, imagem ou log | Política de acesso e registro de rotação |
| Artefatos | Imutáveis, versionados com identificador do commit, com checksum e SBOM quando aplicável | Nenhum artefato sem procedência | Lista de artefatos e retenção definida |
| Publicação | Somente com autorização explícita e registrada | Tag, release, registro de imagem, pacote ou deploy não são automáticos | Relatório com autorizador, escopo, destino e horário |
| Observabilidade | Health checks, métricas, traces, alertas e runbook antes de produção | Homologação com evidência | Painel, alerta e runbook revisados |
| Rollback | Critério de acionamento, passos e verificação pós-rollback definidos | Plano de rollback antes da primeira publicação | Registro do teste de rollback quando aplicável |

## Matriz de ambientes

| Ambiente | Finalidade | Dados | Segredos | Promoção | Aprovação |
| --- | --- | --- | --- | --- | --- |
| Desenvolvimento | Iteração local | Sintéticos | Locais, sem valor real | A partir de tarefa concluída | Não exigida além do fluxo |
| Homologação | Validação integrada | Sintéticos ou mascarados | Cofre de homologação | Mesmo artefato aprovado no CI | Revisão e homologação |
| Produção | Uso real | Reais, com minimização | Cofre de produção, rotação e mascaramento | Somente após homologação | Autorização explícita e registrada |

## Segredos e artefatos

- Segredos pertencem ao cofre da plataforma; nunca ao repositório, à imagem ou ao log.
- Nomes de variáveis são padronizados; apenas os valores variam por ambiente.
- Artefatos são imutáveis e identificados pelo commit que os gerou.
- Checksum e SBOM são gerados quando o contexto exigir rastreabilidade de supply chain.
- A retenção é definida explicitamente; artefatos antigos são removidos conforme a política.
- O mesmo artefato é promovido entre ambientes; rebuild exige justificativa e novo versionamento.

## Publicação autorizada

- Publicar inclui criar tag, release, imagem em registro, pacote ou deploy.
- Nenhuma publicação ocorre sem autorização explícita do usuário.
- O relatório registra autorizador, escopo, destino, horário e evidência.
- Remote, branch principal, histórico, tags e autenticação não são alterados sem autorização.
- Push é feito ao remote verificado, sem forçar.
- Plano de rollback é definido antes da primeira publicação.

## Estado atual do template

- Nenhum container é construído ou executado.
- Nenhum workflow de deploy está ativo.
- Nenhum segredo, artefato de produção ou publicação é gerado.
- Estas diretrizes se aplicam somente a projeto autorizado.

## Relação com o fluxo oficial

| Etapa | Entrega DevOps |
| --- | --- |
| 6 | Definição de container e pipelines no desenho arquitetural |
| 19 | Plano DevOps revisado |
| 20 | Evidência de CI e classificação de homologação |
| 22 | Commit com artefatos versionáveis |
| 23 | Push autorizado e registro da publicação |
