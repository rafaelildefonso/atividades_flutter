# **Comentários em Tempo Real**

## **Contexto**

Na aula do dia **19/10**, foi apresentado um aplicativo desenvolvido em Flutter e Firebase que permitia que diferentes usuários realizassem publicações e visualizassem as mensagens de outras pessoas em tempo real.

Agora, a proposta é **continuar esse aplicativo**, adicionando uma nova funcionalidade: permitir que os usuários comentem nas publicações.

O objetivo é que os comentários sejam compartilhados entre diferentes contas e apareçam automaticamente, sem a necessidade de atualizar a página.

## **O que desenvolver**

### **1\. Comentários nas publicações**

Cada publicação deverá possuir um botão de comentários.

Ao clicar nesse botão, o aplicativo deverá abrir uma tela contendo a publicação selecionada e seus comentários.

Nessa tela, o usuário poderá escrever e enviar comentários.

Cada comentário deverá armazenar:

* Texto do comentário.  
* Nome de quem comentou.  
* UID do usuário.  
* Identificação da publicação.

### **2\. Atualização em tempo real**

Os comentários deverão ser armazenados no Cloud Firestore.

**Obrigatório:** quando uma pessoa comentar em uma publicação, os outros usuários que estiverem visualizando a mesma publicação deverão receber o comentário automaticamente, sem atualizar a página.

**Exemplo:**

Pedro publica: "Qual o melhor jogo de 2026?"

Maria comenta: "Eu prefiro jogos de aventura\!"

João comenta: "Gosto mais de jogos de corrida."

Os comentários deverão aparecer na tela de Pedro automaticamente, desde que ele esteja visualizando a discussão.

### **3\. Organização dos comentários**

Cada publicação deverá apresentar somente os comentários relacionados a ela.

Um comentário realizado em uma publicação não poderá aparecer em outra.

Para isso, será necessário relacionar cada comentário ao identificador da publicação correspondente.

### **4\. Exclusão de comentários**

Cada usuário deverá conseguir excluir seus próprios comentários.

Não será permitido excluir comentários realizados por outras pessoas. Essa restrição também deverá ser respeitada pelas regras de segurança do Firestore.

## **Continuação do aplicativo**

A atividade deverá ser realizada a partir do **aplicativo trabalhado na aula do dia 19/10**.

As funcionalidades de cadastro, login, perfil e publicações já existentes deverão ser mantidas.

Não será necessário criar um novo aplicativo, apenas implementar a funcionalidade de comentários.

## **Teste obrigatório**

1. Acesse o aplicativo utilizando duas contas diferentes.  
2. Na primeira conta, crie uma publicação.  
3. Na segunda conta, abra essa publicação e faça um comentário.  
4. Verifique se o comentário aparece automaticamente na primeira conta, com a discussão aberta.  
5. Faça outros comentários e confirme que aparecem somente na publicação correta.  
6. Teste a exclusão de um comentário próprio.

## **Questões**

1. Como o Firebase identifica quem escreveu determinado comentário?  
2. Como relacionar um comentário a uma publicação específica?  
3. Por que utilizamos `StreamBuilder` para mostrar os comentários?  
4. Como garantir que os comentários apareçam automaticamente em contas diferentes?

## **Entrega**

A atividade deverá ser enviada pelo **GitHub**.

Cada aluno deverá atualizar seu repositório com o código completo do aplicativo, incluindo as novas funcionalidades, e enviar o link conforme orientação.

**Atenção:** o principal objetivo desta atividade é implementar comentários em tempo real entre diferentes usuários, utilizando os conhecimentos trabalhados na aula do dia 19/10.

## Comandos

flutter pub add firebase\_core

flutter pub add cloud\_firestore

flutter pub add provider

flutter pub add device\_preview

dart pub global activate flutterfire\_cli

 npm install \-g firebase-tools

firebase login

dart pub global run flutterfire\_cli:flutterfire configure