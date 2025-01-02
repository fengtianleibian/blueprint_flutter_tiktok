/// 应用中的阴影深度统一管理类
///
/// 定义了不同组件的阴影深度（`elevation`），使用静态方法获取值，便于统一维护和修改。
/// 通过集中管理，可以在项目中保持一致的阴影风格。
class AppElevation {
  /// 按钮阴影深度
  ///
  /// 用于定义按钮的阴影深度，默认为 `1`。
  static double get button => 1;

  /// 列表项阴影深度
  ///
  /// 用于定义列表项（如 `ListTile`）的阴影深度，默认为 `0.1`。
  static double get listTile => 0.1;

  /// 头像阴影深度
  ///
  /// 用于定义头像（如 `CircleAvatar`）的阴影深度，默认为 `0.1`。
  static double get avatar => 0.1;

  /// 图片阴影深度
  ///
  /// 用于定义图片（如 `Image` 或 `Container` 包裹的图片）的阴影深度，默认为 `0.1`。
  static double get image => 0.1;

  /// 卡片阴影深度
  ///
  /// 用于定义卡片（如 `Card`）的阴影深度，默认为 `0.5`。
  static double get card => 0.5;
}
