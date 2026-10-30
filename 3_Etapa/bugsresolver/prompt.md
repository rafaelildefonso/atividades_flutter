# **Operação Resgate: Detetives de Bugs**

**Disciplina:** Frameworks  
**Duração:** 1h40

## **O desafio**

Uma escola lançou um aplicativo de achados e perdidos para ajudar os alunos a recuperarem seus objetos.

O aplicativo permite registrar objetos, compartilhar pistas e acompanhar quando um item é encontrado.

Porém, uma atualização causou vários problemas.

Algumas funcionalidades pararam de funcionar. Outras apresentam resultados incorretos, e alguns erros só acontecem quando usuários diferentes acessam o sistema.

**Sua missão é investigar e corrigir 12 bugs escondidos no código.**

## **Missão 1 \- Faça o sistema funcionar (15 minutos)**

Abra o projeto Flutter disponibilizado.

* Examine a estrutura de pastas.  
* Tente executar o aplicativo.  
* Analise os erros apresentados.  
* Corrija os problemas que impedem o funcionamento inicial.

## **Missão 2 \- Investigue as ocorrências (30 minutos)**

Teste as funcionalidades de cadastro e consulta.

* Registre dois objetos perdidos.  
* Verifique se o nome do responsável está correto.  
* Teste o filtro de objetos não resolvidos.  
* Abra os detalhes de uma ocorrência.  
* Tente marcar um objeto como encontrado.

Identifique e corrija os comportamentos inesperados.

## **Missão 3 \- Investigação multiusuário (30 minutos)**

Utilize duas contas Google diferentes.

* Registre uma ocorrência na conta A.  
* Verifique se ela aparece automaticamente na conta B.  
* Envie uma pista na conta B.  
* Confira se a pista aparece na ocorrência correta.  
* Teste o controle de autorização para alterar o status de um objeto.

**Atenção:** nem todos os problemas aparecem no terminal. Observe o comportamento do aplicativo e os dados armazenados.

## **Missão 4 \- Laudo técnico (25 minutos)**

Crie um arquivo chamado `LAUDO.md`.

Para cada bug encontrado, registre:

**Bug:** número do problema.  
**Arquivo:** onde foi encontrado.  
**Sintoma:** o que estava acontecendo.  
**Causa:** por que estava errado.  
**Correção:** o que foi alterado.  
**Teste:** como confirmou que funcionou.

## **Entrega**

Envie pelo GitHub:

* Projeto Flutter corrigido.  
* Arquivo `LAUDO.md`.  
* Captura de tela demonstrando as duas contas visualizando a mesma ocorrência.

**Regras:** não é permitido apagar funcionalidades para eliminar erros, remover a autenticação ou desativar as regras de segurança.