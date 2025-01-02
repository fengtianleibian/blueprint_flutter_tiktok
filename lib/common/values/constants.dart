/// 应用中的常量管理类
///
/// 该类用于集中管理应用中使用的常量值，
/// 包括服务 API 地址和其他关键配置项。
/// 通过集中管理，便于维护和修改。
class Constants {
  /// 服务 API 基础地址
  ///
  /// 存储应用的基础 API 地址。
  /// 用于网络请求时的统一入口。
  static const baseApiUrl = 'https://api.example.com';

  /// 本地存储的语言代码键名
  ///
  /// 用于保存用户选择的语言代码（如 `en` 或 `zh`）。
  /// 常用于多语言设置和存储。
  static const storageLanguageCode = 'language_code';
}
