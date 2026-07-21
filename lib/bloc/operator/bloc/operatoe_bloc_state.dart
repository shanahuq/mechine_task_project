import 'package:equatable/equatable.dart';
import 'package:mechine_task_project/repository/models/operator_model.dart';

abstract class OperatoeBlocState extends Equatable {
  const OperatoeBlocState();

  @override
  List<Object?> get props => [];
}

class OperatorInitial extends OperatoeBlocState {}

class OperartorLoading extends OperatoeBlocState {}

class OperatorSuccess extends OperatoeBlocState {
final List<OperatorModel> operators;
  const OperatorSuccess(this.operators);

  @override
  List<Object?> get props => [operators];
}

class OperatorFailure extends OperatoeBlocState {
  final String message;

  const OperatorFailure(this.message);

  @override
  List<Object?> get props => [message];
}
