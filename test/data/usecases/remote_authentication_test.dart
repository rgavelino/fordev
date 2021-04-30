import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:fordev/data/http/http.dart';
import 'package:fordev/data/usecases/usecases.dart';

import 'package:fordev/domain/usecases/authentication.dart';

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  HttpClientSpy httpClient;
  String url;
  RemoteAuthentication sut;
  AuthenticationParams params;

  setUp(() {
    httpClient = HttpClientSpy();
    url = faker.internet.httpUrl();
    sut = RemoteAuthentication(httpClient: httpClient, url: url);
    params = AuthenticationParams(
        email: faker.internet.email(), secret: faker.internet.password());
  });

  test(
    'Should call HttpClient with correct URL',
    () async {
      await sut.auth(params);

      verify(
        httpClient.request(
          url: url,
          method: 'post',
          body: {
            'email': params.email,
            'password': params.secret,
          },
        ),
      );
    },
  );

  test(
    'Should call HttpClient with correct values',
    () async {
      final httpClient = HttpClientSpy();
      final url = faker.internet.httpUrl();
      //Design Pattern - Triple A
      final sut = RemoteAuthentication(
          httpClient: httpClient, url: url); //sut - system under test

      await sut.auth(params);

      verify(
        httpClient.request(
          url: url,
          method: 'post',
          body: {
            'email': params.email,
            'password': params.secret,
          },
        ),
      );
    },
  );

  test(
    'Should call HttpClient with correct body',
    () async {
      final httpClient = HttpClientSpy();
      final url = faker.internet.httpUrl();
      //Design Pattern - Triple A
      final sut = RemoteAuthentication(
          httpClient: httpClient, url: url); //sut - system under test

      await sut.auth(params);

      verify(httpClient.request(
        url: url,
        method: 'post',
        body: {
          'email': params.email,
          'password': params.secret,
        },
      ));
    },
  );
}
