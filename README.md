# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos de design patterns, utilizando o padrão Service.

## Service

Os services são componentes responsáveis por encapsular a lógica de comunicação com fontes externas de dados, como APIs, armazenamento local ou outros sistemas, oferecendo uma interface abstraída para que o repositório ou outros componentes da aplicação interajam com esses dados de forma modular e desacoplada. Eles funcionam como camadas intermediárias entre a aplicação e as fontes de dados externas, facilitando a manutenção e os testes.

No projeto, foram utilizados dois services: o LocalStorageService, que implementa o pacote *shared_preferences* para a persistência de dados locais, e o ClientService, que implementa o pacote *dio* para lidar com operações de rede (HTTP). . Nesse contexto, esses services serão essenciais tanto para a persistência do tema escolhido quanto para a comunicação e manipulação de dados de contato de usuário.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*