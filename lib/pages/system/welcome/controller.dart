import 'package:buleprint_frame/common/index.dart';
import 'package:buleprint_frame/common/models/welcome_model.dart';
import 'package:get/get.dart';

/// 欢迎页控制器
class WelcomeController extends GetxController {
  WelcomeController({this.items});

  //轮播图数据
  List<WelcomeModel>? items;

  @override
  void onReady() {
    super.onReady();

    //初始化
    _initData();
  }

  //初始化 三张 轮播图
  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];

    update(["welcomeSlider"]);
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
