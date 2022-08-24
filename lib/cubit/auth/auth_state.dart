part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoaded extends AuthState {
  final String token;
  const AuthLoaded({
    this.token = '',
  });

  @override
  List<Object> get props => [token];
}
