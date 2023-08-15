abstract class CacheDataState<T> {
  final T? data;
  final dynamic error;
  const CacheDataState({
    this.data,
    this.error,
  });
}

class CacheDataSuccess<T> extends CacheDataState<T> {
  const CacheDataSuccess(T data) : super(data: data);
}

class CacheDataFailed<T> extends CacheDataState<T> {
  const CacheDataFailed(dynamic error) : super(error: error);
}
