import 'package:dio/dio.dart';
import 'package:flutter_application_1/app/modules/home/model/test.dart';
import 'package:flutter_application_1/app/modules/login/model/user.dart';
import 'request.dart';
import 'package:retrofit/retrofit.dart';

part 'api.g.dart';

@RestApi()
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/api/auth/login')
  Future<User> postLogin(@Body() dynamic params);

  @GET('/api/test')
  Future<Test> getTest();

  // --- GET 请求示例 ---
  // @GET注解：定义 HTTP 方法和相对路径
  // @Path注解：将方法参数映射到 URL 路径
  @GET('/users/{id}')
  Future<User> getUser(@Path('id') int id);

  // @Query注解：将方法参数映射为 URL 查询参数 (?param=value)
  @GET('/users/search')
  Future<List<User>> searchUsers({@Query('keyword') required String keyword});

  // --- POST 请求示例 ---
  // @POST注解：定义 POST 请求
  // @Body注解：将方法参数作为请求体 (Body) 发送 (会自动调用 Model 的 toJson())
  @POST('/users')
  Future<User> createUser(@Body() User newUser);

  // --- Headers 示例 ---
  // @Header注解：定义动态 Header
  @GET('/secret')
  Future<String> getSecret(@Header('Authorization') String token);
}

// @RestApi(baseUrl: Global.base_url, parser: Parser.JsonSerializable)
// abstract class RetrofitClient {
//   factory RetrofitClient(Dio dio, {String? baseUrl}) = _RetrofitClient;

//   @GET('/wxarticle/chapters/json')
//   Future<BaseResponseEntity<List<ChapterInfoEntity>>> getChapters();

//   @POST('/article/query/0/json')
//   Future<BaseResponseEntity<String>> queryArticle(
//     @Body() Map<String, dynamic> params,
//   );
// }
// abstract class ApiService {
//   static final Dio _dio = ApiRequest.dio;

//   /// 登录接口
//   /// 返回 Map（根据后端返回结构）
//   static Future<dynamic> login({
//     required String username,
//     required String password,
//   }) async {
//     final res = await _dio.post(
//       '/api/auth/login',
//       data: {'username': username, 'password': password},
//     );
//     return res;
//   }
// }
