import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mechine_task_project/bloc/plans/bloc/plans_bloc_event.dart';
import 'package:mechine_task_project/bloc/plans/bloc/plans_bloc_state.dart';
import 'package:mechine_task_project/repository/api%20files/plans_api.dart';
import 'package:mechine_task_project/repository/models/plan_model.dart';

class PlansBloc extends Bloc<PlansBlocEvent, PlansBlocState> {
  final PlansApi plansApi;

  PlansBloc(this.plansApi) : super(PlansInitial()) {
    on<GetPlans>(_getPlans);
  }

  Future<void> _getPlans(GetPlans event, Emitter<PlansBlocState> emit) async {
    emit(PlansLoading());

    try {
      final response = await plansApi.getPlans(event.id);

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final List<PlansModel> plans =
            (data as List).map((json) => PlansModel.fromJson(json)).toList();

        emit(PlansSuccess(plans));
      } else {
        emit(PlansFailure(data["message"] ?? "Failed to load user"));
      }
    } catch (e) {
      emit(PlansFailure(e.toString()));
    }
  }
}
