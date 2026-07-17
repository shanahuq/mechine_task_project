import 'package:equatable/equatable.dart';

abstract class WalletBlocEvent extends Equatable {
  const WalletBlocEvent();

  @override
  List<Object?> get props => [];
}

class GetWallet    extends WalletBlocEvent {
  const GetWallet   ();
}