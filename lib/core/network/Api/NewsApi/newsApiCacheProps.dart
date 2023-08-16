// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newsappusingcleanarchitechture/core/cache/cache_attrib_options.dart';

class NewsApiCacheProperty extends CacheAttribOptions {
  String? dataKey;
  String? dataValue;
  OPERATIONS operation;
  bool isAddingAnItemToCacheList;
  bool isRemovingAnItemFromCacheList;
  NewsApiCacheProperty({
    this.dataKey,
    this.dataValue,
    required this.operation,
    this.isAddingAnItemToCacheList = false,
    this.isRemovingAnItemFromCacheList = false,
  }) : super(
          expiresAfterDay: 20,
          isEncrypted: false,
          isLazyLoad: false,
          operation: operation,
          box: "NewsBox",
          collection: "NewsCollection",
          key: dataKey,
          value: dataValue,
          isAddingAnItemToCacheList: isAddingAnItemToCacheList,
          isRemovingAnItemFromCacheList: isRemovingAnItemFromCacheList,
        );
}
