import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// 离线存储管理类（KV存储）
///
/// 使用 `SharedPreferences` 提供简单的键值对离线存储功能。
/// 支持存储和读取常见类型的数据，包括字符串、布尔值、列表和 JSON。
/// 实现了单例模式，确保全局只有一个实例。
class Storage {
  // 单例模式实现
  static final Storage _instance = Storage._internal();
  factory Storage() => _instance;
  late final SharedPreferences _prefs;

  // 私有构造函数
  Storage._internal();

  /// 初始化 SharedPreferences 实例
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  // ================= 数据存储 =================
  /// 存储 JSON 数据
  ///
  /// 将对象序列化为 JSON 字符串并存储。
  /// - [key]: 存储的键
  /// - [value]: 存储的对象
  Future<bool> setJson(String key, Object value) async {
    return await _prefs.setString(key, jsonEncode(value));
  }

  /// 存储字符串数据
  ///
  /// - [key]: 存储的键
  /// - [value]: 存储的字符串值
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }

  /// 存储布尔值
  ///
  /// - [key]: 存储的键
  /// - [value]: 存储的布尔值
  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  /// 存储字符串列表
  ///
  /// - [key]: 存储的键
  /// - [value]: 存储的字符串列表
  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  // ================= 数据获取 =================

  /// 获取字符串数据
  ///
  /// - [key]: 存储的键
  /// - 返回: 对应的字符串值，如果不存在，返回空字符串。
  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  /// 获取布尔值
  ///
  /// - [key]: 存储的键
  /// - 返回: 对应的布尔值，如果不存在，返回 `false`。
  bool getBool(String key) {
    return _prefs.getBool(key) ?? false;
  }

  /// 获取字符串列表
  ///
  /// - [key]: 存储的键
  /// - 返回: 对应的字符串列表，如果不存在，返回空列表。
  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  // ================= 数据删除 =================

  /// 删除指定键的数据
  ///
  /// - [key]: 要删除的键
  /// - 返回: 是否成功删除
  Future<bool> remove(String key) async {
    return await _prefs.remove(key);
  }
}
