import 'package:equatable/equatable.dart';
import 'package:mechine_task_project/repository/models/wallet_model.dart';

abstract class WalletBlocState extends Equatable {
  const WalletBlocState();

  @override
  List<Object?> get props => [];
}

class WalletInitial extends WalletBlocState {}

class WalletLoading extends WalletBlocState {}

class WalletSuccess extends WalletBlocState {
  final WalletModel wallet;

  const WalletSuccess(this.wallet);

  @override
  List<Object?> get props => [wallet];
}

class WalletFailure extends WalletBlocState {
  final String message;

  const WalletFailure(this.message);

  @override
  List<Object?> get props => [message];
}
