# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

À medida que você explora as diferentes branches, encontrará a evolução de um **sistema web de controle de contatos**, utilizando o *ChangeNotifier* como gerenciador de estado e *GetIt, Modular e Provider* como ferramentas de injeção de dependências.

Neste projeto, você poderá explorar conceitos que vão desde a **construção arquitetural MVVM**, incluindo *views, models, controllers e viewmodels*, até **design patterns** como *repositories e services*, além de **metodologias de design** como o *Atomic Design*. Ademais, serão abordadas configurações adicionais, como a **internacionalização** para suporte a diferentes idiomas no sistema.

As **versões finais** do sistema estão disponíveis nas branches *"feat/get_it"*, *"feat/provider"* e *"feat/modular"*.

[Clique aqui para assistir a versão final do sistema.](https://drive.google.com/file/d/17s7VM8mEu6T87aJExEDxoqOu-PzCt9I-/view?usp=drive_link)

Por fim, caso queira compartilhar sugestões sobre o projeto, entre em contato pelo e-mail: lazaroalexandre.dev@gmail.com.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- flutter gen-l10n *(Somente nas branches feat/get_it, feat/provider e feat/modular)*
- flutter run -d chrome

## Configurações da API consumida

 Na maioria das branches, utilizo uma a api do *[MokcAPI](https://mockapi.io/)* como um servidor de dados que é consumido pelo flutter.
 Caso a api que criei não esteja mais em uso ou você esteja recebendo erro de servidor, siga a passo para criar um novo modelo:
    
 *[Clique aqui para assistir o tutorial da API.](media/tutorial_api.mp4)*

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

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
