import 'package:buleprint_frame/common/routers/index.dart';
import 'package:buleprint_frame/common/routers/observers.dart';
import 'package:buleprint_frame/pages/system/login/view.dart';
import 'package:buleprint_frame/pages/system/main/view.dart';
import 'package:buleprint_frame/pages/system/splash/view.dart';
import 'package:get/get.dart';

class RoutePages {
// 历史记录
  static List<String> history = [];

  // 观察者
  static RouteObservers observer = RouteObservers();

  // 列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.systemLogin,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: RouteNames.systemMain,
      page: () => const MainPage(),
    ),
    GetPage(
      name: RouteNames.systemSplash,
      page: () => const SplashPage(),
    ),
  ];
}
