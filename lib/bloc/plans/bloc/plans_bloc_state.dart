import 'package:equatable/equatable.dart';
import 'package:mechine_task_project/repository/models/plan_model.dart';

abstract class PlansBlocState extends Equatable {
  const PlansBlocState();

  @override
  List<Object?> get props => [];
}

class PlansInitial extends PlansBlocState {}

class PlansLoading extends PlansBlocState {}

class PlansSuccess extends PlansBlocState {
  final PlansModel user;

  const PlansSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class PlansFailure extends PlansBlocState {
  final String message;

  const PlansFailure(this.message);

  @override
  List<Object?> get props => [message];
}
