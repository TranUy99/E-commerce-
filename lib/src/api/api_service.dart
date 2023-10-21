
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import '../core/model/user.dart';
import '../core/request/login_request/login_request.dart';
import '../core/response/login_response/login_response.dart';


part 'api_service.g.dart';

//Base address
@RestApi(baseUrl: 'http://192.168.1.14:8000')
// @RestApi(baseUrl: 'http://45.117.170.206:8085')

abstract class ApiService {
  factory ApiService(Dio dio) {
    dio.options = BaseOptions(
        validateStatus: (status) => true,
        sendTimeout: const Duration(milliseconds: 5000),
        receiveTimeout: const Duration(milliseconds: 5000),
        connectTimeout: const Duration(milliseconds: 5000),
        receiveDataWhenStatusError: true,
        contentType: 'application/json',
        headers: {'Content-Type': 'application/json'});
    return _ApiService(dio);
  }

  @GET('/api/user/{id}')
  Future<UserDTO> getUser(
      {@Header("Authorization") required String auth, @Path('id') required int id});


  @POST('/api/login')
  Future<LoginResponse> login(@Body() LoginRequest login);

  // @POST('/api/register')
  // Future<SignUpResponse> register(@Body() SignUpRequest register);
}