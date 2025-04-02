# Arquitetura MVVM no Flutter


Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos arquiteturais relacionados à camada de View.

## View

As Views são componentes da arquitetura de software responsáveis pela apresentação dos dados. Elas constituem a interface com a qual os usuários interagem. 

No projeto, dentro da views foi criado um diretório para os bindings globais, utilizando os pacotes *get_it* e *flutter_getit* como injetor e modularizador de depedências, além do diretório modules, no qual separa modulos de funcionalidades. 

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

## Próximas Branches:

Criei duas branches opcionais para demonstrar diferentes abordagens na injeção de dependências, uma utilizando o *Provider* e outra utilizando o *Flutter Modular*.

[feat/provider](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/provider)

[feat/modular](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/modular)

## Referências

*[Flutter GetIt | Dart Packages](https://pub.dev/packages/flutter_getit)*

*[Estilos de Imagens | Storyset](https://storyset.com/)*

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*