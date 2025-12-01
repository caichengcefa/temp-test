import 'package:dio/dio.dart';

class ApiClient {
  factory ApiClient() => _instance;

  static final ApiClient _instance = ApiClient._internal();

  /// 直接获取 Dio 实例进行请求
  static Dio get dio => _instance._dio;

  static const String _defaultBaseUrl = 'https://api.example.com'; // TODO: 修改为实际接口地址
  late final Dio _dio;
  ApiClient._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: _defaultBaseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json'},
      ),
    );

    // 可在此处添加拦截器（日志、鉴权等）
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
