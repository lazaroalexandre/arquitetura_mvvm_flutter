# Arquitetura MVVM no Flutter


Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos arquiteturais de ViewModels.

## ViewModel

A ViewModel é um intermediário entre a camada de domínio (Model) e a camada de apresentação (View). Ela processa os dados antes de expô-los à View e fornece métodos para interação do usuário, garantindo um desacoplamento adequado entre a interface e a lógica de negócios.

No projeto, o UserViewmodel é responsável por toda comunicação da model, por meio da implementação do UserRepository e do AppMessageService.

**Observação**

Foi criado testes de unidade do UserViewmodel. Você pode acessá-los pelo seguinte caminho:

*test/app/viewmodels/user_viewmodel_test.dart*

Por fim, confira processo dos testes automatizados no Github Actions.

[Github Actions](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/actions)

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get

## Próxima Branch:

[feat/viewmodels](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/viewmodels)

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

*[MVVM no Flutter - Estrutura para iniciantes | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=WgadnZcujuc)*

*[MASTERCLASS - Flutter, MobX, MVC e MVVM | balta.io - André Baltieri](https://www.youtube.com/watch?v=fsrJ_tNrOFk&t=2557s)*