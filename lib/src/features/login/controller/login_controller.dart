// ignore_for_file: use_build_context_synchronously

import 'package:Commerce/src/features/login/bloc/login_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import '../../application/view/application.dart';
import '../service/login_serive.dart';

class LoginController {
  final BuildContext context;
  const LoginController({required this.context});

  void handleLogin(String type) async {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String email = state.email;
        String password = state.password;
        if (email.isEmpty) {}
        if (password.isEmpty) {
        } else {}
        try {
          final loginResponse = await LoginService.loginService(email, password);
          if (loginResponse.errCode == 0) {
               showTopSnackBar(Overlay.of(context),
                              const CustomSnackBar.success(message: 'Login Success'));
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const Application()));
          } else {
            showTopSnackBar(Overlay.of(context),
                              const CustomSnackBar.error(message: 'Wrong email or password'));
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
