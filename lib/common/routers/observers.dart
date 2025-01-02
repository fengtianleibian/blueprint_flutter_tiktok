// ignore_for_file: unnecessary_overrides

import 'package:flutter/material.dart';

import 'index.dart';

/// 记录路由的变化
/// 该类继承自 RouteObserver，用于监听路由变化事件（如页面推入、弹出、替换、移除等），
/// 并维护一个全局的路由历史记录列表 `RoutePages.history`。
class RouteObservers<R extends Route<dynamic>> extends RouteObserver<R> {
  /// 当一个新的页面被推入导航堆栈时触发（Navigator.push）。
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    // 获取当前路由的名称
    var name = route.settings.name ?? '';
    // 如果名称非空，将其添加到路由历史记录中
    if (name.isNotEmpty) RoutePages.history.add(name);
    // 输出日志，便于调试
    debugPrint('didPush');
    debugPrint(RoutePages.history.toString());
  }

  /// 当一个页面被弹出导航堆栈时触发（Navigator.pop）。
  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    // 从路由历史记录中移除该页面的路由名称
    RoutePages.history.remove(route.settings.name);
    // 输出日志，便于调试
    debugPrint('didPop');
    debugPrint(RoutePages.history.toString());
  }

  /// 当一个页面被替换时触发（Navigator.replace）。
  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    if (newRoute != null) {
      // 查找被替换的旧路由在历史记录中的位置
      var index = RoutePages.history.indexWhere((element) {
        return element == oldRoute?.settings.name;
      });
      // 获取新路由的名称
      var name = newRoute.settings.name ?? '';
      // 如果名称非空，更新或添加到路由历史记录中
      if (name.isNotEmpty) {
        if (index > 0) {
          RoutePages.history[index] = name;
        } else {
          RoutePages.history.add(name);
        }
      }
    }
    // 输出日志，便于调试
    debugPrint('didReplace');
    debugPrint(RoutePages.history.toString());
  }

  /// 当一个页面被移除时触发（Navigator.removeRoute）。
  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    // 从路由历史记录中移除该页面的路由名称
    RoutePages.history.remove(route.settings.name);
    // 输出日志，便于调试
    debugPrint('didRemove');
    debugPrint(RoutePages.history.toString());
  }

  /// 当用户手势导航（如返回手势）开始时触发。
  @override
  void didStartUserGesture(
      Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didStartUserGesture(route, previousRoute);
  }

  /// 当用户手势导航结束时触发。
  @override
  void didStopUserGesture() {
    super.didStopUserGesture();
  }
}
