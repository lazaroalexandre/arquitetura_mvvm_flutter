# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, são abordados conceitos de design patterns, utilizando o padrão Service para salvar o estado do tema do sistema ao clicar no switch, mesmo que a tela seja atualizada.

## Service

Os Services são componentes que encapsulam a lógica de negócios que não pertence ao Model ou à View. Eles podem ser usados para operações que envolvem lógica complexa, mantendo o código organizado e a lógica de negócios desacoplada das camadas de apresentação e persistência. No projeto, o Service é utilizado para persistir dados pela interface e é implementado com o pacote *shared_preferences*. Este pacote poderá ser trocado por outro que também armazena dados em local storage. O Service implementado é integrado na Controller, servindo para guardar o estado do tema alterado pelo switch, mesmo atualizadando a paǵina.

## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get
- flutter run -d chrome

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*