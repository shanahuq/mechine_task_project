import 'package:equatable/equatable.dart';

abstract class OperatoeBlocEvent extends Equatable {
  const OperatoeBlocEvent();

  @override
  List<Object?> get props => [];
}

class GetUser extends OperatoeBlocEvent {
  const GetUser();
}