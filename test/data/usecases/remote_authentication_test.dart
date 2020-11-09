import 'package:test/test.dart';
import 'package:faker/faker.dart';
import 'package:mockito/mockito.dart';

import 'package:anarcake/domain/usecases/usecases.dart';

import 'package:anarcake/data/usercases/usecases.dart';
import 'package:anarcake/data/http/http.dart';


class HttpClientSpy extends Mock implements HttpClient {}

void main() {

  RemoteAuthentication sut;
  HttpClientSpy httpClient;
  String url;

  setUp((){
    httpClient = HttpClientSpy();
    String url = faker.internet.httpUrl();

    //arrange
    sut = RemoteAuthentication(
        httpClient: httpClient,
        url: url,
      );
  });
  test('Should call HttpClient with correct URL', () async{
   
    final AuthenticationParams params = AuthenticationParams(
      email: faker.internet.email(),
      secret: faker.internet.password()
    );

    //act
    await sut.auth(params);

    //assert
    verifyNever(httpClient.request(
      url: url,
      method: 'post',
      body: {
        "email": params.email,
        "password": params.secret
      }
    ));
  });
}