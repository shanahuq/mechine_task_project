import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mechine_task_project/repository/api%20files/user_api.dart';
import 'package:mechine_task_project/repository/models/user_model.dart';

import 'user_bloc_event.dart';
import 'user_bloc_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserApi userApi;

  UserBloc(this.userApi) : super(UserInitial()) {
    on<GetUser>(_getUser);
  }

  Future<void> _getUser(GetUser event, Emitter<UserState> emit) async {
    emit(UserLoading());

    try {
      final response = await userApi.getUser();

      print("USER STATUS: ${response.statusCode}");
      print("USER RESPONSE: ${response.body}");
      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = UserModel.fromJson(data);

        emit(UserSuccess(user));
      } else {
        emit(UserFailure(data["message"] ?? "Failed to load user"));
      }
    } catch (e) {
      emit(UserFailure(e.toString()));
    }
  }
}
