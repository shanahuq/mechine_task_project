import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'operatoe_bloc_event.dart';
part 'operatoe_bloc_state.dart';

class OperatoeBlocBloc extends Bloc<OperatoeBlocEvent, OperatoeBlocState> {
  OperatoeBlocBloc() : super(OperatoeBlocInitial()) {
    on<OperatoeBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
