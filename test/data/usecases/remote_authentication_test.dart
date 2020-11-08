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
   
    //act
    await sut.auth();

    //assert
    verify(httpClient.request(
      url: url,
      method: 'post'
    ));
  });
}