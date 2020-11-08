import 'package:test/test.dart';
import 'package:faker/faker.dart';
import 'package:meta/meta.dart';
import 'package:mockito/mockito.dart';

class RemoteAuthentication {
  final HttpClient httpClient;
  final String url;
  RemoteAuthentication({
    @required this.httpClient,
    @required this.url
  });
  Future<void> auth() async{
    await httpClient.request(url: url, method: 'post');
  }
}

abstract class HttpClient {
  Future<void> request({
    @required String url,
    @required String method,
  });
}

class HttpClientSpy extends Mock implements HttpClient {}

void main() {
  test('Should call HttpClient with correct URL', () async{
    final httpClient = HttpClientSpy();
    final String url = faker.internet.httpUrl();

    //arrange
    final RemoteAuthentication sut = 
      RemoteAuthentication(
        httpClient: httpClient,
        url: url,
      );
    //act
    await sut.auth();

    //assert
    verify(httpClient.request(
      url: url,
      method: 'post'
    ));
  });
}