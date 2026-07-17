import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mechine_task_project/bloc/purchase/bloc/purchase_bloc_event.dart';
import 'package:mechine_task_project/bloc/purchase/bloc/purchase_bloc_state.dart';
import 'package:mechine_task_project/repository/api%20files/purchase_api.dart';
import 'package:mechine_task_project/repository/models/purchase_model.dart';

class PurchaseBloc extends Bloc<PurchaseBlocEvent, PurchaseBlocState> {
  final PurchaseApi purchaseApi;

  PurchaseBloc(this.purchaseApi) : super(PurchaseInitial()) {
   on<GetPurchase>(_getPurchase);
  }

 Future<void> _getPurchase(
    GetPurchase event,
    Emitter<PurchaseBlocState> emit
) async {
    emit(PurchaseLoading());

    try {
      final response = await purchaseApi.getPurchase();

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final user = PurchaseModel.fromJson(data);

        emit(PurchaseSuccess(user));
      } else {
        emit(PurchaseFailure(data["message"] ?? "Failed to load user"));
      }
    } catch (e) {
      emit(PurchaseFailure(e.toString()));
    }
  }
}
