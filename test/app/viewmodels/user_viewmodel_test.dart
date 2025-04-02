import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/services/message/app_message_service.dart';
import 'package:arquitetura_flutter/app/utils/exceptions/app_exception.dart';
import 'package:arquitetura_flutter/app/utils/messages/error_message.dart';
import 'package:arquitetura_flutter/app/viewmodels/user_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class UserRepositoryMock extends Mock implements UserRepository {}

class AppMessageServiceMock extends Mock implements AppMessageService {}

void main() {
  late UserRepositoryMock userRepositoryMock;
  late AppMessageServiceMock appMessageServiceMock;
  late UserViewmodel userViewmodel;
  late List<UserModel> databaseMock;

  setUp(() {
    userRepositoryMock = UserRepositoryMock();
    appMessageServiceMock = AppMessageServiceMock();
    userViewmodel = UserViewmodel(
        userRepository: userRepositoryMock,
        appMessageService: appMessageServiceMock);
    databaseMock = [
      UserModel(
          id: '1',
          name: 'João',
          sex: 'M',
          email: 'joao@gmail.com',
          job: 'Analista de Sistemas',
          phone: '84992017118'),
      UserModel(
          id: '2',
          name: 'Pedro',
          sex: 'M',
          email: 'pedro@gmail.com',
          job: 'Gestor de Projetos',
          phone: '84992017119'),
      UserModel(
          id: '3',
          name: 'Maria',
          sex: 'F',
          email: 'maria@gmail.com',
          job: 'Engenheira de Software',
          phone: '84992017110')
    ];
  });

  group("Testando o UserViewmodel.", () {
    group("Testando o listAll.", () {
      test("Deve listar os contatos com sucesso.", () async {
        when(() => userRepositoryMock.getUsers()).thenAnswer(
          (_) async => Success(databaseMock),
        );

        await userViewmodel.listAll();

        expect(userViewmodel.isLoading.value, isFalse);
        expect(userViewmodel.users.value, isNotEmpty);
        expect(userViewmodel.users.value, isA<List<UserModel>>());
        expect(userViewmodel.filterUsers.value, isA<List<UserModel>>());
        expect(userViewmodel.users.value, databaseMock);
        expect(userViewmodel.filterUsers.value, isNotEmpty);
        expect(
            userViewmodel.filterUsers.value, equals(userViewmodel.users.value));
        expect(userViewmodel.users.value[1].email, equals('pedro@gmail.com'));

        verify(() => userRepositoryMock.getUsers()).called(1);
      });

      test("Deve falhar ao listar os contatos.", () async {
        when(() => userRepositoryMock.getUsers()).thenAnswer(
            (_) async => Failure(ClientException(message: ErrorMessage.get)));

        await userViewmodel.listAll();

        expect(userViewmodel.isLoading.value, isFalse);
        expect(userViewmodel.users.value, isEmpty);
        expect(userViewmodel.filterUsers.value, isEmpty);
        expect(
            userViewmodel.filterUsers.value, equals(userViewmodel.users.value));

        verify(() => userRepositoryMock.getUsers()).called(1);
      });
    });

    group("Testando o PostUser.", () {
      final user = UserModel(
        id: '4',
        name: 'Júlia',
        sex: 'F',
        email: 'julia@gmail.com',
        job: 'UX Designer',
        phone: '84992017111',
      );

      test("Deve registrar um novo contato com sucesso.", () async {
        when(() => userRepositoryMock.postUser(user)).thenAnswer(
          (_) async => Success(user),
        );

        when(() => appMessageServiceMock.showMessageSuccess(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.create(user);

        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.postUser(user)).called(1);
        verify(() => appMessageServiceMock.showMessageSuccess(any())).called(1);
      });

      test("Deve falhar ao registrar um novo contato.", () async {
        when(() => userRepositoryMock.postUser(user)).thenAnswer(
            (_) async => Failure(ClientException(message: ErrorMessage.post)));

        when(() => appMessageServiceMock.showMessageError(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.create(user);

        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.postUser(user)).called(1);
        verify(() => appMessageServiceMock.showMessageError(any())).called(1);
      });
    });

    group("Testando o PutUser.", () {
      final user = UserModel(
          id: '2',
          name: 'Pedro',
          sex: 'M',
          email: 'pedro@gmail.com',
          job: 'Gerente de Projeto',
          phone: '84992017117');

      final userNotExists = UserModel(
        id: '5',
        name: 'Ben',
        sex: 'M',
        email: 'ben@gmail.com',
        job: 'Desenvolvedor',
        phone: '84992017115',
      );
      test("Deve atualizar um contato já existente com sucesso.", () async {
        when(() => userRepositoryMock.putUser(user, user.id!)).thenAnswer(
          (_) async => Success(user),
        );

        when(() => appMessageServiceMock.showMessageSuccess(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.update(user, user.id!);

        expect(
            databaseMock.any(
              (element) => element.id == user.id,
            ),
            isTrue);
        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.putUser(user, user.id!)).called(1);
        verify(() => appMessageServiceMock.showMessageSuccess(any())).called(1);
      });

      test("Deve falhar ao atualizar um contato inexistente.", () async {
        when(() => userRepositoryMock.putUser(userNotExists, userNotExists.id!))
            .thenAnswer(
          (_) async => Failure(ClientException(message: ErrorMessage.put)),
        );

        when(() => appMessageServiceMock.showMessageError(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.update(userNotExists, userNotExists.id!);

        expect(
            databaseMock.any(
              (element) => element.id == userNotExists.id,
            ),
            isFalse);
        expect(userViewmodel.isLoading.value, isFalse);

        verify(() =>
                userRepositoryMock.putUser(userNotExists, userNotExists.id!))
            .called(1);
        verify(() => appMessageServiceMock.showMessageError(any())).called(1);
      });

      test("Deve falhar ao atualizar um contato existente.", () async {
        when(() => userRepositoryMock.putUser(user, user.id!)).thenAnswer(
          (_) async => Failure(ClientException(message: ErrorMessage.put)),
        );

        when(() => appMessageServiceMock.showMessageError(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.update(user, user.id!);

        expect(
            databaseMock.any(
              (element) => element.id == user.id,
            ),
            isTrue);
        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.putUser(user, user.id!)).called(1);
        verify(() => appMessageServiceMock.showMessageError(any())).called(1);
      });
    });

    group("Testando o DeleteUser.", () {
      const userId = '3';

      const userIdNotExists = '5';
      test("Deve apagar um contato já existente com sucesso.", () async {
        when(() => userRepositoryMock.deleteUser(userId)).thenAnswer(
          (_) async => const Success(unit),
        );

        when(() => appMessageServiceMock.showMessageSuccess(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.remove(userId);

        expect(
            databaseMock.any(
              (element) => element.id == userId,
            ),
            isTrue);
        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.deleteUser(userId)).called(1);
        verify(() => appMessageServiceMock.showMessageSuccess(any())).called(1);
      });

      test("Deve falhar ao apagar um contato inexistente.", () async {
        when(() => userRepositoryMock.deleteUser(userIdNotExists)).thenAnswer(
          (_) async => Failure(ClientException(message: ErrorMessage.delete)),
        );

        when(() => appMessageServiceMock.showMessageError(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.remove(userIdNotExists);

        expect(
            databaseMock.any(
              (element) => element.id == userIdNotExists,
            ),
            isFalse);
        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.deleteUser(userIdNotExists)).called(1);
        verify(() => appMessageServiceMock.showMessageError(any())).called(1);
      });

      test("Deve falhar ao apagar um contato existente.", () async {
        when(() => userRepositoryMock.deleteUser(userId)).thenAnswer(
          (_) async => Failure(ClientException(message: ErrorMessage.delete)),
        );

        when(() => appMessageServiceMock.showMessageError(any())).thenAnswer(
          (invocation) async => {},
        );

        await userViewmodel.remove(userId);

        expect(
            databaseMock.any(
              (element) => element.id == userId,
            ),
            isTrue);
        expect(userViewmodel.isLoading.value, isFalse);

        verify(() => userRepositoryMock.deleteUser(userId)).called(1);
        verify(() => appMessageServiceMock.showMessageError(any())).called(1);
      });
    });
  });
}
