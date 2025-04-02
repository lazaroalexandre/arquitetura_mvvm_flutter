# Arquitetura MVVM no Flutter


Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos arquiteturais relacionados à camada de View.

## View

As Views são componentes da arquitetura de software responsáveis pela apresentação dos dados. Elas constituem a interface com a qual os usuários interagem. 

No projeto, dentro da views foi criado um diretório para os providers globais, utilizando o pacote *provider* como injetor de dependências, um diretório para as rotas, usando o pacote *go_router*, e um diretório para separar os módulos do sistema.

Dentro de cada modulo, é criado até 3 (três) diretórios, são eles: controllers, widgets e pages. 

Os controllers contém arquivos responsáveis pelo gerenciamento de estados e comportamentos, que serão refletidas nos widgets, além de mudanças imediatas no sistema. No projeto foi utilizado *ChangeNotifier* como gerenciador de estado no controle de usuários, temas e comportamentos de valores de sexo no formulário de contatos.

Os widgets contém arquivos que armazenam componentes reutilizáveis específicos do módulo, garantindo modularidade e organização do código.

Os pages contém as telas principais do módulo, organizando a estrutura da interface.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- cd uikit/
- flutter pub get
- cd ..
- flutter gen-l10n
- flutter run -d chrome

## Referências

*[Provider | Dart Packages](https://pub.dev/packages/provider)*

*[Create Multi Language App | Internationalization & Localization In Flutter - HeyFlutter.com](https://www.youtube.com/watch?v=zugxpAcbe4U)*

*[PROVIDER, GERENCIA OU DISTRIBUI OS ESTADOS? | William Silva](https://youtu.be/kz1712L1-Co?si=kZfk0-gUZStmthTd)*

*[go_router | pub.dev](https://pub.dev/packages/go_router)*