import 'package:bloc/bloc.dart';
import 'package:cmflutter0/src/models/user.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState()) {
    on<LoginEventAdd>((event, emit) {
      // execute something
      emit(state.copyWith(count: state.count + 1));
    });

    on<LoginEventRemove>((event, emit) {
      // execute something
      emit(state.copyWith(count: state.count - 1));
    });

    on<LoginEventLogin>((event, emit) {
      // execute something
      if (event.payload.username == "admin" &&
          event.payload.password == "1234") {
        emit(state.copyWith(isAuthened: true));
      } else {
        emit(state.copyWith(isAuthened: false));
      }
    });
  }
}
