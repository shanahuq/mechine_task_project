import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'plans_bloc_event.dart';
part 'plans_bloc_state.dart';

class PlansBlocBloc extends Bloc<PlansBlocEvent, PlansBlocState> {
  PlansBlocBloc() : super(PlansBlocInitial()) {
    on<PlansBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
