library cleanArchitectureUtils;

import 'dart:io';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:newsappusingcleanarchitechture/core/cache/cache_service.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service_impl.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiService.dart';
import 'package:newsappusingcleanarchitechture/core/network/Api/NewsApi/newsApiServiceImpl.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/httpAttribOptions.dart';
import 'package:http/retry.dart';
import 'package:newsappusingcleanarchitechture/core/util/HttpClient/prepareHttpHeader.dart';
import 'package:newsappusingcleanarchitechture/core/util/httpExceptionHandler/customExceptions.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/data_source/local/hive_service.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/repository/article_repository_from_cache.dart';
import 'package:newsappusingcleanarchitechture/features/news/data/repository/article_repository_impl.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/repository/article_repository.dart';
import 'package:newsappusingcleanarchitechture/features/news/domain/usecases/usecase.dart';

part "HttpClient/httpService.dart";
part "HttpClient/HttpServiceImpl.dart";
part "HttpClient/httpStatusWorthRetrying.dart";
part "HttpClient/processHttpRequest.dart";
part "httpExceptionHandler/http_exception_handler.dart";
part "dependency.dart";
