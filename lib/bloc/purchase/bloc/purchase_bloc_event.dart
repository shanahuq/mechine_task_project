import 'package:equatable/equatable.dart';

abstract class PurchaseBlocEvent extends Equatable {
  const PurchaseBlocEvent();

  @override
  List<Object?> get props => [];
}

class GetPurchase extends PurchaseBlocEvent {
  final int planId;
  final int quantity;

  const GetPurchase({
    required this.planId,
    required this.quantity,
  });

  @override
  List<Object?> get props => [
        planId,
        quantity,
      ];
}