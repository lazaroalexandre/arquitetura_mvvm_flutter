# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos de design patterns, utilizando o padrão Service.

## Repository

Os services são componentes responsáveis por encapsular a lógica de comunicação com fontes externas de dados, como APIs, armazenamento local ou outros sistemas, oferecendo uma interface abstraída para que o repositório ou outros componentes da aplicação interajam com esses dados de forma modular e desacoplada. Eles funcionam como camadas intermediárias entre a aplicação e as fontes de dados externas, facilitando a manutenção e os testes.

No projeto, foram utilizados três services: o *LocalStorageService*, que implementa o pacote *flutter_secure_storage* para a persistência de dados locais, o *ClientService*, que implementa o pacote *dio* para lidar com operações de rede (HTTP), e o *AppMessageService*, que implementa o pacote *another_flushbar* para exibir mensagens de feedback ao usuário. Nesse contexto, esses services serão essenciais não só para a persistência do tema escolhido, como também para a comunicação e manipulação de dados de contato de usuário, além de notificar mensagens de sucesso e erro.

**Observação**

Foi criado o diretório chamato utils, com o fito de armazenar funções, classes e constantes reutilizáveis que não pertencem diretamente a uma camada específica do projeto, mas que são úteis em várias partes da aplicação. Nele, você encontra mensagens, exceções e rotas de api, por exemplo.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get

## Próxima Branch:

[feat/repositories](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/services)

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

*[Semana do Flutter - Testes de Unidade | Jacob Moura](https://www.youtube.com/watch?v=zlYQe-9QMug&list=PLlBnICoI-g-etEtbvgDnO40SYKOSktCj4)*

*[Automating Unit Testing for Your Flutter Project with GitHub Actions | Medium - Reme Le Hane](https://remelehane.medium.com/automating-unit-testing-for-your-flutter-project-with-github-actions-8b18f30a65fa)*