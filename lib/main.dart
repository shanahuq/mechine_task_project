import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mechine_task_project/ui_screnns/easy_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:mechine_task_project/bloc/log_in/log_in_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/operator/bloc/operatoe_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/plans/bloc/plans_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/purchase/bloc/purchase_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/user/bloc/user_bloc_bloc.dart';
import 'package:mechine_task_project/bloc/wallet/bloc/wallet_bloc_bloc.dart';

import 'package:mechine_task_project/repository/api%20files/login_api.dart';
import 'package:mechine_task_project/repository/api%20files/operators_api.dart';
import 'package:mechine_task_project/repository/api%20files/plans_api.dart';
import 'package:mechine_task_project/repository/api%20files/purchase_api.dart';
import 'package:mechine_task_project/repository/api%20files/user_api.dart';
import 'package:mechine_task_project/repository/api%20files/wallet_api.dart';

import 'package:mechine_task_project/ui_screnns/log_in_page.dart';
import 'package:mechine_task_project/ui_screnns/stc_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();

  final bool isLoggedIn = prefs.getBool("isLoggedIn") ?? false;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(create: (_) => LoginBloc(LoginApi())),

        BlocProvider<UserBloc>(create: (_) => UserBloc(UserApi())),

        BlocProvider<OperatorBloc>(create: (_) => OperatorBloc(OperatorsApi())),

        BlocProvider<PlansBloc>(create: (_) => PlansBloc(PlansApi())),

        BlocProvider<PurchaseBloc>(create: (_) => PurchaseBloc(PurchaseApi())),

        BlocProvider<WalletBloc>(create: (_) => WalletBloc(WalletApi())),
      ],
      child: MyApp(isLoggedIn: isLoggedIn),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),

        home: isLoggedIn ? EasyCard() : const LogInPage(),
      ),
    );
  }
}
