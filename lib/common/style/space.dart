import 'package:flutter/material.dart';

/// 应用中的间距定义统一管理类
///
/// 定义了常见组件和布局的间距，使用静态属性提供值。
/// 通过集中管理，可以在项目中保持一致的间距风格，方便维护和扩展。
class AppSpace {
  /// 应用栏的间距
  ///
  /// 为应用栏（`AppBar`）提供统一的上下间距，默认为 `10`。
  static double get appbar => 10;

  /// 页面内容的默认间距
  ///
  /// 为页面整体布局提供统一的上下左右间距，默认为 `10`。
  static double get page => 10;

  /// 卡片组件的间距
  ///
  /// 为卡片（`Card`）提供统一的外部间距，默认为 `10`。
  static double get card => 10;

  /// 图标和文字之间的间距
  ///
  /// 默认为 `4`，适用于图标与文字的紧凑布局。
  static double get iconText => 4;

  /// 列布局（`Column`）子元素之间的间距
  ///
  /// 默认为 `10`，适用于垂直布局的间距设置。
  static double get column => 10;

  /// 按钮的间距
  ///
  /// 为按钮组件提供统一的外部间距，默认为 `5`。
  static double get button => 5;

  /// 按钮的高度
  ///
  /// 为按钮组件提供统一的高度值，默认为 `50`。
  static double get buttonHeight => 50;

  /// 输入框的内边距
  ///
  /// 上下间距为 `10`，左右间距为 `10`，适用于 `TextField` 或 `TextFormField`。
  static EdgeInsetsGeometry get edgeInput =>
      const EdgeInsets.symmetric(vertical: 10, horizontal: 10);

  /// 列表视图的间距
  ///
  /// 默认为 `5`，适用于列表视图的子项间隔。
  static double get listView => 5;

  /// 列表行的间距
  ///
  /// 上下间距为 `10`，适用于行间隔。
  static double get listRow => 10;

  /// 列表项的间距
  ///
  /// 默认为 `8`，适用于列表项的内容间隔。
  static double get listItem => 8;

  /// 段落的间距
  ///
  /// 默认为 `24`，适用于段落之间的较大间距。
  static double get paragraph => 24;

  /// 标题与内容之间的间距
  ///
  /// 默认为 `10`，适用于标题和内容之间的分隔。
  static double get titleContent => 10;

  /// 不同大小的图标和文字间距
  ///
  /// 提供三种不同的间距值，分别为小（`5`）、中（`10`）、大（`15`）。
  static double get iconTextSmail => 5;
  static double get iconTextMedium => 10;
  static double get iconTextLarge => 15;
}
