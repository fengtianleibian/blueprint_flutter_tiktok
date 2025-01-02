import 'package:buleprint_frame/common/components/slider_indicator.dart';
import 'package:buleprint_frame/common/components/welcome_slider.dart';
import 'package:buleprint_frame/common/i18n/locale_keys.dart';
import 'package:buleprint_frame/common/style/space.dart';
import 'package:buleprint_frame/common/widgets/button.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class WelcomePage extends GetView<WelcomeController> {
  const WelcomePage({super.key});

  /// 轮播图
  Widget _buildSlider() {
    return GetBuilder<WelcomeController>(
      id: "welcomeSlider", // 标识符，用于局部刷新
      init: controller, // 初始化控制器
      builder: (controller) => controller.items == null
          ? const SizedBox() // 如果 items 为空，显示空白占位组件
          : WelcomeSliderWidget(
              controller.items!,
              onPageChanged: controller.onPageChanged, //回调刷新 轮播图和指示器的状态
              carouselController: controller.carouselController, //使用控制器跳转到指定页面
            ),
    );
  }

  /// 主视图
  Widget _buildView() {
    return Container(
      child: <Widget>[
        const SizedBox(height: 30),

        // slider切换
        _buildSlider(),

        const SizedBox(height: 80),
        // 控制栏
        _buildBar(),
      ]
          .toColumn(
            mainAxisAlignment: MainAxisAlignment.center, // 垂直均匀排列
          )
          .paddingAll(AppSpace.page),
    ); // 添加统一的页面边距
  }

  /// 控制栏
  Widget _buildBar() {
    return GetBuilder<WelcomeController>(
      id: "bar", // 控制栏的唯一标识符，用于局部刷新
      init: controller, // 初始化控制器
      builder: (controller) {
        return controller.isShowStart //是否显示 start
            ?
            // 开始
            ButtonWidget.primary(LocaleKeys.welcomeStart.tr, //按钮显示的文字
                    onTap: controller.onToMain, //跳转页面
                    mainAxisAlignment: MainAxisAlignment.start)
                .tight(
                width: 200,
              )
            : <Widget>[
                // 跳过
                Expanded(
                  flex: 3, // 占用总宽度的 2 份
                  child: ButtonWidget.ghost(
                    LocaleKeys.welcomeSkip.tr,
                    onTap: controller.onToMain,
                  ),
                ),

                // 指示标
                Expanded(
                  flex: 6, // 占用总宽度的 2 份
                  child: SliderIndicatorWidget(
                    length: 3,
                    currentIndex: controller.currentIndex,
                  ),
                ),

                // 下一页
                Expanded(
                  flex: 3, // 占用总宽度的 2 份
                  child: ButtonWidget.ghost(
                    LocaleKeys.welcomeNext.tr,
                    onTap: controller.onNext,
                  ),
                ),
              ].toRow(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
              );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeController>(
      init: WelcomeController(), // 初始化控制器
      id: "welcome", // 标识符，用于局部刷新
      builder: (_) {
        return Scaffold(
          // appBar: AppBar(title: const Text("welcome")),
          body: SafeArea(
            child: _buildView(), // 主视图
          ),
        );
      },
    );
  }
}
