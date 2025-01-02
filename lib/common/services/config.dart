import 'dart:ui';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:buleprint_frame/common/index.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

/// 配置服务
///
/// 提供全局的配置管理，包括应用的包信息、主题设置和多语言支持。
/// 继承自 `GetxService`，实现全局单例。
class ConfigService extends GetxService {
  // 单例模式，通过 `Get.find()` 获取实例
  static ConfigService get to => Get.find();

  // 初始化
  Future<ConfigService> init() async {
    // 获取平台包信息
    await getPlatform();
    // 初始化主题设置
    await initTheme();
    // 初始化多语言
    initLocale();
    return this;
  }

  // =================包信息===============
  // 平台包信息
  PackageInfo? _platform;

  /// 获取版本号
  String get version => _platform?.version ?? '-';

  // 获取包信息
  Future<void> getPlatform() async {
    _platform = await PackageInfo.fromPlatform(); // 获取平台相关信息
  }

  // =================多语言===============
  // 当前语言
  Locale locale = PlatformDispatcher.instance.locale;

  /// 初始化多语言设置
  ///
  /// 从本地存储中读取语言代码，如果存在，设置为当前语言。
  void initLocale() {
    // 获取本地存储的语言代码
    var langCode = Storage().getString(Constants.storageLanguageCode);
    if (langCode.isEmpty) {
      return;
    }
    var index = Translation.supportedLocales.indexWhere((element) {
      return element.languageCode == langCode;
    });
    // 如果语言不在支持列表中，退出
    if (index < 0) {
      return;
    }
    locale = Translation.supportedLocales[index]; // 设置当前语言
  }

  /// 更改语言
  ///
  /// 更新应用语言并保存到本地存储。
  void setLanguage(Locale value) {
    locale = value;
    // 更新 GetX 的语言环境
    Get.updateLocale(value);
    // 保存到本地存储
    Storage().setString(Constants.storageLanguageCode, value.languageCode);
  }

  // =================主题===============
  // 当前主题模式
  AdaptiveThemeMode themeMode = AdaptiveThemeMode.light;

  /// 初始化主题设置
  ///
  /// 从本地存储中读取保存的主题模式，如果没有，默认设置为浅色模式。
  Future<void> initTheme() async {
    // 获取保存的主题模式
    final savedThemeMode = await AdaptiveTheme.getThemeMode();
    // 默认浅色模式
    themeMode = savedThemeMode ?? AdaptiveThemeMode.light;
  }

  /// 更改主题模式
  ///
  /// 根据传入的主题键值切换主题。
  Future<void> setThemeMode(String themeKey) async {
    switch (themeKey) {
      case "light":
        AdaptiveTheme.of(Get.context!).setLight(); // 设置为浅色模式
        break;
      case "dark":
        AdaptiveTheme.of(Get.context!).setDark(); // 设置为深色模式
        break;
      case "system":
        AdaptiveTheme.of(Get.context!).setSystem(); // 设置为系统默认模式
        break;
    }
  }
}
