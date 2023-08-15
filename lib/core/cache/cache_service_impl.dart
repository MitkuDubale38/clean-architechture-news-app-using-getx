// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_attrib_options.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_data_state.dart';
import 'package:newsappusingcleanarchitechture/core/cache/cache_service.dart';

class CacheServiceImplementation implements CacheService {
  @override
  Future<CacheDataState?> cacheData(
      CacheAttribOptions cacheAttribOptions) async {
    try {
      Directory directory = await getApplicationDocumentsDirectory();
      var cacheDB = Directory('${directory.path}/duty_free');
      BoxType boxType = BoxType(
          box: cacheAttribOptions.box!,
          collection: cacheAttribOptions.collection!,
          isLazyLoad: cacheAttribOptions.isLazyLoad,
          path: cacheDB.path);
      var dataBox = await boxType.getBoxType();
      switch (cacheAttribOptions.operation) {
        case OPERATIONS.CREATE:
          await dataBox.put(
            cacheAttribOptions.key!,
            cacheAttribOptions.value,
          );
          return const CacheDataSuccess("DATA SAVED");
        case OPERATIONS.READ:
          dynamic? data = await dataBox.get(cacheAttribOptions.key!);
          return data != null
              ? CacheDataSuccess(data)
              : const CacheDataFailed("Failed To read data");
        case OPERATIONS.UPDATE:
          return const CacheDataSuccess("DATA UPDATED");
        case OPERATIONS.DELETE:
          await dataBox.delete(cacheAttribOptions.key!);
          return const CacheDataSuccess("DATA DELETED");
        default:
          return const CacheDataFailed(
              "Unknown error occured while processing data");
      }
    } on HiveError catch (ex) {
      CacheDataFailed(ex.message);
    }
    return null;
  }
}

class BoxType {
  bool isLazyLoad;
  String path;
  String collection;
  String box;
  BoxType({
    required this.isLazyLoad,
    required this.path,
    required this.collection,
    required this.box,
  });
  getBoxType() async {
    if (isLazyLoad) {
      var openedBox = await Hive.openLazyBox<dynamic>(box,
          collection: collection, path: path);
      return openedBox;
    } else {
      var collections = await BoxCollection.open(collection, {box}, path: path);
      var openedBox = await collections.openBox<dynamic>(box);
      return openedBox;
    }
  }
}


//  ttl: DateTime.now()
//                   .add(Duration(days: cacheAttribOptions.expiresAfterDay))