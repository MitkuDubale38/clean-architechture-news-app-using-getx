// ignore_for_file: public_member_api_docs, sort_constructors_first
class CacheAttribOptions {
  String? collection;
  String? box;
  String? key;
  String? value;
  bool isEncrypted = false;
  OPERATIONS operation;
  int expiresAfterDay;
  bool isLazyLoad = false;
  bool isAddingAnItemToCacheList;
  bool isRemovingAnItemFromCacheList;

  CacheAttribOptions({
    this.collection,
    this.box,
    this.key,
    this.value,
    required this.isEncrypted,
    required this.operation,
    required this.expiresAfterDay,
    required this.isLazyLoad,
    this.isAddingAnItemToCacheList = false,
    this.isRemovingAnItemFromCacheList = false,
  });
}

// ignore: constant_identifier_names
enum OPERATIONS { CREATE, UPDATE, DELETE, READ }
