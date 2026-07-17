import 'package:equatable/equatable.dart';

abstract class PlansBlocEvent extends Equatable {
  const PlansBlocEvent();

  @override
  List<Object?> get props => [];
}

class GetPlans  extends PlansBlocEvent {
  const GetPlans ();
}