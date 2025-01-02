import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response, FormData, MultipartFile;

import '../index.dart';

/// 基础 HTTP 服务类
///
/// 使用 Dio 封装常用的 HTTP 请求方法，提供全局可用的网络请求服务。
/// 通过 GetX 的 `GetxService` 实现服务全局单例。
class BaseHttpService extends GetxService {
  // 单例实例，通过 Get.find() 获取
  static BaseHttpService get to => Get.find();

  late final Dio _dio; // Dio 实例，用于发送 HTTP 请求

  @override
  void onInit() {
    super.onInit();

    // 初始化 Dio 实例
    var options = BaseOptions(
      baseUrl: Constants.baseApiUrl, // API 基础 URL
      connectTimeout: const Duration(seconds: 10), // 连接超时
      receiveTimeout: const Duration(seconds: 5), // 响应超时
      headers: {}, // 默认 HTTP 头部
      contentType: 'application/json; charset=utf-8', // 默认 Content-Type
      responseType: ResponseType.json, // 默认响应类型
    );
    _dio = Dio(options);

    // 添加自定义拦截器
    _dio.interceptors.add(RequestInterceptors());
  }

  // ===================== 请求方法 =====================
  /// GET 请求
  Future<Response> get(
    String url, {
    //请求的 URL
    Map<String, dynamic>? params, // 查询参数
    Options? options, // 可选配置
    CancelToken? cancelToken, // 请求取消令牌
  }) async {
    Options requestOptions = options ?? Options();
    Response response = await _dio.get(
      url,
      queryParameters: params,
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response; // 返回响应结果
  }

  /// POST 请求
  Future<Response> post(
    String url, {
    dynamic data, // 请求体数据
    Options? options, // 可选配置
    CancelToken? cancelToken, // 请求取消令牌
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.post(
      url,
      data: data ?? {}, // 如果 data 为空，使用空对象
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// PUT 请求
  Future<Response> put(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.put(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// DELETE 请求
  Future<Response> delete(
    String url, {
    dynamic data,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    var requestOptions = options ?? Options();
    Response response = await _dio.delete(
      url,
      data: data ?? {},
      options: requestOptions,
      cancelToken: cancelToken,
    );
    return response;
  }
}

/// 拦截
class RequestInterceptors extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // super.onRequest(options, handler);

    // // http header 头加入 Authorization
    // if (UserService.to.hasToken) {
    //   options.headers['Authorization'] = 'Bearer ${UserService.to.token}';
    // }

    return handler.next(options);
    // 如果你想完成请求并返回一些自定义数据，你可以resolve一个Response对象 `handler.resolve(response)`。
    // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    //
    // 如果你想终止请求并触发一个错误,你可以返回一个`DioError`对象,如`handler.reject(error)`，
    // 这样请求将被中止并触发异常，上层catchError会被调用。
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    // 200 请求成功, 201 添加成功
    if (response.statusCode != 200 && response.statusCode != 201) {
      handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          response: response,
          type: DioExceptionType.badResponse,
        ),
        true, // 触发异常
      );
    } else {
      handler.next(response); // 正常处理响应
    }
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    final exception = HttpException(err.message ?? "error message");
    switch (err.type) {
      case DioExceptionType.badResponse: // 服务端自定义错误体处理
        break;
      case DioExceptionType.unknown: // 处理未知错误
        break;
      case DioExceptionType.cancel: // 处理请求取消
        break;
      case DioExceptionType.connectionTimeout: // 处理连接超时
        break;
      default:
        break;
    }
    // 包装错误信息
    DioException errNext = err.copyWith(
      error: exception,
    );
    handler.next(errNext); // 继续错误处理
  }
}
