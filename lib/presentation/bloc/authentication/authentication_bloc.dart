import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/domain/service/user_service.dart';
import 'package:monis/utils/status.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserService _service;
  AuthenticationBloc(this._service) : super(const AuthenticationState()) {
    on<AuthenticationEvent>((event, emit) {});
    on<LoginEvent>(
      (event, emit) async {
        try {
          emit(
            state.copyWith(status: Status.inProgress),
          );
          final status = await _service.loginUser(
            userName: event.username,
            password: event.password,
          );
          emit(
            state.copyWith(status: status),
          );
        } catch (e) {
          event.onError?.call(e);
        }
      },
    );
  }
}
