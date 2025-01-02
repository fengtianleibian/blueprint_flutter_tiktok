import 'package:buleprint_frame/common/services/base_http.dart';
import 'package:buleprint_frame/common/services/config.dart';
import 'package:buleprint_frame/common/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

///初始化 Flutter 应用程序的全局配置、服务和工具类
class Global {
  static Future<void> init() async {
    // 插件初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 初始化配置
    Get.put<ConfigService>(ConfigService());

    ///HTTP 请求的基础服务
    Get.put<BaseHttpService>(BaseHttpService());

    // //工具类
    await Storage().init();
  }
}
