part of cleanArchitectureUtils;

class HttpServiceImpl implements HttpService {
  @override
  Future<dynamic> sendHttpRequest(
      HttpClientAttributeOptions httpAttribOptions) async {
    try {
      // instantiating  http client class
      final httpClient =
          RetryClient(http.Client(), retries: httpAttribOptions.retries,
              when: (http.BaseResponse response) {
        return HttpStatusWorthRetying.isWorthRetrying(response.statusCode);
      });

      //instantiating response object
      http.Response? response;

      //instantiating http processor class
      ProcessHttpRequest processHttpRequest = ProcessHttpRequest();

      //preparing header
      PrepareHeader prepareHeader = PrepareHeader(
          contentType: httpAttribOptions.contentType,
          isAuthorizationRequired: httpAttribOptions.isAuthorizationRequired);

      //assigning header
      httpAttribOptions.headers = prepareHeader.header;

      switch (httpAttribOptions.method) {
        case HttpMethod.GET:
          response = await processHttpRequest.processGetRequest(
              httpClient, httpAttribOptions);
          if (response.statusCode == 200) {
            return response;
          } else if (response.statusCode == 401 || response.statusCode == 403) {
            //refresh access token and retry the request  again
          }
          break;
        case HttpMethod.POST:
          response = await processHttpRequest.processPostRequest(
              httpClient, httpAttribOptions);
          if (response.statusCode == 201) {
            return response;
          } else if (response.statusCode == 401 || response.statusCode == 403) {
            //refresh access token and retry the request  again
          }
          break;
        default:
          break;
      }
    } on Exception catch (e) {
      String message = HandleHttpException().handleHttpResponse(e);
      
    }
    return null;
  }
}
