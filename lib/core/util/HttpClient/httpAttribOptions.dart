// ignore_for_file: public_member_api_docs, sort_constructors_first
class HttpClientAttributeOptions {
  String baseUrl;
  String url;
  int connectionTimeout;
  String contentType;
  HttpMethod method;
  Object? body;
  Map<String, String>? param;
  Map<String, String>? headers;
  int retries;
  HttpClientAttributeOptions({
    required this.baseUrl,
    required this.url,
    required this.connectionTimeout,
    required this.contentType,
    required this.method,
    this.body,
    this.headers,
    this.param,
    required this.retries,
  });
}

// ignore: constant_identifier_names
enum HttpMethod { GET, POST, PUT, DELETE, PATCH }
