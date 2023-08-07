import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpAttribOptions.dart';

abstract class HttpService{
   Future<String?> send(HttpClientAttributeOptions httpAttribOptions);
}