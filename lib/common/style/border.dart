/// 应用中的边框粗细统一管理类
///
/// 定义了不同组件的边框粗细，使用静态方法获取值，便于统一维护和修改。
/// 通过集中管理，可以在项目中保持一致的边框风格。
class AppBorder {
  /// 用于定义按钮的边框厚度，默认为 `0.5`。
  static double get button => 0.5;

  /// 列表项边框粗细
  ///
  /// 用于定义列表项（如 `ListTile`）的边框厚度，默认为 `0.1`。
  static double get listTile => 0.1;

  /// 头像边框粗细
  ///
  /// 用于定义头像边框的厚度，默认为 `0.1`。
  static double get avatar => 0.1;

  /// 卡片边框粗细
  ///
  /// 用于定义卡片（如 `Card`）的边框厚度，默认为 `0.5`。
  static double get card => 0.5;
}
