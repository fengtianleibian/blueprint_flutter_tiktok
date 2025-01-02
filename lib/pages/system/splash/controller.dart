import 'package:buleprint_frame/common/routers/names.dart';
import 'package:buleprint_frame/common/services/config.dart';
import 'package:get/get.dart';

///引导页
class SplashController extends GetxController {
  SplashController();

  @override
  void onReady() {
    super.onReady();
    _initData();
    _jumpToPage();
  }

  _initData() {
    update(["splash"]);
  }

  _jumpToPage() {
    // 欢迎页 1秒钟以后跳转
    Future.delayed(const Duration(seconds: 1), () {
      // 是否已打开
      if (ConfigService.to.isAlreadyOpen) {
        // 跳转首页
        Get.offAllNamed(RouteNames.systemMain);
      } else {
        // 跳转欢迎页
        Get.offAllNamed(RouteNames.systemWelcome);
      }
    });
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
