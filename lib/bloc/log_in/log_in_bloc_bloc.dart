import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mechine_task_project/bloc/log_in/log_in_bloc_event.dart';
import 'package:mechine_task_project/bloc/log_in/log_in_bloc_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../repository/api files/login_api.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginApi loginApi;

  LoginBloc(this.loginApi) : super(LoginInitial()) {
    on<LoginButtonPressed>(_login);
  }

  Future<void> _login(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final response = await loginApi.login(event.phone, event.password);

      final data = jsonDecode(response.body);

      final prefs = await SharedPreferences.getInstance();

      prefs.setString(
        "accessToken",
        data["token"],
      );

      emit(LoginSuccess());
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
