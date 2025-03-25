# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos arquiteturais de Models.

## Model

Os models representam as estruturas de dados que são manipuladas em toda a aplicação, incluindo a lógica de negócios e validações. No MVVM com flutter, ao contrário do que é visto em framworks backends, os models não devem acessar o banco de dados diretamente. Essa tarefa fica para serviços ou repositórios, garantindo a separação de responsabilidades.

No projeto, o UserModel foi criado para representar um contato e será aprimorado ao longo do desenvolvimento.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get

## Próxima Branch:

[feat/services](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/services)

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*