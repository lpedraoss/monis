part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class LoginEvent extends AuthenticationEvent {
  final String username;
  final String password;
  final Function(dynamic error)? onError;
  const LoginEvent({
    required this.password,
    required this.username,
    this.onError,
  });

  @override
  List<Object> get props => [username, password];
}
