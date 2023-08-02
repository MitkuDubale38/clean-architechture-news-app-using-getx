import 'dart:convert';

import 'package:hive/hive.dart';

class HiveStorage {
  HiveStorage();

  static final _storage = Hive.box('newsApp');

  Future<dynamic> getSavedData(String key) async {
    try {
      if (key.isEmpty) return null;
      var response = await _storage.get(key);
      var data = json.decode(response);
      if (response != null) {
        return data;
      } else {
        return null;
      }
    } catch (ex) {
      return null;
    }
  }

  Future<bool> saveData(String key, List<Map<String, dynamic>> value) async {
    try {
      if (key.isEmpty) return false;
      var data = json.encode(value);
      await _storage.put(key, data);
      return true;
    } catch (ex) {
      rethrow;
    }
  }

  Future<bool> removeItemFromData(String key, Map<String, dynamic> item) async {
    List<Map<String, dynamic>> newFavList = [];
    var prevData = await getSavedData("favorites");
    prevData.removeWhere((element) => element["title"] == item["title"]);
    List<Map<String, dynamic>> maps = List<Map<String, dynamic>>.from(
        prevData.map((item) => item as Map<String, dynamic>));
    newFavList.addAll(maps);
    final status = saveData("favorites", newFavList);
    return status;
  }
}
