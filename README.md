# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos de injeção de dependência com *Provider* envolvida em uma organização de código modularizado, além da inserção de metodologias de design como o Atomic Design e internacionalização para suporte a diferentes idiomas no sistema.

## Provider

O Provider é uma biblioteca popular para gerenciamento de estado e injeção de dependências no Flutter. Ele é amplamente utilizado por sua simplicidade e flexibilidade, permitindo um gerenciamento eficiente do estado e a injeção de dependências de maneira reativa. No projeto, o Provider está sendo usado para gerenciar os controllers, utilizando o *MultiProvider* para gerenciar múltiplas dependências.

## Atomic Design

O Atomic Design é uma metodologia para a criação de sistemas de design de interfaces de usuário, a fim de organizar componentes de UI em uma hierarquia. No projeto, o atomic design é encontrada na pasta atomic da biblioteca *uikit*, na qual é dividida em *atoms, molecules e organisms*. Além disso, a *uikit* fornece tokens e visual_entity que fazem parte do estilo padronizado do layout do sistema e que são fundamentais para a construção de componentes e widgets.

## Internacionalização

A Internacionalização é o processo de projetar e desenvolver um aplicativo de forma que ele possa ser facilmente adaptado para diferentes idiomas e regiões sem a necessidade de uma engenharia adicional. Em conjunto com o pacote *flutter_localizations*, o idioma do aplicativo é adapte de acordo com a lingua na qual a região que o sistema é acessado. No projeto, a internacionalização é gerenciada no diretório l10n e configurada no AppWidget, com o fito de fornecer traduções nos idiomas português (PT-BR) e inglês (ES-US).

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- flutter gen-l10n 
- flutter run -d chrome

## Configurações da API consumida

 Na maioria das branches, utilizo uma a api do *[MokcAPI](https://mockapi.io/)* como um servidor de dados que é consumido pelo flutter.
 Caso a api que criei não esteja mais em uso ou você esteja recebendo erro de servidor, siga a passo para criar um novo modelo:
    
 *[Clique aqui para assistir o tutorial da API.](https://drive.google.com/file/d/17tk05ef3TeXuKXSsdQmhbiUxGCtkgQm1/view?usp=drive_link)*

## Referências

*[Provider | Dart Packages](https://pub.dev/packages/provider)*


*[Create Multi Language App | Internationalization & Localization In Flutter - HeyFlutter.com](https://www.youtube.com/watch?v=zugxpAcbe4U)*

*[Flutter — Building a Design System with Atomic Design | Medium - HlfDev](https://medium.com/@hlfdev/building-a-design-system-with-atomic-design-in-flutter-a7a16e28739b)*

*[AULÃO Flutter Web - Responsividade | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=UnAuTnR_ZM8)*

*[Tirando dúvidas com Rodrigo Rahman | Instagram - @rodrigorahman.dev](https://www.instagram.com/rodrigorahman.dev?igsh=MWFuYXE1MnNrMW4xMA==)*

*[Estilos de Imagens | Storyset](https://storyset.com/)*

*[PROVIDER, GERENCIA OU DISTRIBUI OS ESTADOS? | William Silva](https://youtu.be/kz1712L1-Co?si=kZfk0-gUZStmthTd)*