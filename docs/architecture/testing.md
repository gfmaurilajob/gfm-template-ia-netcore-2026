# Política de Testes para Projetos Futuros

Esta política define a obrigatoriedade de testes para projetos autorizados. Nenhum teste de aplicação é executado neste repositório: o GFM.Template é documental e não possui aplicação, runtime, banco ou pipeline ativo.

## Tipos de teste e obrigatoriedade

| Tipo | Objetivo | Obrigatoriedade | Isolamento | Gate |
| --- | --- | --- | --- | --- |
| Unitário | Validar regra isolada sem dependência externa | Obrigatório para toda tarefa de código | Mocks controlados e dados sintéticos | Antes da revisão |
| Integração | Validar componentes com dependências controladas | Obrigatório quando houver persistência, fila ou integração | Banco isolado e serviços descartáveis | Antes da homologação |
| Contrato | Validar API e consumidores | Obrigatório quando houver contrato publicado | Esquema ou contrato versionado | Antes da homologação |
| Regressão | Impedir retorno de defeito corrigido | Obrigatório após cada correção | Mesma condição do cenário original | Antes do commit |
| Segurança | Validar credenciais, permissões, entradas e dependências | Obrigatório antes da homologação | Ambiente controlado e sem segredo real | Etapa 20 do fluxo |
| Performance | Medir latência, vazão e saturação | Condicionado a requisito não funcional | Ambiente dedicado e estável | Antes da homologação, quando exigido |
| Aceite | Verificar critérios da SPEC | Obrigatório | Ambiente de teste com dados sintéticos | Etapa 20 do fluxo |

## Bancos isolados e descartáveis

- Cada suíte recebe banco, schema ou container exclusivo.
- A criação é automática no setup, aplicando exatamente as migrações versionadas do projeto.
- A limpeza é garantida no teardown, inclusive quando o teste falha.
- O drop é executado ao final da suíte quando aplicável; sem drop, a recriação completa é obrigatória antes de reutilizar.
- Dados são sintéticos, determinísticos e sem informação de cliente ou produção.
- Paralelismo somente com isolamento por suíte, schema ou transação reversível.
- Docker ou Testcontainers são usados quando a dependência real for necessária e disponível.
- Se a dependência real não puder ser provisionada, o teste é marcado como PENDENTE; nunca é registrado como sucesso.
- Antes de conectar, validar que o alvo é claramente de teste; caso contrário, abortar a execução.
- É proibido apontar suítes para produção, homologação compartilhada ou banco de outro time.
- Logs de teste não contêm segredos nem dados sensíveis.

## Execução local e CI

| Aspecto | Local | CI |
| --- | --- | --- |
| Suíte | Mesma suíte usada no CI | Executada em cada pull request e antes da homologação |
| Configuração | Variáveis locais sem valor real de segredo | Variáveis do provedor, mascaradas |
| Isolamento | Banco descartável por suíte | Container ou schema efêmero por job |
| Resultado | Saída legível no console | Artefato de resultado e relatório |
| Paralelismo | Opcional com isolamento | Controlado por limite de recursos |
| Falha | Corrigir antes de avançar | Bloqueia merge e promoção |

## Bloqueio de entrega

- Teste obrigatório falho bloqueia as etapas 20, 21, 22 e 23 do fluxo oficial.
- `skip` permanente não é aceito; `skip` temporário exige justificativa, responsável, data e aprovação antes da homologação.
- Teste intermitente é defeito: corrigir ou isolar com evidência; não repetir até passar.
- Cobertura é diagnóstico, não meta isolada.
- Homologação exige evidência de execução local e CI, com identificação do artefato testado.
- Correção da etapa 17 somente é fechada quando o teste que a cobre passa.

## Relação com o fluxo oficial

| Etapa | Teste exigido | Evidência |
| --- | --- | --- |
| 11 | Unitário | Resultado da suíte unitária |
| 12 | Integração e contrato, quando houver API | Resultado com banco isolado |
| 17 | Regressão do achado | Teste que valida a correção |
| 20 | Segurança e aceite | Registro de homologação |
| 21 | Consolidação | Relatório final |

## Estado atual do template

Nenhum teste de aplicação é executado agora. Esta política descreve a obrigação para projetos futuros autorizados e não autoriza criar runtime, instalar dependências, executar containers ou acessar bancos neste repositório documental.
