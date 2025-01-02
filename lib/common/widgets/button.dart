import 'package:ducafe_ui_core/ducafe_ui_core.dart';
import 'package:flutter/material.dart';

import '../index.dart';

/// 按钮样式
enum ButtonWidgetVariantEnum {
  primary, // 主要按钮，通常用于页面中的主操作，样式最突出（例如：实心按钮，强调主色）。
  secondary, // 次要按钮，用于辅助操作，样式较为次要（例如：边框按钮或较淡的颜色）。
  destructive, // 破坏性按钮，表示重要但负面的操作（例如：删除、移除），通常使用警告颜色（如红色）。
  outline, // 描边按钮，按钮内部透明，仅有边框，通常用于轻量级的操作。
  ghost, // 幽灵按钮，无边框，仅显示文本或图标，适合不引人注目的次要操作。
  link, // 链接样式按钮，外观类似超链接，通常用于次级操作。
  icon, // 图标按钮，仅包含一个图标而没有文字，通常用于工具栏或浮动操作按钮。
}

/// 按钮
class ButtonWidget extends StatefulWidget {
  /// 按钮样式
  final ButtonWidgetVariantEnum variant;

  /// 按钮尺寸
  final WidgetScale scale;

  /// tap 事件
  final Function()? onTap;

  /// 文字字符串
  final String? text;

  /// 文字颜色
  final Color? textColor;

  /// 子组件
  final Widget? child;

  /// 图标
  final Widget? icon;

  /// 圆角
  final double? borderRadius;

  /// 背景色
  final Color? backgroundColor;

  /// 边框色
  final Color? borderColor;

  /// 宽度
  final double? _width;

  /// 高度
  final double? height;

  /// 启用
  final bool enabled;

  /// 图标和文字的间距
  final double? iconSpace;

  /// 是否loading
  final bool? loading;

  /// 是否反转
  final bool? reverse;

  /// 主轴对齐方式
  final MainAxisAlignment? mainAxisAlignment;

  /// 主轴尺寸
  final MainAxisSize? mainAxisSize;

  /// 阴影
  final double? elevation;

  ///构造函数
  const ButtonWidget({
    super.key,
    this.variant = ButtonWidgetVariantEnum.primary, //按钮样式
    this.scale = WidgetScale.medium, //中等缩放
    this.onTap, //tap 事件
    this.text, //文字字符串
    this.borderRadius, //圆角
    this.child, //子组件
    this.backgroundColor, //背景色
    this.icon, //图标
    this.borderColor, //边框色
    double? width, //宽度
    this.height, //高度
    this.enabled = true, //启用
    this.iconSpace, //图标和文字的间距
    this.loading, //是否loading
    this.textColor, //文字颜色
    this.reverse, //是否反转
    this.mainAxisAlignment, //主轴对齐方式
    this.mainAxisSize, //主轴尺寸
    this.elevation, //阴影
  }) : _width = width; //

  /// raw
  const ButtonWidget.raw({
    super.key,
    required this.variant,
    required this.scale,
    this.onTap,
    this.text,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    double? width,
    this.height,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  }) : _width = width;

  /// 主要
  const ButtonWidget.primary(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.primary;

  /// 次要
  const ButtonWidget.secondary(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.secondary;

  // destructive 警告
  const ButtonWidget.destructive(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.destructive;

  // 描边按钮
  const ButtonWidget.outline(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.outline;

  // 幽灵按钮
  const ButtonWidget.ghost(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.ghost;

  // 链接样式按钮
  const ButtonWidget.link(
    this.text, {
    super.key,
    this.scale = WidgetScale.medium,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.icon,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.link;

  // 图标按钮
  const ButtonWidget.icon(
    this.icon, {
    super.key,
    this.scale = WidgetScale.medium,
    this.text,
    double? width,
    this.height,
    this.onTap,
    this.borderRadius,
    this.child,
    this.backgroundColor,
    this.borderColor,
    this.enabled = true,
    this.iconSpace,
    this.loading,
    this.textColor,
    this.reverse,
    this.mainAxisAlignment,
    this.mainAxisSize,
    this.elevation,
  })  : _width = width,
        variant = ButtonWidgetVariantEnum.icon;

  @override
  State<ButtonWidget> createState() => _ButtonWidgetState();
}

class _ButtonWidgetState extends State<ButtonWidget> {
  // 按下状态，用于处理按钮的按下效果。
  bool pressed = false;

  // 按尺寸缩放
  double _size(double val) {
    switch (widget.scale) {
      case WidgetScale.medium: // 中等尺寸
        return val;
      case WidgetScale.small: // 小尺寸
        return val * (1 - 0.3);
      case WidgetScale.large: // 大尺寸
        return val * (1 + 0.3);
    }
  }

  // 文本样式
  Color _textColor() {
    var colorScheme = context.colors.scheme; // 获取当前主题的颜色方案
    Color color = colorScheme.onPrimary;
    switch (widget.variant) {
      case ButtonWidgetVariantEnum.primary:
        color = widget.textColor ?? colorScheme.onPrimary;
        break;
      case ButtonWidgetVariantEnum.secondary:
        color = widget.textColor ?? colorScheme.onSecondary;
        break;
      case ButtonWidgetVariantEnum.destructive:
        color = widget.textColor ?? colorScheme.onError;
        break;
      case ButtonWidgetVariantEnum.outline:
        color = widget.textColor ?? colorScheme.primary;
        break;
      case ButtonWidgetVariantEnum.ghost:
      case ButtonWidgetVariantEnum.link:
      case ButtonWidgetVariantEnum.icon:
        color = widget.textColor ?? colorScheme.onPrimaryContainer;
        break;
      default:
    }

    return color;
  }

  // 背景色
  Color _backgroundColor() {
    var colorScheme = context.colors.scheme;
    Color color = colorScheme.primary;
    switch (widget.variant) {
      case ButtonWidgetVariantEnum.primary:
        color = colorScheme.primary;
        break;
      case ButtonWidgetVariantEnum.secondary:
        color = colorScheme.secondary;
        break;
      case ButtonWidgetVariantEnum.destructive:
        color = colorScheme.error;
        break;
      case ButtonWidgetVariantEnum.outline:
      case ButtonWidgetVariantEnum.ghost:
        color = widget.backgroundColor ?? Colors.transparent;
      case ButtonWidgetVariantEnum.link:
      case ButtonWidgetVariantEnum.icon:
        color = colorScheme.surface;
        break;
      default:
    }
    return color;
  }

  // 高亮色
  Color _highlightColor() {
    var colorScheme = context.colors.scheme;
    Color color = colorScheme.primary.withOpacity(0.1);
    switch (widget.variant) {
      case ButtonWidgetVariantEnum.primary:
        color = colorScheme.primaryContainer.withOpacity(0.1);
        break;
      case ButtonWidgetVariantEnum.secondary:
        color = colorScheme.secondaryContainer.withOpacity(0.1);
        break;
      case ButtonWidgetVariantEnum.destructive:
        color = colorScheme.errorContainer.withOpacity(0.1);
        break;
      case ButtonWidgetVariantEnum.outline:
      case ButtonWidgetVariantEnum.ghost:
      case ButtonWidgetVariantEnum.link:
      case ButtonWidgetVariantEnum.icon:
        color = colorScheme.surfaceContainer.withOpacity(0.1);
        break;
      default:
    }
    return color;
  }

  // 圆角
  BorderRadius? _borderRadius() {
    switch (widget.variant) {
      case ButtonWidgetVariantEnum.primary:
      case ButtonWidgetVariantEnum.secondary:
      case ButtonWidgetVariantEnum.destructive:
      case ButtonWidgetVariantEnum.ghost:
      case ButtonWidgetVariantEnum.link:
      case ButtonWidgetVariantEnum.icon:
        return null;
      case ButtonWidgetVariantEnum.outline:
        return BorderRadius.circular(
            widget.borderRadius ?? _size(AppRadius.button));
      default:
    }
    return null;
  }

  // 边框
  BoxBorder? _border() {
    switch (widget.variant) {
      case ButtonWidgetVariantEnum.primary:
      case ButtonWidgetVariantEnum.secondary:
      case ButtonWidgetVariantEnum.destructive:
      case ButtonWidgetVariantEnum.ghost:
      case ButtonWidgetVariantEnum.link:
      case ButtonWidgetVariantEnum.icon:
        return null;
      case ButtonWidgetVariantEnum.outline:
        return Border.all(
          color: widget.borderColor ?? context.colors.scheme.outline,
          width: AppBorder.button,
        );
      default:
    }
    return null;
  }

  // 根据按钮状态和类型判断是否启用涟漪效果
  bool _ripple(bool enbaled) {
    if (enbaled == false) {
      return false;
    }

    switch (widget.variant) {
      // 链接按钮类型禁用涟漪效果
      case ButtonWidgetVariantEnum.link:
        return false;
      // 其他按钮类型启用涟漪效果
      default:
        return true;
    }
  }

  // 主视图
  Widget _buildView() {
    // 子组件列表
    var ws = <Widget>[];

    // 如果有图标，添加图标到组件列表
    if (widget.icon != null) {
      ws.add(widget.icon!);
    }

    // 如果有子组件，添加子组件到组件列表
    if (widget.child != null) {
      ws.add(widget.child!);
    }

    // 如果有文本，添加文本到组件列表
    if (widget.text?.isNotEmpty == true) {
      ws.add(TextWidget.label(
        widget.text!,
        color: _textColor(), // 动态计算文本颜色
        scale: widget.scale, // 根据比例调整文本大小
        textAlign: TextAlign.center, // 文本居中
      ));
    }

    // 如果按钮处于加载状态，添加加载指示器
    if (widget.loading == true) {
      ws.add(CircularProgressIndicator(
        strokeWidth: 2, // 指示器的线条宽度
        valueColor: AlwaysStoppedAnimation(_textColor()), // 动态文本颜色
      ).tightSize(_size(16))); // 设置指示器尺寸
    }

    // 判断是否启用按钮
    var enabled = widget.enabled;
    if (widget.onTap == null) {
      enabled = false; // 如果没有点击事件，禁用按钮
    }

    // 如果反转图标和文本顺序，调整子组件顺序
    if (widget.reverse == true && ws.length > 1) {
      ws = ws.reversed.toList();
    }

    // 构建子组件的布局
    Widget child = ws.length == 1
        // 如果只有一个子组件，直接使用
        ? ws[0]
        // 如果有多个子组件，按行排列
        : ws.toRowSpace(
            space: widget.iconSpace ?? _size(AppSpace.iconText), // 图标和文本之间的间距
            mainAxisAlignment:
                widget.mainAxisAlignment ?? MainAxisAlignment.center, // 主轴对齐方式
            mainAxisSize: widget.mainAxisSize ?? MainAxisSize.min, // 主轴尺寸
          );

    // 如果设置了宽度或高度，应用约束
    if (widget._width != null || widget.height != null) {
      child = child.alignment(Alignment.center).constrained(
            width: widget._width, // 宽度
            height: widget.height, // 高度
          );
    }

    // 如果不是图标按钮，添加边距
    if (widget.variant != ButtonWidgetVariantEnum.icon) {
      child = child.padding(
        vertical: _size(AppPadding.button.vertical), // 垂直边距
        horizontal: _size(AppPadding.button.horizontal), // 水平边距
      );
    }

    // 添加涟漪效果
    child = child.ripple(
      enable: _ripple(enabled), // 判断是否启用涟漪
      highlightColor: _highlightColor(), // 高亮颜色
    );

    // 添加背景和边框
    if (widget.variant != ButtonWidgetVariantEnum.icon) {
      child = child.decorated(
        color: _backgroundColor(), // 背景颜色
        borderRadius: _borderRadius(), // 圆角
        border: _border(), // 边框
      );
    }

    // 添加裁剪圆角
    if (widget.borderRadius == null || widget.borderRadius! > 0) {
      child =
          child.clipRRect(all: _size(widget.borderRadius ?? AppRadius.button));
    }

    // 添加阴影
    if ((widget.elevation == null || widget.elevation! > 0) &&
        (widget.variant == ButtonWidgetVariantEnum.primary ||
            widget.variant == ButtonWidgetVariantEnum.secondary ||
            widget.variant == ButtonWidgetVariantEnum.destructive)) {
      child = child.elevation(
        pressed ? 0 : widget.elevation ?? AppElevation.button, // 根据状态设置阴影深度
        borderRadius: BorderRadius.circular(_size(AppRadius.button)), // 圆角
        shadowColor: context.colors.shadow, // 阴影颜色
      );
    }

    // 添加点击事件、透明度和缩放效果
    child = child
        .gestures(
          onTapChange: enabled
              ? (tapStatus) => setState(() => pressed = tapStatus) // 按下状态切换
              : null,
          onTap: enabled // 绑定点击事件
              ? () {
                  widget.onTap?.call();
                }
              : null,
        )
        .opacity(enabled ? 1.0 : 0.5) // 如果禁用，设置透明度
        .scale(all: pressed ? 0.99 : 1.0); // 按下时按钮缩放

    // 返回最终构建的按钮视图
    return child;
  }

  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
