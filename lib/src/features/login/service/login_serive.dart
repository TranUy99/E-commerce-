import 'dart:developer';

import 'package:dio/dio.dart' as dio;
import '../../../api/api_service.dart';
import '../../../core/request/login_request/login_request.dart';
import '../../../core/response/login_response/login_response.dart';

class LoginService {
  static Future<LoginResponse> loginService(String? email, String? password) async {
  
    LoginResponse loginResponse = await ApiService(dio.Dio()).login(LoginRequest(
      email: email,
      password: password,
    ));
   
    return loginResponse;
  }
}
