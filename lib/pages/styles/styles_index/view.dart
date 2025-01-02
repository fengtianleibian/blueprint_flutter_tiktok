import 'package:buleprint_frame/common/routers/index.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'index.dart';

class StylesIndexPage extends GetView<StylesIndexController> {
  const StylesIndexPage({super.key});

  // 主视图
  Widget _buildView() {
    return Column(
      children: [
        // form 表单
        // Input 输入框
        ListTile(
          onTap: () => Get.toNamed(RouteNames.stylesInput),
          title: const Text("Input 输入框"),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<StylesIndexController>(
      init: StylesIndexController(),
      id: "styles_index",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: const Text("styles_index")),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
