// 导入必要的包
import 'package:ducafe_ui_core/ducafe_ui_core.dart'; // UI 核心库
import 'package:flutter/material.dart'; // Flutter 的核心包

import '../index.dart'; // 项目中的索引文件

// 排版类型，用于定义文本组件的样式类型
enum TextWidgetTypeEnum {
  /// 一级标题，用于页面主标题
  h1,

  /// 二级标题，用于重要子标题
  h2,

  /// 三级标题，用于次级内容标题
  h3,

  /// 四级标题，用于最小层级标题
  h4,

  /// 正文，用于普通段落文本
  body,

  /// 标签，用于短文本场景
  label,

  /// 灰色提示文本，用于次要信息
  muted,
}

// 自定义的文本组件，用于显示不同样式的文本
class TextWidget extends StatelessWidget {
  // 构造函数，支持多种参数配置
  const TextWidget({
    super.key, // Flutter 的全局唯一标识符
    required this.text, // 必需的文本内容
    this.type, // 排版类型
    this.size, // 自定义字体大小
    this.scale, // 缩放级别：large, medium, small
    this.textStyle, // 自定义文本样式
    this.color, // 自定义字体颜色
    this.weight, // 字体粗细
    this.maxLines, // 最大行数
    this.softWrap, // 是否自动换行
    this.overflow, // 文本溢出的处理方式
    this.textAlign, // 文本对齐方式
    this.fontStyle, // 字体样式（斜体等）
  });

  /// 文本内容
  final String text;

  /// 排版类型
  final TextWidgetTypeEnum? type;

  /// 缩放级别（large, medium, small）
  final WidgetScale? scale;

  /// 自定义文本样式
  final TextStyle? textStyle;

  /// 字体样式（如斜体）
  final FontStyle? fontStyle;

  /// 字体颜色
  final Color? color;

  /// 字体大小
  final double? size;

  /// 字体粗细
  final FontWeight? weight;

  /// 最大行数
  final int? maxLines;

  /// 是否自动换行
  final bool? softWrap;

  /// 文本溢出时的处理方式
  final TextOverflow? overflow;

  /// 文本对齐方式
  final TextAlign? textAlign;

  // 构造函数快捷方式，适用于特定排版类型
  /// 一级标题构造函数
  const TextWidget.h1(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w800, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.h1;

  /// 二级标题构造函数
  const TextWidget.h2(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w600, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.h2;

  /// 三级标题构造函数
  const TextWidget.h3(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w600, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.h3;

  /// 四级标题构造函数
  const TextWidget.h4(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w600, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.h4;

  /// 正文构造函数
  const TextWidget.body(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w400, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.body;

  /// 标签构造函数
  const TextWidget.label(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w400, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.label;

  /// 灰色提示文本构造函数
  const TextWidget.muted(
    this.text, {
    super.key,
    this.scale,
    this.size,
    this.color,
    this.weight = FontWeight.w400, // 默认字体粗细
    this.maxLines,
    this.softWrap,
    this.overflow,
    this.textAlign,
    this.textStyle,
    this.fontStyle,
  }) : type = TextWidgetTypeEnum.muted;

  /// 根据类型和缩放计算字体大小
  double _fontSize() {
    double fontSize = size ?? 0;

    // 根据排版类型设置默认字体大小
    if (fontSize == 0) {
      switch (type) {
        case TextWidgetTypeEnum.h1:
          fontSize = 36;
          break;
        case TextWidgetTypeEnum.h2:
          fontSize = 30;
          break;
        case TextWidgetTypeEnum.h3:
          fontSize = 24;
          break;
        case TextWidgetTypeEnum.h4:
          fontSize = 20;
          break;
        case TextWidgetTypeEnum.body:
          fontSize = 16;
          break;
        case TextWidgetTypeEnum.label:
          fontSize = 14;
          break;
        case TextWidgetTypeEnum.muted:
          fontSize = 12;
          break;
        default:
          fontSize = 14; // 默认字体大小
          break;
      }
    }

    // 根据缩放级别调整字体大小
    switch (scale) {
      case WidgetScale.large:
        return fontSize * 1.3; // 放大字体
      case WidgetScale.medium:
        return fontSize; // 默认大小
      case WidgetScale.small:
        return fontSize * 0.8; // 缩小字体
      default:
        return fontSize; // 默认缩放大小
    }
  }

  /// 根据类型或自定义颜色返回字体颜色
  Color _color(BuildContext context) {
    if (color != null) {
      return color!; // 如果指定了颜色，直接返回
    }

    // 根据类型返回默认颜色
    switch (type) {
      case TextWidgetTypeEnum.h1:
      case TextWidgetTypeEnum.h2:
      case TextWidgetTypeEnum.h3:
      case TextWidgetTypeEnum.h4:
      case TextWidgetTypeEnum.body:
      case TextWidgetTypeEnum.label:
        return context.colors.scheme.onSurface; // 默认主表面颜色
      case TextWidgetTypeEnum.muted:
        return context.colors.scheme.onSurface.withOpacity(0.8); // 较淡的主表面颜色
      default:
        return context.colors.scheme.onSurface; // 默认颜色
    }
  }

  /// 构建组件
  @override
  Widget build(BuildContext context) {
    return Text(
      text, // 文本内容
      style: TextStyle(
        color: _color(context), // 设置字体颜色
        fontSize: _fontSize(), // 设置字体大小
        fontWeight: weight, // 设置字体粗细
        fontStyle: fontStyle, // 设置字体样式
      ),
      maxLines: maxLines, // 最大行数
      softWrap: softWrap, // 是否自动换行
      overflow: overflow, // 文本溢出时的处理方式
      textAlign: textAlign, // 文本对齐方式
    );
  }
}
