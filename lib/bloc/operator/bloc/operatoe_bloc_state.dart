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
  final OperatorModel user;

  const OperatorSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class OperatorFailure extends OperatoeBlocState {
  final String message;

  const OperatorFailure(this.message);

  @override
  List<Object?> get props => [message];
}
