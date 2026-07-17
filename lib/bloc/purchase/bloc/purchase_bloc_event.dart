import 'package:equatable/equatable.dart';

abstract class PurchaseBlocEvent extends Equatable {
  const PurchaseBlocEvent();

  @override
  List<Object?> get props => [];
}

class GetPurchase   extends PurchaseBlocEvent {
  const GetPurchase  ();
}