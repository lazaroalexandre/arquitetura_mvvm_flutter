import 'package:arquitetura_flutter/app/models/user_model.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository.dart';
import 'package:arquitetura_flutter/app/repositories/user_repository_impl.dart';
import 'package:arquitetura_flutter/app/services/client/client_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:result_dart/result_dart.dart';

class ClientMock extends Mock implements ClientService {}

void main() {
  late ClientMock clientMock;
  late UserRepository userRepository;
  late List<UserModel> databaseMock;

  setUp(() {
    clientMock = ClientMock();
    userRepository = UserRepositoryImpl(clientService: clientMock);
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

  group("Testando o UserRepository.", () {
    group("Testando o GetUser.", () {
      test("Deve listar os contatos com sucesso.", () async {
        final response = Response(
          requestOptions: RequestOptions(),
          data: databaseMock.map((e) => e.toMap()).toList(),
        );

        when(() => clientMock.get(any())).thenAnswer(
          (_) async => response,
        );

        final result = await userRepository.getUsers();

        expect(result.isSuccess(), isTrue);
        expect(result.getOrNull(), isNotEmpty);
        expect(result.getOrNull(), isA<List<UserModel>>());
        expect(result.getOrNull()?.length, equals(databaseMock.length));

        verify(() => clientMock.get(any())).called(1);
      });

      test("Deve falhar ao listar os contatos.", () async {
        final response = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response:
                Response(requestOptions: RequestOptions(), statusCode: 500));

        when(() => clientMock.get(any())).thenThrow(response);

        final result = await userRepository.getUsers();

        expect(result.isError(), isTrue);
        expect(result.getOrNull()?.length, isNull);
        expect(result.getOrNull(), isNull);

        verify(() => clientMock.get(any())).called(1);
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
        final response = Response(
          requestOptions: RequestOptions(),
          data: user.toMap(),
        );

        when(() => clientMock.post(any(), any())).thenAnswer(
          (_) async => response,
        );

        final result = await userRepository.postUser(user);

        expect(result.isSuccess(), isTrue);
        expect(result.getOrNull(), isA<UserModel>());
        expect(result.getOrNull(), isNotNull);

        verify(() => clientMock.post(any(), any())).called(1);
      });

      test("Deve falhar ao registrar um novo contato.", () async {
        final response = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response:
                Response(requestOptions: RequestOptions(), statusCode: 500));

        when(() => clientMock.post(any(), any())).thenThrow(response);

        final result = await userRepository.postUser(user);

        expect(result.isError(), isTrue);
        expect(result.getOrNull(), isNull);

        verify(() => clientMock.post(any(), any())).called(1);
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
        final response = Response(
          requestOptions: RequestOptions(),
          data: user.toMap(),
        );

        when(() => clientMock.put(any(), any())).thenAnswer(
          (_) async => response,
        );

        final result = await userRepository.putUser(user, user.id!);

        expect(result.isSuccess(), isTrue);
        expect(
            databaseMock.any(
              (element) => element.id == user.id,
            ),
            isTrue);
        expect(result.getOrNull(), isA<UserModel>());
        expect(result.getOrNull(), isNotNull);
        expect(result.getOrNull()?.id, isNotNull);

        verify(() => clientMock.put(any(), any())).called(1);
      });

      test("Deve falhar ao atualizar um contato inexistente.", () async {
        final response = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response:
                Response(requestOptions: RequestOptions(), statusCode: 404));

        when(() => clientMock.put(any(), any())).thenThrow(response);

        final result =
            await userRepository.putUser(userNotExists, userNotExists.id!);

        expect(result.isError(), isTrue);
        expect(
            databaseMock.any(
              (element) => element.id == userNotExists.id,
            ),
            isFalse);
        expect(result.getOrNull(), isNull);

        verify(() => clientMock.put(any(), any())).called(1);
      });

      test("Deve falhar ao atualizar um contato existente.", () async {
        final response = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response:
                Response(requestOptions: RequestOptions(), statusCode: 500));

        when(() => clientMock.put(any(), any())).thenThrow(response);

        final result = await userRepository.putUser(user, user.id!);

        expect(result.isError(), isTrue);
        expect(
            databaseMock.any(
              (element) => element.id == user.id,
            ),
            isTrue);
        expect(result.getOrNull(), isNull);

        verify(() => clientMock.put(any(), any())).called(1);
      });
    });

    group("Testando o DeleteUser.", () {
      const userId = '3';

      const userIdNotExists = '5';
      test("Deve apagar um contato já existente com sucesso.", () async {
        when(() => clientMock.delete(any())).thenAnswer(
          (_) async => {},
        );

        final result = await userRepository.deleteUser(userId);

        expect(result.isSuccess(), isTrue);
        expect(userId, isNotNull);
        expect(
            databaseMock.any(
              (element) => element.id == userId,
            ),
            isTrue);
        expect(result.getOrNull(), unit);

        verify(() => clientMock.delete(any())).called(1);
      });

      test("Deve falhar ao apagar um contato inexistente.", () async {
        final response = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response:
                Response(requestOptions: RequestOptions(), statusCode: 404));

        when(() => clientMock.delete(any())).thenThrow(response);

        final result = await userRepository.deleteUser(userIdNotExists);

        expect(result.isError(), isTrue);
        expect(
            databaseMock.any(
              (element) => element.id == userIdNotExists,
            ),
            isFalse);
        expect(result.getOrNull(), isNull);

        verify(() => clientMock.delete(any())).called(1);
      });

      test("Deve falhar ao apagar um contato existente.", () async {
        final response = DioException(
            requestOptions: RequestOptions(),
            type: DioExceptionType.badResponse,
            response:
                Response(requestOptions: RequestOptions(), statusCode: 500));

        when(() => clientMock.delete(any())).thenThrow(response);

        final result = await userRepository.deleteUser(userId);

        expect(result.isError(), isTrue);
        expect(
            databaseMock.any(
              (element) => element.id == userId,
            ),
            isTrue);
        expect(result.getOrNull(), isNull);

        verify(() => clientMock.delete(any())).called(1);
      });
    });
  });
}
