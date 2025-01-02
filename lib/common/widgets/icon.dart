// 导入必要的包
import 'package:ducafe_ui_core/ducafe_ui_core.dart'; // UI 核心库
import 'package:flutter/material.dart'; // Flutter 核心包
import '../index.dart'; // 项目中的索引文件

/// 图标类型枚举，用于区分图标的加载方式
enum IconWidgetTypeEnum {
  /// 普通图标 (Material Icons)
  icon,

  /// SVG 图标
  svg,

  /// 图片图标 (Asset 图片)
  img,
}

/// 图标组件，用于显示不同类型的图标
class IconWidget extends StatelessWidget {
  /// 构造函数，支持多种图标类型和样式配置
  const IconWidget({
    super.key, // Flutter 的全局唯一标识符
    required this.type, // 图标类型
    this.iconData, // 图标数据
    this.path, // 图标路径 (Asset 或 URL)
    this.size, // 图标尺寸
    double? width, // 图标宽度
    double? height, // 图标高度
    this.color, // 图标颜色
    this.isDot, // 是否显示小圆点
    this.badgeString, // Badge 上的文字
    this.fit, // 图片适配方式
    this.text, // 图标文字
    this.isVertical, // 是否垂直布局
    this.onTap, // 点击事件
    this.isExpanded, // 是否扩展文字
  })  : _height = height,
        _width = width;

  /// 图标类型 (icon, svg, img)
  final IconWidgetTypeEnum type;

  /// 图标数据 (仅用于普通图标)
  final IconData? iconData;

  /// 图标路径，可以是 Asset 路径或 URL
  final String? path;

  /// 图标尺寸
  final double? size;

  /// 图标宽度
  final double? _width;

  /// 图标高度
  final double? _height;

  /// 图标颜色
  final Color? color;

  /// 是否显示小圆点
  final bool? isDot;

  /// Badge 上的文字内容
  final String? badgeString;

  /// 图片适配方式
  final BoxFit? fit;

  /// 图标文字，用于描述图标的附加信息
  final String? text;

  /// 是否垂直排列图标和文字
  final bool? isVertical;

  /// 是否扩展文字
  final bool? isExpanded;

  /// 点击事件回调
  final GestureTapCallback? onTap;

  /// 快捷构造函数，用于普通图标
  const IconWidget.icon(
    this.iconData, {
    super.key,
    this.path,
    this.size,
    this.isExpanded = false, // 默认不扩展
    double? width,
    double? height,
    this.color,
    this.isDot,
    this.badgeString,
    this.fit,
    this.text,
    this.isVertical,
    this.onTap,
  })  : _height = height,
        _width = width,
        type = IconWidgetTypeEnum.icon;

  /// 快捷构造函数，用于图片图标
  const IconWidget.img(
    this.path, {
    super.key,
    this.iconData,
    this.size,
    double? width,
    double? height,
    this.color,
    this.isDot,
    this.badgeString,
    this.fit,
    this.text,
    this.isVertical,
    this.onTap,
    this.isExpanded,
  })  : _height = height,
        _width = width,
        type = IconWidgetTypeEnum.img;

  /// 快捷构造函数，用于 SVG 图标
  const IconWidget.svg(
    this.path, {
    super.key,
    this.iconData,
    this.size,
    double? width,
    double? height,
    this.color,
    this.isDot,
    this.badgeString,
    this.fit,
    this.text,
    this.isVertical,
    this.onTap,
    this.isExpanded,
  })  : _height = height,
        _width = width,
        type = IconWidgetTypeEnum.svg;

  /// 根据图标类型生成具体的图标组件
  Widget _buildIcon(BuildContext context) {
    Widget icon = const SizedBox.shrink(); // 默认空组件

    // 根据图标类型选择不同的构建方式
    switch (type) {
      case IconWidgetTypeEnum.icon: // 普通图标
        icon = Icon(
          iconData, // 图标数据
          size: size ?? AppSize.icon, // 默认图标尺寸
          color: color ?? context.colors.scheme.onSurfaceVariant, // 默认颜色
        );
        break;

      case IconWidgetTypeEnum.svg: // SVG 图标
        icon = ImageWidget.svg(
          path!, // SVG 路径
          width: _width ?? size, // 宽度
          height: _height ?? size, // 高度
          color: color, // 颜色
          elevation: 0, // 无阴影
          fit: fit, // 图片适配方式
        );
        break;

      case IconWidgetTypeEnum.img: // 图片图标
        icon = Image.asset(
          path!, // 图片路径
          width: _width ?? size ?? AppSize.icon, // 宽度
          height: _height ?? size ?? AppSize.icon, // 高度
          color: color ?? context.colors.scheme.onSurfaceVariant, // 默认颜色
          fit: fit, // 图片适配方式
        );
        break;
    }

    // 如果需要显示 Badge (小圆点或文字)
    if (isDot == true) {
      icon = Badge(
        backgroundColor: context.colors.scheme.primary, // Badge 背景颜色
        alignment: Alignment.bottomRight, // 小圆点位置
        child: icon, // 图标
      );
    } else if (badgeString != null) {
      icon = Badge(
        backgroundColor: context.colors.scheme.primary, // Badge 背景颜色
        label: Text(badgeString!), // Badge 文字
        alignment: Alignment.topRight, // 文字位置
        child: icon, // 图标
      );
    }

    return icon;
  }

  /// 构建图标视图
  Widget _buildView(BuildContext context) {
    List<Widget> ws = []; // 存储图标和文字的列表

    // 添加图标
    ws.add(_buildIcon(context));

    // 添加文字
    if (text != null) {
      Widget textWidget = TextWidget.muted(text!); // 使用 muted 样式显示文字
      if (isExpanded == true) {
        textWidget = textWidget.expanded(); // 如果扩展，则扩展文字
      }
      ws.add(textWidget);
    }

    // 根据是否垂直布局来决定排列方式
    Widget child = ws.length == 1
        ? ws[0]
        : isVertical == true
            ? ws.toColumnSpace(
                space: AppSpace.iconText, // 垂直间距
                mainAxisSize: MainAxisSize.min, // 最小尺寸
              )
            : ws.toRowSpace(
                space: AppSpace.iconText, // 水平间距
                mainAxisSize: MainAxisSize.min, // 最小尺寸
                crossAxisAlignment: isExpanded == true
                    ? CrossAxisAlignment.start
                    : CrossAxisAlignment.center, // 对齐方式
              );

    // 如果有点击事件，添加 InkWell
    child = onTap == null
        ? child
        : InkWell(
            onTap: onTap, // 点击事件
            child: child, // 子组件
          );

    return child;
  }

  /// 构建组件
  @override
  Widget build(BuildContext context) {
    return _buildView(context); // 返回图标视图
  }
}
