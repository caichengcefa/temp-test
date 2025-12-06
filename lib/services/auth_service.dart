import 'package:dio/dio.dart';
import 'api_client.dart';

class AuthService {
  AuthService._internal();
  static final AuthService instance = AuthService._internal();

  final Dio _dio = ApiClient.dio;

  /// 登录接口
  /// 返回 Map（根据后端返回结构）
  Future<Map<String, dynamic>> login({required String username, required String password}) async {
    try {
      final resp = await _dio.post('/login', data: {'username': username, 'password': password});

      if (resp.statusCode != null && resp.statusCode! >= 200 && resp.statusCode! < 300) {
        // 假设后端返回 JSON
        if (resp.data is Map<String, dynamic>) {
          return resp.data as Map<String, dynamic>;
        }
        return {'data': resp.data};
      }

      throw DioException(requestOptions: resp.requestOptions, response: resp);
    } on DioException catch (_) {
      // 抛出带信息的异常，调用方可展示给用户
      rethrow;
    }
  }
}
