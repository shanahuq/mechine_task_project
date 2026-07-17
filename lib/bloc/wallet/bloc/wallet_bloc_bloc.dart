import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:mechine_task_project/bloc/wallet/bloc/wallet_bloc_event.dart';
import 'package:mechine_task_project/bloc/wallet/bloc/wallet_bloc_state.dart';
import 'package:mechine_task_project/repository/api%20files/wallet_api.dart';
import 'package:mechine_task_project/repository/models/wallet_model.dart';

class WalletBloc extends Bloc<WalletBlocEvent, WalletBlocState> {
  final WalletApi walletApi;

  WalletBloc(this.walletApi) : super(WalletInitial()) {
  on<GetWallet>(_getWallet);
  }

Future<void> _getWallet(
    GetWallet event,
    Emitter<WalletBlocState> emit,
) async {
    emit(WalletLoading());

    try {
      final response = await walletApi.getWallet();

      final data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final wallet = WalletModel.fromJson(data);

        emit(WalletSuccess(wallet));
      } else {
        emit(WalletFailure(data["message"] ?? "Failed to load user"));
      }
    } catch (e) {
      emit(WalletFailure(e.toString()));
    }
  }
}
