import 'package:buleprint_frame/common/models/welcome_model.dart';
import 'package:buleprint_frame/common/widgets/image.dart';
import 'package:buleprint_frame/common/widgets/text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

///欢迎页轮播图组件
class WelcomeSliderWidget extends StatelessWidget {
  const WelcomeSliderWidget(
    this.items, {
    super.key,
    required this.onPageChanged,
    this.carouselController,
  });

  //轮播图数据
  final List<WelcomeModel>? items;

  /// 页数发生变化
  final Function(int) onPageChanged;

  /// 轮播图控制器
  final CarouselSliderController? carouselController;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      carouselController: carouselController,
      options: CarouselOptions(
        height: 400.w, //组件高度
        viewportFraction: 1, // 充满
        enlargeCenterPage: false, // 动画 封面效果
        enableInfiniteScroll: false, // 无限循环
        autoPlay: false, // 自动播放
        onPageChanged: (index, reason) => onPageChanged(index),
      ),
      items: <Widget>[
        for (var item in items!) sliderItem(item),
      ].toList(),
    );
  }

  Widget sliderItem(WelcomeModel item) {
    return Builder(
      builder: (BuildContext context) {
        return <Widget>[
          // 图
          if (item.image != null)
            ImageWidget.img(
              item.image!,
              //fill 拉伸子组件以完全填满父容器
              //contain 子组件按比例缩放以适应父容器，但不会超出其范围。
              //cover 子组件按比例缩放以完全覆盖父容器。
              //fitWidth 子组件按比例缩放以适应父容器的宽度
              //fitHeight 子组件按比例缩放以适应父容器的高度。
              //none 不缩放子组件，保持其原始尺寸。
              //scaleDown 与 BoxFit.contain 类似，但仅在子组件尺寸大于父容器时才缩放。
              fit: BoxFit.cover,
            ),

          // 标题
          if (item.title != null)
            TextWidget.h1(
              item.title ?? "",
              maxLines: 2, //最大行数
              softWrap: true, // 是否自动换行
              //文本对齐方式
              textAlign: TextAlign.center,
            ),

          // 描述
          if (item.desc != null)
            TextWidget.label(
              item.desc ?? "",
              maxLines: 3,
              softWrap: true,
              textAlign: TextAlign.center,
            )
        ]
            .toColumn(mainAxisAlignment: MainAxisAlignment.spaceAround)
            .width(MediaQuery.of(context).size.width);
      },
    );
  }
}
