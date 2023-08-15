part of cleanArchitectureUtils;

abstract class HttpService {
  Future<dynamic> sendHttpRequest(
      HttpClientAttributeOptions httpAttribOptions);
}
