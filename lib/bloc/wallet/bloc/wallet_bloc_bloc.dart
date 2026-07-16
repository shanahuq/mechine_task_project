import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'wallet_bloc_event.dart';
part 'wallet_bloc_state.dart';

class WalletBlocBloc extends Bloc<WalletBlocEvent, WalletBlocState> {
  WalletBlocBloc() : super(WalletBlocInitial()) {
    on<WalletBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
