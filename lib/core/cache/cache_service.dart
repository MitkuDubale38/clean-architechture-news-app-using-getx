import 'package:newsappusingcleanarchitechture/core/cache/cache_attrib_options.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_data_state.dart';

abstract class CacheService {
  Future<CacheDataState<dynamic>?> cacheData(
      CacheAttribOptions cacheAttribOptions);
}
