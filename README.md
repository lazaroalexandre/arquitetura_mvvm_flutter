# Arquitetura MVVM no Flutter


Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos de internacionalização.

## Internacionalização

A internacionalização é responsável por gerenciar a tradução e adaptação de textos dentro do sistema, permitindo que a aplicação suporte múltiplos idiomas de forma dinâmica. Ela garante que os conteúdos exibidos se ajustem ao idioma e às convenções regionais do usuário, proporcionando uma experiência acessível e personalizada.

No projeto, utilizei o *flutter_localizations* e o *flutter gen-l10n* para gerar automaticamente os arquivos de tradução com base nos recursos .arb para o idioma pt-br e en-us, tornando a implementação escalável e de fácil manutenção. Por fim, os arquivos estão localizado no diretório *lib/l10n*.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- cd uikit/
- flutter pub get
- cd ..
- flutter gen-l10n

## Próxima Branch:

[feat/views](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/viewmodels)

## Referências

*[Create Multi Language App | Internationalization & Localization In Flutter - HeyFlutter.com](https://www.youtube.com/watch?v=zugxpAcbe4U)*
