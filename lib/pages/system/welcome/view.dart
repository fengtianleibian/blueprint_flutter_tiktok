import 'package:buleprint_frame/common/components/welcome_slider.dart';
import 'package:buleprint_frame/common/style/space.dart';
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
              onPageChanged: (index) {},
            ),
    );
  }

  /// 主视图
  Widget _buildView() {
    return <Widget>[
      // slider切换
      _buildSlider(),
      // 控制栏
    ]
        .toColumn(
          mainAxisAlignment: MainAxisAlignment.spaceAround, // 垂直均匀排列
        )
        .paddingAll(AppSpace.page); // 添加统一的页面边距
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
