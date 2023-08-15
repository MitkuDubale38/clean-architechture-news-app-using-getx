// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:newsappusingcleanarchitechture/core/cache/cache_attrib_options.dart';

class NewsApiCacheProperty extends CacheAttribOptions {
  String dataKey;
  String dataValue;
  NewsApiCacheProperty(
    this.dataKey,
    this.dataValue,
  ) : super(
          expiresAfterDay: 20,
          isEncrypted: false,
          isLazyLoad: false,
          operation: OPERATIONS.READ,
          box: "NewsBox",
          collection: "NewsCollection",
          key: dataKey,
          value: dataValue,
        );
}
