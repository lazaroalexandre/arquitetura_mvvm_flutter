# Arquitetura MVVM no Flutter

Este projeto tem o objetivo de compartilhar meus conhecimentos sobre **arquitetura de software**,  implementando alguns **design patterns** para tornar o desenvolvimento de **código organizado**, **legível**, **testável** e **adaptável**, utilizando **Flutter** como ferramenta frontend principal.

Nesta branch, será abordados conceitos de design patterns, utilizando o padrão Repository.

## Repository

Os Repositories são responsáveis por encapsular a lógica de acesso a dados, fornecendo uma interface consistente para operações de CRUD (Create, Read, Update, Delete). Eles atuam como uma camada de abstração entre a fonte de dados (APIs, banco de dados, cache, etc.) e a lógica de negócios, garantindo que outras partes do sistema não dependam diretamente da implementação dos dados.

No projeto, o UserRepository centraliza o acesso e a manipulação dos dados de usuários, intermediando a comunicação com a API por meio do ClientService. Ele garante que os dados externos sejam corretamente enviados, processados e convertidos para o modelo interno da aplicação. 

**Observação**

Foi criado o diretório chamato utils, com o fito de armazenar funções, classes e constantes reutilizáveis que não pertencem diretamente a uma camada específica do projeto, mas que são úteis em várias partes da aplicação. Nele, você encontra mensagens, exceções e rotas de api, por exemplo.

Alem disso, foi criado testes de unidade do UserRepository. Você pode acessá-los pelo seguinte caminho:

*test/app/repositories/user_repository_impl_test.dart*

Por fim, foi adicionado um workflow de testes, para tornar os testes automatizados no github. Você pode acessa o arquivo pelo seguinte caminho: 

*.github/workflows/tests.yaml*

[Github Actions](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/actions)


## Inicialização

Primeiramente, instale todas as configurações do flutter em sua máquina, caso já não esteja instalada. Siga a documentação: https://docs.flutter.dev/get-started/install

Após a configuração, volte ao projeto e execute os seguintes comandos no terminal:

- flutter pub get

## Configurações da API consumida

Estou utilizando uma a api teste do *[MokcAPI](https://mockapi.io/projects)* para simular um servidor de dados em núvem, mas nada impede você ao consumir uma api real.

Caso a api que eu criei não esteja mais em uso ou você esteja recebendo erro de servidor, siga a passo para criar um novo modelo:

*[Clique aqui para ter acesso ao tutorial da API.](https://docs.google.com/document/d/1hETCFD5Gb_KqaWgA68qNwBnRrxrzVkEvkjbI-jjYws0/edit?usp=sharing)*

Se deseja consumir uma api backend criada por você ou por uma empresa, aconselho a adicionar interceptadores no sistema, caso seja trabalho algo relacionado a segurança no sistema, como o uso de tokens JWT's para a autorização de acesso de usuários. 

**Observeção:**

Não é ideal deixar dados sensíveis público no frontend, como o de endpoits de uma api, já que compromete a segurança do sistema. Estou deixando público apenas por fins educacionais. Dessa forma, caso queira deixar seu sistema mais protegido, indico o uso do pacote *[envied](https://pub.dev/packages/envied)* e *[envied_generator](https://pub.dev/packages/envied_generator)*.

## Próxima Branch:

[feat/viewmodels](https://github.com/lazaroalexandre/arquitetura_mvvm_flutter/tree/feat/viewmodels)

## Referências

*[Semana do Flutter - Arquitetura | Flutterando TV - Jacob Moura](https://www.youtube.com/watch?v=8lqj7YQ71lo&list=PLlBnICoI-g-c_ZIHqzQjg5E4Re92-qYXn)*

*[Semana do Flutter - Testes de Unidade | Jacob Moura](https://www.youtube.com/watch?v=zlYQe-9QMug&list=PLlBnICoI-g-etEtbvgDnO40SYKOSktCj4)*

*[Automating Unit Testing for Your Flutter Project with GitHub Actions | Medium - Reme Le Hane](https://remelehane.medium.com/automating-unit-testing-for-your-flutter-project-with-github-actions-8b18f30a65fa)*