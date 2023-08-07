import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpAttribOptions.dart';

class NewsApiHttpAttributes extends HttpClientAttributeOptions {
  NewsApiHttpAttributes()
      : super(
            baseUrl: "newsapi.org",
            url: "/v2//everything",
            connectionTimeout: 30,
            contentType: 'application/json',
            method: HttpMethod.GET,
            retries: 2,
            param: {
              "domains": "techcrunch.com",
              "apikey": "2a49c2171ea1471f8221aae7966a38c5"
            });
}
