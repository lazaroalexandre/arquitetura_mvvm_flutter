# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos arquiteturais de ViewModels ao intermediar a camada de Views e Models, separar algumas responsabilidades da Controller.

## ViewModel

As ViewModels atuam como um intermediário entre a View e o Model, facilitando a ligação de dados e a lógica de apresentação. Um ViewModel transforma os dados do Model em uma forma que a View pode usar diretamente, ajudando a manter a View desacoplada da lógica de negócios. No projeto, o ViewModel ficou responsável por toda comunicação da model e services, que será refletida na View atráves da controller, que por sua vez servirá como um intermediador da ViewModel.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- flutter run -d chrome

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

*[MVVM no Flutter - Estrutura para iniciantes | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=WgadnZcujuc)*

*[MASTERCLASS - Flutter, MobX, MVC e MVVM | balta.io - André Baltieri](https://www.youtube.com/watch?v=fsrJ_tNrOFk&t=2557s)*