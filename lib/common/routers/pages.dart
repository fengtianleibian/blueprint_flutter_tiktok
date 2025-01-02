import 'package:buleprint_frame/common/routers/index.dart';
import 'package:buleprint_frame/common/routers/observers.dart';
import 'package:buleprint_frame/pages/system/login/view.dart';
import 'package:buleprint_frame/pages/system/main/view.dart';
import 'package:buleprint_frame/pages/system/splash/view.dart';
import 'package:get/get.dart';

/// 路由页面配置类
///
/// 该类管理应用中所有的路由页面配置，包括路由历史记录、路由观察者和页面路由列表。
class RoutePages {
  // 历史记录
  // 保存页面导航历史，用于记录用户访问的路由名称。
  // 可用于实现返回功能或路由分析。
  static List<String> history = [];

  // 观察者
  // 用于监听路由变化的观察者对象。
  // 可以在路由推入、弹出、替换、移除时记录或处理相关事件。
  static RouteObservers observer = RouteObservers();

  // 路由页面列表
  static List<GetPage> list = [
    GetPage(
      name: RouteNames.systemLogin, // 登录页路由名称
      page: () => const LoginPage(), // 对应页面的构建方法
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
