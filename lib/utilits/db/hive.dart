import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HiveDB {
  ///////////*********************** My account Save area /////////////
  /// ///////////*********************** post /////////////
  sotreUserAccount(boxname, key, value, context) async {
    var box = await Hive.openBox(boxname);
    var list = [];
    if (box.get(key) != null) {
      list = [...box.get(key)];
      for (int i = 0; i < list.length; i++) {
        if (list[i]['key'] == value['key']) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Already Add to Your account !"),
            backgroundColor: Colors.white60,
          ));
        } else {
          list.add(value);
        }
      }
    } else {
      list.add(value);
    }

    await box.put(key, list);
  }

  ///////////*********************** get /////////////
  Future<dynamic> fetchUserAccount(
    boxname,
    key,
  ) async {
    var box = await Hive.openBox(boxname);

    return box.get(key);
  }

///////////*********************** user info Save area /////////////
  /// ///////////*********************** Post /////////////
  storeUser(boxname, key, value) async {
    var box = await Hive.openBox(boxname);
    box.add(value);
  }

  ///////////*********************** Get /////////////
  Future<dynamic> fetchUser(
    boxname,
    key,
  ) async {
    var box = await Hive.openBox(boxname);

    return box.get(key);
  }
}
