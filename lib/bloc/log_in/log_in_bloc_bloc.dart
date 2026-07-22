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

      print("STATUS CODE: ${response.statusCode}");
      print("RESPONSE BODY: ${response.body}");

      if (response.statusCode == 200) {
        // Response format:
        // 1707|G3dXhWewZD9qx43b9WtLSSXSGtfqcvyCk697Ksor

        final parts = response.body.trim().split('|');

        if (parts.length == 2) {
          final retailerId = parts[0];
          final accessToken = parts[1];

          final prefs = await SharedPreferences.getInstance();

          await prefs.setString("retailerId", retailerId);

          await prefs.setString("accessToken", accessToken);

          print("Retailer ID: $retailerId");
          print("Access Token: $accessToken");

          emit(LoginSuccess());
        } else {
          emit(LoginFailure("Invalid response format from server"));
        }
      } else {
        emit(LoginFailure("Login failed. Status code: ${response.statusCode}"));
      }
    } catch (e) {
      print("LOGIN ERROR: $e");
      emit(LoginFailure(e.toString()));
    }
  }
}
