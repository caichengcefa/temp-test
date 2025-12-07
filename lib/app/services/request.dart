import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/services/api.dart';
import 'package:get/get.dart' hide Response;
import 'package:flutter/material.dart';
import 'package:flutter_application_1/app/core/init/global.dart';

class ApiRequest {
  static ApiRequest? _instance;

  late final Dio _dio;
  late final ApiService _api;
  ApiRequest._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:5000',
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        responseType: ResponseType.json,
        headers: {'Accept': 'application/json'},
      ),
    );

    // 可在此处添加拦截器（日志、鉴权等）
    // _dio.interceptors.add(
    //   LogInterceptor(requestBody: true, responseBody: true),
    // );
    _dio.interceptors.add(CustomInterceptor());
    _api = ApiService(_dio);
  }

  static ApiService get api {
    _instance ??= ApiRequest._internal();
    return _instance!._api;
  }
}

class CustomInterceptor extends Interceptor {
  final message = Global.message;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // 在请求头中添加认证 Token
    String token = Global.prefs.getString('token') ?? ''; // 假设这是获取 Token 的方法
    options.headers['Authorization'] = 'Bearer $token';
    super.onRequest(options, handler);
  }

  // 正常响应的 error
  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final code = response.data['code'];
    final msg = response.data['msg'];
    if (code != 200) {
      throw DioException(
        requestOptions: response.requestOptions,
        response: response, // 附加原始响应数据
        type: DioExceptionType.badResponse,
        error: msg,
        message: msg, // 使用服务器返回的错误信息
      );
    }

    final responseData = response.data as Map<String, dynamic>;
    response.data = responseData['data'];
    super.onResponse(response, handler);
  }

  // 错误响应的 error
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      // 退出登录
      Global.prefs.remove('token');
      Get.offAllNamed('/login');
      // message.currentState?.showSnackBar(const SnackBar(content: Text('退出登录')));
      showToast('退出登录');
    } else if (err.response?.data != null) {
      final responseData = err.response?.data as Map<String, dynamic>;
      // message.currentState?.showSnackBar(
      //   SnackBar(content: Text(responseData['msg'] ?? '未知错误')),
      // );
      print(responseData['msg'] ?? '未知错误');
      showToast(responseData['msg'] ?? '未知错误');
    } else {
      // message.currentState?.showSnackBar(
      //   SnackBar(content: Text(err.error.toString())),
      // );
      showToast(err.error.toString());
    }
    super.onError(err, handler);
  }
}
