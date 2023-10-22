import 'package:Commerce/src/bloc/bloc_provider.dart';
import 'package:Commerce/src/constant/utils/getUser.dart';
import 'src/features/welcome/view/welcome.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}
GetUser getUser = GetUser();
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: AppBlocProvider.allBlocProvider,
        child: ScreenUtilInit(
          builder: (context, child) => MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const Welcome()),
        ));
  }
}
