import 'package:buleprint_frame/common/services/base_http.dart';
import 'package:buleprint_frame/common/services/config.dart';
import 'package:buleprint_frame/common/utils/storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Global {
  static Future<void> init() async {
    // 插件初始化
    WidgetsFlutterBinding.ensureInitialized();

    // 初始化服务
    Get.put<ConfigService>(ConfigService());
    Get.put<BaseHttpService>(BaseHttpService());

    // //工具类
    await Storage().init();
  }
}
