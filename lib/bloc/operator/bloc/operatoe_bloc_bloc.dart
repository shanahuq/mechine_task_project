import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mechine_task_project/bloc/operator/bloc/operatoe_bloc_event.dart';
import 'package:mechine_task_project/bloc/operator/bloc/operatoe_bloc_state.dart';
import 'package:mechine_task_project/repository/api%20files/operators_api.dart';
import 'package:mechine_task_project/repository/models/operator_model.dart';



class OperatorBloc extends Bloc<OperatoeBlocEvent, OperatoeBlocState> {
  final OperatorsApi operatorsApi;

  OperatorBloc(this.operatorsApi) : super(OperatorInitial()) {
    on<GetUser>(_getUser);
  }

  Future<void> _getUser(GetUser event, Emitter<OperatoeBlocState> emit) async {
    emit(OperartorLoading());

    try {
      final response = await operatorsApi.getUser();

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = OperatorModel.fromJson(data);

        emit(OperatorSuccess(user));
      } else {
        emit(OperatorFailure(data["message"] ?? "Failed to load user"));
      }
    } catch (e) {
      emit(OperatorFailure(e.toString()));
    }
  }
}
