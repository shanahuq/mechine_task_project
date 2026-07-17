import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/bloc/log_in/log_in_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/user/bloc/user_bloc_bloc.dart';
import 'package:mechine_task_project/repository/api%20files/login_api.dart';
import 'package:mechine_task_project/repository/api%20files/user_api.dart';
import 'package:mechine_task_project/ui_screnns/easy_card_drawer.dart';
import 'package:mechine_task_project/ui_screnns/log_in_page.dart';
import 'package:mechine_task_project/ui_screnns/stc_page.dart';
import 'package:mechine_task_project/ui_screnns/stc_price_page.dart';
import 'package:mechine_task_project/ui_screnns/wallet_history.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc(LoginApi())),

        BlocProvider<UserBloc>(create: (_) => UserBloc(UserApi())),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const LogInPage(),
      ),
    );
  }
}
