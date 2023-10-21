import 'package:Commerce/src/constant/color/color.dart';
import 'package:Commerce/src/features/login/bloc/login_bloc.dart';
import 'package:Commerce/src/features/login/bloc/login_event.dart';
import 'package:Commerce/src/features/login/bloc/login_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../controller/login_controller.dart';
import '../widget/login_form.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Container(
          color: kWhiteColor,
          child: SafeArea(
            child: Scaffold(
              backgroundColor: kWhiteColor,
              appBar: buildAppBar(),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        top: 50,
                      ),
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          reusableText("Email"),
                          buildTextField("Email", "Enter your email", "email", (value) {
                            context.read<LoginBloc>().add(EmailEvent(value));
                          }),
                          const SizedBox(
                            height: 20,
                          ),
                          reusableText("Password"),
                          buildTextField("Password", "Enter your Password", "password", (value) {
                            context.read<LoginBloc>().add(PasswordEvent(value));
                          }),
                          buildLoginButton("Login", () {
                            LoginController(context: context).handleLogin("email");
                          })
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
