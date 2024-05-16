# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

<<<<<<< HEAD
À medida que você explora as diferentes branches, encontrará a evolução de um **sistema web de controle de contatos**, utilizando o *ChangeNotifier* como gerenciador de estado e *GetIt, Modular e Provider* como ferramentas de injeção de dependências.

Neste projeto, você poderá explorar conceitos que vão desde a **construção arquitetural MVVM**, incluindo *views, models, controllers e viewmodels*, até **design patterns** como *repositories e services*, além de **metodologias de design** como o *Atomic Design*. Ademais, serão abordadas configurações adicionais, como a **internacionalização** para suporte a diferentes idiomas no sistema.

As **versões finais** do sistema estão disponíveis nas branches *"feat/get_it"*, *"feat/provider"* e *"feat/modular"*.

*[Clique aqui para assistir a versão final do sistema.](https://drive.google.com/file/d/17s7VM8mEu6T87aJExEDxoqOu-PzCt9I-/view?usp=drive_link)*

Por fim, caso queira compartilhar sugestões sobre o projeto, entre em contato pelo e-mail: lazaroalexandre.dev@gmail.com.

## Inicialização

=======
Nesta branch, são abordados conceitos de design patterns, utilizando o padrão Repository para gerenciar a comunicação entre a API externa e o frontend construído em Flutter.

## Repository

Os Repositories são responsáveis por encapsular a lógica de acesso aos dados, oferecendo uma interface para operações de CRUD (Create, Read, Update, Delete) e abstraindo interações com o banco de dados por meio da API externa. Eles mantêm a lógica de acesso a dados separada da lógica de negócios. No projeto, o Repository é utilizado para direcionar os dados externos por meio de sua interface e é implementado com o pacote *dio*, utilizado por um novo serviço de usuário para consumir a fonte de dados externa. Este pacote pode ser substituído por outro que também realize chamadas HTTP sem afetar o modelo de repository criado na interface. Dessa forma, o repository também pode ser integrado em uma nova ViewModel de usuário (contatos) e servirá para manipular dados na View por meio da nova controller de usuário.

## Inicialização

>>>>>>> feacc7d (Documentação final do repository)
Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
<<<<<<< HEAD
- flutter gen-l10n *(Somente nas branches feat/get_it, feat/provider e feat/modular)*
- flutter run -d chrome

## Configurações da API consumida

 Na maioria das branches, utilizo uma a api do *[MokcAPI](https://mockapi.io/)* como um servidor de dados que é consumido pelo flutter.
 Caso a api que criei não esteja mais em uso ou você esteja recebendo erro de servidor, siga a passo para criar um novo modelo:
    
 *[Clique aqui para assistir o tutorial da API.](https://drive.google.com/file/d/17tk05ef3TeXuKXSsdQmhbiUxGCtkgQm1/view?usp=drive_link)*

=======
- flutter run -d chrome

>>>>>>> feacc7d (Documentação final do repository)
## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

<<<<<<< HEAD
*[Flutter Modular | Flutterando](https://modular.flutterando.com.br/docs/intro/)*

*[Flutter GetIt | Dart Packages](https://pub.dev/packages/flutter_getit)*

*[Provider | Dart Packages](https://pub.dev/packages/provider)*

*[Exemplo de Requisição http com pacote DIO | DIO - Leandro Santos](https://www.dio.me/articles/exemplo-de-requisicao-http-com-pacote-dio)*

*[Create Multi Language App | Internationalization & Localization In Flutter - HeyFlutter.com](https://www.youtube.com/watch?v=zugxpAcbe4U)*

*[Flutter — Building a Design System with Atomic Design | Medium - HlfDev](https://medium.com/@hlfdev/building-a-design-system-with-atomic-design-in-flutter-a7a16e28739b)*

*[AULÃO Flutter Web - Responsividade | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=UnAuTnR_ZM8)*

*[MVVM no Flutter - Estrutura para iniciantes | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=WgadnZcujuc)*

*[MASTERCLASS - Flutter, MobX, MVC e MVVM | balta.io - André Baltieri](https://www.youtube.com/watch?v=fsrJ_tNrOFk&t=2557s)*

*[Tirando dúvidas com Rodrigo Rahman | Instagram - @rodrigorahman.dev](https://www.instagram.com/rodrigorahman.dev?igsh=MWFuYXE1MnNrMW4xMA==)*

*[Estilos de Imagens | Storyset](https://storyset.com/)*

*[PROVIDER, GERENCIA OU DISTRIBUI OS ESTADOS? | William Silva](https://youtu.be/kz1712L1-Co?si=kZfk0-gUZStmthTd)*
=======
*[Exemplo de Requisição http com pacote DIO | DIO - Leandro Santos](https://www.dio.me/articles/exemplo-de-requisicao-http-com-pacote-dio)*
>>>>>>> feacc7d (Documentação final do repository)
