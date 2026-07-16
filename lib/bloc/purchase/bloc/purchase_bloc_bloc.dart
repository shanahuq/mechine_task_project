import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'purchase_bloc_event.dart';
part 'purchase_bloc_state.dart';

class PurchaseBlocBloc extends Bloc<PurchaseBlocEvent, PurchaseBlocState> {
  PurchaseBlocBloc() : super(PurchaseBlocInitial()) {
    on<PurchaseBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
