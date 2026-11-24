# Padrões .NET e ASP.NET Core para Projetos Futuros

Estes padrões são critérios de decisão para projetos .NET autorizados. Este repositório é documental e não contém código C#, aplicação, scaffold, migração ou pacote publicável. Nada aqui deve ser aplicado por padrão sem justificativa no cenário real.

## Proporcionalidade antes da arquitetura

| Situação | Abordagem recomendada | Evitar |
| --- | --- | --- |
| Protótipo ou CRUD simples | Projeto enxuto, requisitos claros, testes básicos e configuração validada | Clean Architecture completa, DDD, CQRS e projetos vazios |
| Serviço com regras estáveis e integrações | Clean Architecture enxuta, DI, validação, observabilidade e testes | Camadas sem responsabilidade real |
| Domínio rico com linguagem ubíqua | DDD com agregados, objetos de valor e eventos justificados | Modelagem teórica sem requisito |
| API pública versionada | Contrato OpenAPI, versionamento e testes de contrato | Mudanças quebráveis sem aviso |

## Critérios de adoção dos padrões

| Padrão | Quando adotar | Quando não adotar | Custo principal |
| --- | --- | --- | --- |
| Clean Architecture | Regras de negócio estáveis, múltiplos adaptadores e manutenção longa | CRUD simples, script ou protótipo | Mais projetos e indireção |
| SOLID | Sempre que houver código alterado | Criar interface para classe única sem necessidade | Abstração excessiva |
| DDD | Regras complexas, agregados e eventos de domínio | Domínio trivial ou apenas persistência | Overhead de modelagem |
| DI nativo | Todo ASP.NET Core | Service locator ou container paralelo sem motivo | Ciclos de vida mal escolhidos |
| Repository e Unit of Work | Isolamento de persistência e testes quando o ORM não bastar | Wrapper fino sobre `DbContext` sem ganho | Duplicação de abstração |
| CQRS e Mediator | Comandos e consultas com necessidades distintas e auditoria | Leitura e escrita simples | Mais arquivos e depuração indireta |
| Resultados explícitos | Operações com falhas esperadas e retorno tipado | Exceções usadas como fluxo normal | Contratos mais verbosos |

## Separação de responsabilidades

- Domínio: regras e invariantes, sem dependência de HTTP, persistência ou framework externo.
- Aplicação: casos de uso, orquestração, contratos de entrada e saída e validação de aplicação.
- Infraestrutura: persistência, mensageria, integrações, armazenamento e envio de notificações.
- API ou Web: HTTP, autenticação, serialização, versionamento e middleware.
- Testes: unitários e de integração alinhados aos módulos, sem acoplar a detalhes privados.
- Não criar pastas ou projetos vazios apenas para uso futuro.

## Injeção de dependências e ciclos de vida

| Ciclo | Uso típico | Cuidado |
| --- | --- | --- |
| Singleton | Configuração imutável, cache compartilhado, serviços sem estado | Não guardar `DbContext`, contexto de requisição ou usuário atual |
| Scoped | `DbContext`, serviços por requisição, unidade de trabalho | Não resolver a partir de singleton |
| Transient | Serviços leves e sem estado | Evitarcriação em loop sem necessidade |

## Segurança

- Autenticar e autorizar por endpoint; negar por padrão.
- Validar, tipar e limitar toda entrada; não confiar no cliente.
- CORS explícito, sem wildcard em produção.
- Anti-forgery em formulários e proteção CSRF quando aplicável.
- HTTPS obrigatório e headers de segurança adequados ao cenário.
- Nunca registrar tokens, senhas, dados sensíveis ou corpo completo de requisição em log.
- Segredos por ambiente ou cofre, nunca em arquivos versionados.
- Menor privilégio em banco, fila, storage e contas de serviço.

## Observabilidade

- Logging estruturado com níveis consistentes e mensagens estáveis.
- Correlation ID propagado entre serviços e incluído nos logs.
- Métricas de latência, taxa de erro e saturação.
- Traces distribuídos quando houver mais de um serviço.
- Health checks de liveness e readiness sem expor detalhes internos.
- Alertas acionáveis e runbook para os cenários críticos.

## Tratamento de erros

- Middleware centralizado de exceções e `ProblemDetails` para APIs.
- Códigos de status coerentes e mensagens previsíveis para consumidores.
- Detalhes técnicos apenas em desenvolvimento controlado; nunca stack trace em produção.
- Falhas esperadas viram resultado explícito ou resposta clara; falhas inesperadas viram erro genérico.
- Retry apenas em operações idempotentes, com backoff e limite de tentativas.
- Configuração inválida e dependências circulares detectadas na inicialização.

## Configuração por ambiente

| Item | Regra |
| --- | --- |
| `appsettings` | Arquivo base mais sobrescritas por ambiente, sem segredo real |
| Variáveis de ambiente | Fonte preferida em container e CI |
| User-secrets | Apenas desenvolvimento local, nunca produção |
| Validação de opções | Fail-fast na inicialização |
| Promoção | Mesmo artefato entre ambientes, com mudança apenas por configuração |

## Segredos

- Não versionar segredos, tokens, senhas ou chaves.
- Não imprimir valores em console, log, relatório ou resposta.
- Usar cofre da plataforma e mascaramento em pipelines.
- Rotacionar credenciais quando houver suspeita de exposição; fazer isso fora do repositório.
- Revisão de histórico somente com autorização explícita.
- Nenhum segredo real é usado neste template documental.

## Versionamento e documentação de API

- Versionar o contrato público desde o início quando houver consumidor externo.
- Preferir mudanças compatíveis; mudanças quebráveis exigem nova versão e aviso.
- OpenAPI descreve rotas, payloads, erros, autenticação e exemplos sintéticos.
- Documentação de API integra a SPEC e a etapa de homologação.
- Não gerar documentação automática com dados reais.

## Persistência e migrações

- Migrações versionadas, revisadas na etapa 14 do fluxo, com rollback planejado.
- Nenhuma migração automática em produção sem autorização explícita.
- Índices derivados de consultas reais; evitar índice especulativo.
- Transações curtas e concorrência otimista quando aplicável.
- Seeds controlados e idempotentes.
- Dados de teste isolados e descartáveis, conforme `docs/architecture/testing.md`.
- Nomes coerentes com o domínio, sem vazar detalhes de implementação na API.

## Testes

- Unitários para regras de domínio e aplicação.
- Integração para persistência, filas e dependências reais controladas.
- Contrato para APIs publicadas.
- Regressão para toda correção aprovada.
- Nenhuma suíte aponta para produção ou dados reais.

## Docker e CI/CD

- Dockerfile multi-stage, imagem mínima e usuário não root.
- `.dockerignore` controlado e healthcheck quando aplicável.
- Segredos injetados em runtime, nunca copiados para a imagem.
- CI executa build, testes obrigatórios, análise estática e varredura de dependências.
- Falha em gate bloqueia a promoção.
- Publicação e deploy somente com autorização, conforme `docs/architecture/devops.md`.

## Checklist de adoção

- O contexto justifica a complexidade escolhida?
- A decisão relevante foi registrada em ADR?
- As responsabilidades estão separadas sem projeto vazio?
- Os segredos estão fora do repositório e dos logs?
- Tratamento de erros e observabilidade estão definidos?
- A configuração é validada na inicialização?
- Os testes obrigatórios estão previstos?
- O contrato de API está documentado quando aplicável?
- Docker e CI/CD estão previstos apenas quando o cenário exigir?
