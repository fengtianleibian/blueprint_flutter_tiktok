// 导入必要的包
import 'package:buleprint_frame/common/style/radius.dart';
import 'package:buleprint_frame/common/style/size.dart';
import 'package:cached_network_image/cached_network_image.dart'; // 用于加载网络图片的缓存库
import 'package:ducafe_ui_core/ducafe_ui_core.dart'; // UI 核心库
import 'package:flutter/material.dart'; // Flutter 的核心包
import 'package:flutter_svg/svg.dart'; // 用于加载 SVG 图片的库

/// 图片类型枚举，用于区分图片的加载方式
enum ImageWidgetType {
  /// 普通图片 (支持 Asset 和网络图片)
  img,

  /// SVG 图片 (支持 Asset 和网络图片)
  svg,

  /// SVG 原始字符串 (用于直接加载 SVG 的字符串内容)
  svgRaw,
}

/// 图片组件
class ImageWidget extends StatefulWidget {
  /// 构造函数，支持多种图片类型和样式配置
  const ImageWidget({
    super.key, // Flutter 的全局唯一标识符
    required this.path, // 必需的图片路径
    required this.type, // 必需的图片类型
    this.radius, // 圆角
    this.width, // 宽度
    this.height, // 高度
    this.fit, // 自适应方式
    this.placeholder, // 占位图
    this.errorWidget, // 错误图
    this.elevation, // 阴影
    this.color, // 图片颜色
  });

  /// 图片路径，可以是本地路径或网络 URL
  final String path;

  /// 图片类型，决定图片加载方式
  final ImageWidgetType type;

  /// 圆角值，用于设置图片的圆角半径
  final double? radius;

  /// 图片宽度
  final double? width;

  /// 图片高度
  final double? height;

  /// 图片适配模式，如 BoxFit.cover
  final BoxFit? fit;

  /// 占位图，当图片加载时显示
  final Widget? placeholder;

  /// 错误图，当图片加载失败时显示
  final Widget? errorWidget;

  /// 阴影值，用于设置图片的阴影效果
  final double? elevation;

  /// 图片颜色，用于颜色叠加或 SVG 着色
  final Color? color;

  /// 构造函数快捷方式，用于加载普通图片
  const ImageWidget.img(
    this.path, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  }) : type = ImageWidgetType.img;

  /// 构造函数快捷方式，用于加载 SVG 图片
  const ImageWidget.svg(
    this.path, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  }) : type = ImageWidgetType.svg;

  /// 构造函数快捷方式，用于加载 SVG 字符串
  const ImageWidget.svgRaw(
    String raw, {
    super.key,
    this.radius,
    this.width,
    this.height,
    this.fit,
    this.placeholder,
    this.errorWidget,
    this.elevation,
    this.color,
  })  : type = ImageWidgetType.svgRaw,
        path = raw; // 将 SVG 字符串作为路径

  /// 创建组件状态
  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

/// 图片组件的状态类
class _ImageWidgetState extends State<ImageWidget> {
  /// 构建具体的图片组件
  Widget _buildView() {
    // 默认的占位图
    Widget ws = widget.placeholder ?? const SizedBox();

    // 判断是否为网络图片
    bool isNetwork = widget.path.startsWith('http') ||
        widget.path.startsWith('https') ||
        widget.path.startsWith('//');

    // 如果是普通图片且路径不是网络路径
    if (widget.type == ImageWidgetType.img && !isNetwork) {
      ws = Image.asset(
        widget.path, // 加载本地图片路径
        fit: widget.fit, // 图片适配方式
        color: widget.color, // 图片颜色叠加
      );
    }

    // 如果是普通图片且路径为网络路径
    else if (widget.type == ImageWidgetType.img && isNetwork) {
      ws = CachedNetworkImage(
        imageUrl: widget.path, // 网络图片 URL
        fit: widget.fit, // 图片适配方式
        cacheKey: widget.path.hashCode.toString(), // 缓存键
        color: widget.color, // 图片颜色叠加
        placeholder: (context, url) =>
            widget.placeholder ??
            const CircularProgressIndicator()
                .tightSize(AppSize.indicator)
                .center(), // 占位图
        errorWidget: (context, url, error) =>
            widget.errorWidget ?? const Icon(Icons.error), // 错误图
      );
    }

    // 如果是 SVG 图片且路径不是网络路径
    else if (widget.type == ImageWidgetType.svg && !isNetwork) {
      ws = SvgPicture.asset(
        widget.path, // 加载本地 SVG 图片路径
        fit: widget.fit ?? BoxFit.contain, // 图片适配方式
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
            : null, // 颜色滤镜
        placeholderBuilder: (BuildContext context) =>
            widget.placeholder ??
            Center(
              child: const CircularProgressIndicator()
                  .tightSize(AppSize.indicator)
                  .center(), // 占位图
            ),
      );
    }

    // 如果是 SVG 图片且路径为网络路径
    else if (widget.type == ImageWidgetType.svg && isNetwork) {
      ws = SvgPicture.network(
        widget.path, // 网络 SVG 图片 URL
        fit: widget.fit ?? BoxFit.contain, // 图片适配方式
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
            : null, // 颜色滤镜
        placeholderBuilder: (BuildContext context) =>
            widget.placeholder ??
            Center(
              child: const CircularProgressIndicator()
                  .tightSize(AppSize.indicator)
                  .center(), // 占位图
            ),
      );
    }

    // 如果是 SVG 原始字符串
    else if (widget.type == ImageWidgetType.svgRaw) {
      ws = SvgPicture.string(
        widget.path, // SVG 字符串内容
        fit: widget.fit ?? BoxFit.contain, // 图片适配方式
        colorFilter: widget.color != null
            ? ColorFilter.mode(widget.color!, BlendMode.srcIn)
            : null, // 颜色滤镜
        placeholderBuilder: (BuildContext context) =>
            widget.placeholder ??
            Center(
              child: const CircularProgressIndicator()
                  .tightSize(AppSize.indicator)
                  .center(), // 占位图
            ),
      );
    }

    // 添加尺寸约束
    if (widget.width != null || widget.height != null) {
      ws = ws.tight(
        width: widget.width, // 约束宽度
        height: widget.height, // 约束高度
      );
    }

    // 添加圆角
    ws = ws.clipRRect(all: widget.radius ?? AppRadius.img);

    return ws;
  }

  /// 构建组件
  @override
  Widget build(BuildContext context) {
    return _buildView();
  }
}
