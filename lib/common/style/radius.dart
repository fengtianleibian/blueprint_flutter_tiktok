/// 应用中的圆角定义统一管理类
///
/// 该类定义了不同组件的圆角大小，使用静态属性提供统一的圆角值。
/// 通过集中管理，可以在项目中保持一致的圆角风格，便于维护和调整。
class AppRadius {
  /// 按钮圆角
  ///
  /// 为按钮组件提供统一的圆角大小，默认为 `5`。
  static double get button => 5;

  /// 输入框圆角
  ///
  /// 为输入框组件（如 `TextField` 或 `TextFormField`）提供统一的圆角大小，默认为 `5`。
  static double get input => 5;

  /// 图片圆角
  ///
  /// 为图片组件提供统一的圆角大小，默认为 `4`。
  static double get img => 4;

  /// 列表项圆角
  ///
  /// 为列表项（如 `ListTile`）提供统一的圆角大小，默认为 `5`。
  static double get listTile => 5;

  /// 卡片圆角
  ///
  /// 为卡片组件（如 `Card`）提供统一的圆角大小，默认为 `12`。
  static double get card => 12;

  /// 图片圆角
  ///
  /// 为图片组件提供统一的圆角大小，默认为 `6`。
  static double get image => 6;
}
