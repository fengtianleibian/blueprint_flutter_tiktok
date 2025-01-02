import 'package:buleprint_frame/common/i18n/locales/locale_en.dart';
import 'package:buleprint_frame/common/i18n/locales/locale_zh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';

/// 翻译类 继承自 `Translations`，是 GetX 提供的多语言支持类。
class Translation extends Translations {
  // 当前系统语言 注释掉的代码示例，用于动态获取当前设备的语言环境。  如果需要在应用启动时自动匹配设备语言，可以取消注释并使用。
  // static Locale? get locale => Get.deviceLocale;

  // 默认语言 Locale(语言代码, 国家代码)
  static const fallbackLocale = Locale('en', 'US');

  // 支持语言列表
  static const supportedLocales = [
    Locale('en', 'US'),
    Locale('zh', 'CN'),
  ];

  // 代理
  static const localizationsDelegates = [
    GlobalMaterialLocalizations.delegate, // Material 组件的本地化支持
    GlobalWidgetsLocalizations.delegate, // Widgets 的本地化支持
    GlobalCupertinoLocalizations.delegate, // Cupertino 组件的本地化支持
  ];

  // 语言代码对应的翻译文本
  @override
  Map<String, Map<String, String>> get keys => {
        'en': localeEn,
        'zh': localeZh,
      };
}
