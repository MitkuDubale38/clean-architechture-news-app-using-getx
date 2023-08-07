import 'package:http/http.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpAttribOptions.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpService.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpStatusWorthRetrying.dart';

class HttpServiceImpl implements HttpService {
  @override
  Future<String?> send(HttpClientAttributeOptions httpAttribOptions) async {
    try {
      // instantiating  http client class
      final httpClient =
          RetryClient(http.Client(), retries: httpAttribOptions.retries,
              when: (http.BaseResponse response) {
        return HttpStatusWorthRetying.isWorthRetrying(response.statusCode);
      });

      //preparing response object
      Response? response;

      //preparing header
      Map<String, String> header = {
        'Content-type': httpAttribOptions.contentType,
        'Authorization': "  Bearer "
      };

      //assigning header
      httpAttribOptions.headers = header;

      //returning response based on request method
      if (httpAttribOptions.method == HttpMethod.GET) {
        // creating http clients url by passing base url, url and query parameters
        response = await httpClient
            .get(
              Uri.https(httpAttribOptions.baseUrl, httpAttribOptions.url,
                  httpAttribOptions.param),
              headers: httpAttribOptions.headers,
            )
            .timeout(
              Duration(seconds: httpAttribOptions.connectionTimeout),
            );
        if (response.statusCode == 200) {
          return response.body;
        } else if (response.statusCode == 401 || response.statusCode == 403) {
          //refresh access token and retry the request  again
        }
      } else if (httpAttribOptions.method == HttpMethod.PUT) {
      } else if (httpAttribOptions.method == HttpMethod.PATCH) {
      } else if (httpAttribOptions.method == HttpMethod.DELETE) {
      } else if (httpAttribOptions.method == HttpMethod.POST) {}
    } catch (ex) {
      print(ex);
    }
    return null;
  }
}
