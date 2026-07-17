import 'package:equatable/equatable.dart';
import 'package:mechine_task_project/repository/models/purchase_model.dart';

abstract class PurchaseBlocState extends Equatable {
  const PurchaseBlocState();

  @override
  List<Object?> get props => [];
}

class PurchaseInitial extends PurchaseBlocState {}

class PurchaseLoading extends PurchaseBlocState {}

class PurchaseSuccess extends PurchaseBlocState {
  final PurchaseModel user;

  const PurchaseSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class PurchaseFailure extends PurchaseBlocState {
  final String message;

  const PurchaseFailure(this.message);

  @override
  List<Object?> get props => [message];
}
