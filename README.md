# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos de design patterns, utilizando o padrão Repository para gerenciar a comunicação entre a API externa e o frontend construído em Flutter.

## Repository

Os Repositories são responsáveis por encapsular a lógica de acesso aos dados, oferecendo uma interface para operações de CRUD (Create, Read, Update, Delete) e abstraindo interações com o banco de dados por meio da API externa. Eles mantêm a lógica de acesso a dados separada da lógica de negócios. No projeto, o Repository é utilizado para direcionar os dados externos por meio de sua interface e é implementado com o pacote *dio*, utilizado por um novo serviço de usuário para consumir a fonte de dados externa. Este pacote pode ser substituído por outro que também realize chamadas HTTP sem afetar o modelo de repository criado na interface. Dessa forma, o repository também pode ser integrado em uma nova ViewModel de usuário (contatos) e servirá para manipular dados na View por meio da nova controller de usuário.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- flutter run -d chrome

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

*[Exemplo de Requisição http com pacote DIO | DIO - Leandro Santos](https://www.dio.me/articles/exemplo-de-requisicao-http-com-pacote-dio)*
