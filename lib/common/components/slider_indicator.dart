import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

/// slider indicator 轮播图 指示器
class SliderIndicatorWidget extends StatelessWidget {
  /// 指示器的总数
  final int length;

  /// 当前选中的指示器索引
  final int currentIndex;

  /// 指示器颜色
  final Color? color;

  /// 是否使用圆形指示器
  final bool isCircle;

  /// 指示器的对齐方式
  final MainAxisAlignment alignment;

  /// 构造函数
  const SliderIndicatorWidget({
    super.key,
    required this.length, // 必须提供指示器总数
    required this.currentIndex, // 必须提供当前选中的索引
    this.color, // 可选颜色
    this.isCircle = false, // 默认为非圆形
    this.alignment = MainAxisAlignment.center, // 默认居中对齐
  });

  @override
  Widget build(BuildContext context) {
    Color boxColor = color ?? context.colors.scheme.primary;

    return Row(
      mainAxisAlignment: alignment, // 指示器的对齐方式

      // 采用 list.generate 方式生成 item 项
      children: List.generate(length, (index) {
        return Container(
          // 指示器之间的水平间距
          margin: const EdgeInsets.symmetric(horizontal: 3),
          // 指示器的宽度
          width: !isCircle // 如果不是圆形
              ? currentIndex == index // 当前选中状态
                  ? 15.0 // 当前选中的指示器宽度为 15
                  : 8 // 非选中状态的宽度为 8
              : 6, // 如果是圆形，宽度固定为 6
          // 指示器的高度  如果不是圆形 高度固定为 4 如果是圆形，宽度和高度相等为6
          height: !isCircle ? 4 : 6,

          // 指示器的装饰样式
          decoration: BoxDecoration(
            // 圆角 4
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            // 指示器颜色
            // 当前选中的指示器使用 boxColor，其他指示器使用透明度 0.3 的颜色
            color: currentIndex == index ? boxColor : boxColor.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
