part of 'authentication_bloc.dart';

class AuthenticationState extends Equatable {
  const AuthenticationState({
    this.status = Status.notSubmitted,
  });
  final Status status;
  @override
  List<Object> get props => [status];

  AuthenticationState copyWith({Status? status}) {
    return AuthenticationState(
      status: status ?? this.status,
    );
  }
}
