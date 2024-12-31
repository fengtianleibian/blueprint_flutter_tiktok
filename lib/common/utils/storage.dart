import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// kv离线存储
class Storage {
  // 单例写法
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;
  late final SharedPreferences _prefs;

  Storage._internal();

  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  //存json
  Future<bool> setJson(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  //存Strind
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  //存 bool
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  //存 List
  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  // 获取 String
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  // 获取 bool
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  // 获取 List
  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  // 删除数据
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
