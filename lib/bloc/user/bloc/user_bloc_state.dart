import 'package:equatable/equatable.dart';
import 'package:mechine_task_project/repository/models/user_model.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object?> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final UserModel user;

  const UserSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class UserFailure extends UserState {
  final String message;

  const UserFailure(this.message);

  @override
  List<Object?> get props => [message];
}