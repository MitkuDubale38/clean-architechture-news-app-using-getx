import 'package:hive/hive.dart';

abstract class LocalDataState<T> {
  final T? data;
  final dynamic error;
  const LocalDataState({
    this.data,
    this.error,
  });
}

class LocalDataSuccess<T> extends LocalDataState<T> {
  const LocalDataSuccess(T data) : super(data: data);
}

class LocalDataFailed<T> extends LocalDataState<T> {
  const LocalDataFailed(dynamic error) : super(error: error);
}
