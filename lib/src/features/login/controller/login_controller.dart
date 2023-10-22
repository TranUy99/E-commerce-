// ignore_for_file: use_build_context_synchronously

import 'package:Commerce/src/features/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../../../main.dart';
import '../../application/view/application.dart';
import '../service/login_serive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController {
  final BuildContext context;
  const LoginController({required this.context});

  void handleLogin(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {
          // Xử lý email trống
        }
        if (password.isEmpty) {
          // Xử lý mật khẩu trống
        } else {
          try {
            final loginResponse = await LoginService.loginService(email, password);
            if (loginResponse.errCode == 0) {
              final preferences = await SharedPreferences.getInstance();
              preferences.setInt('idUser', loginResponse.idUser!);
              preferences.setString('token', loginResponse.token!);
              getUser.idUser = preferences.getInt('idUser');
              getUser.token = preferences.getString('token');

              showTopSnackBar(
                  Overlay.of(context), const CustomSnackBar.success(message: 'Login Success'));
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => const Application()));
            } else {
              showTopSnackBar(Overlay.of(context),
                  const CustomSnackBar.error(message: 'Wrong email or password'));
            }
          } catch (e) {}
        }
      }
    } catch (e) {
      // Xử lý lỗi khác (nếu có)
    }
  }
}
