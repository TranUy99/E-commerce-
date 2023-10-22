import 'package:flutter_bloc/flutter_bloc.dart';


import '../features/login/bloc/login_bloc.dart';
import '../features/profile/setting/bloc/setting_bloc.dart';
import '../features/welcome/bloc/welcome_bloc.dart';


class AppBlocProvider {
  static get allBlocProvider => [
        BlocProvider(
          create: (context) => WelcomeBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => SettingBloc(),
        ),
      ];
}
