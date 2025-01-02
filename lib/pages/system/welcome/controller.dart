import 'package:buleprint_frame/common/index.dart';
import 'package:buleprint_frame/common/models/welcome_model.dart';
import 'package:buleprint_frame/common/services/config.dart';
import 'package:carousel_slider/carousel_controller.dart';
import 'package:get/get.dart';

/// 欢迎页控制器
class WelcomeController extends GetxController {
  WelcomeController({this.items});

  //轮播图数据
  List<WelcomeModel>? items;

  /// 指示器当前位置
  int currentIndex = 0;

  /// 是否显示 Start
  bool isShowStart = false;

  /// 指示器 slider 控制器
  CarouselSliderController carouselController = CarouselSliderController();

  @override
  void onReady() {
    super.onReady();

    //初始化
    _initData();

    // 设置已打开
    ConfigService().setAlreadyOpen();

    update(["welcomeSlider", 'bar']);
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

  /// 当前位置发生改变
  void onPageChanged(int index) {
    currentIndex = index;
    //在第三张图的时候显示 start
    isShowStart = currentIndex == 2;
    update(['welcomeSlider', 'bar']);
  }

  /// 去首页
  void onToMain() {
    /// 跳转首页, 并关闭所有页面
    Get.offAllNamed(RouteNames.systemMain);
  }

  /// 下一个
  void onNext() {
    carouselController.nextPage();
  }

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
