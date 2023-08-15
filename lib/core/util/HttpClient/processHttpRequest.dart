part of cleanArchitectureUtils;

class ProcessHttpRequest {
  Future<http.Response> processPostRequest(RetryClient httpClient,
      HttpClientAttributeOptions httpAttribOptions) async {
    return await httpClient
        .post(
          Uri.https(
            httpAttribOptions.baseUrl,
            httpAttribOptions.url,
          ),
          headers: httpAttribOptions.headers,
          body: httpAttribOptions.body,
        )
        .timeout(
          Duration(seconds: httpAttribOptions.connectionTimeout),
        );
  }

  Future<http.Response> processGetRequest(RetryClient httpClient,
      HttpClientAttributeOptions httpAttribOptions) async {
    return await httpClient
        .get(
          Uri.https(
            httpAttribOptions.baseUrl,
            httpAttribOptions.url,
            httpAttribOptions.param,
          ),
          headers: httpAttribOptions.headers,
        )
        .timeout(
          Duration(seconds: httpAttribOptions.connectionTimeout),
        );
  }
}
