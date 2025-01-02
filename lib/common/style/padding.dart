import 'package:flutter/material.dart';

/// 应用中的统一间距管理类
///
/// 定义了不同组件的内边距（`padding`），使用静态方法获取值，
/// 便于统一管理和修改，提升设计的一致性。
class AppPadding {
  /// 按钮的内边距
  ///
  /// 为按钮组件提供统一的内边距，垂直方向为 `4`，水平方向为 `8`。
  static EdgeInsetsGeometry get button => const EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 8,
      );

  /// 列表项的内边距
  ///
  /// 为列表项（如 `ListTile`）提供统一的内边距，垂直方向为 `3`，水平方向为 `5`。
  static EdgeInsetsGeometry get listTile => const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 5,
      );

  /// 头像的内边距
  ///
  /// 为头像组件（如 `CircleAvatar`）提供统一的内边距，垂直方向和水平方向均为 `3`。
  static EdgeInsetsGeometry get avatar => const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 3,
      );

  /// 卡片的内边距
  ///
  /// 为卡片组件（如 `Card`）提供统一的内边距，垂直方向和水平方向均为 `5`。
  static EdgeInsetsGeometry get card => const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      );

  /// BottomSheet 底部弹出组件 的内边距
  ///
  /// 为 `BottomSheet` 组件提供统一的内边距，垂直方向和水平方向均为 `5`。
  static EdgeInsetsGeometry get bottomSheet => const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 5,
      );
}
