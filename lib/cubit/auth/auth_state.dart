part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {
  final String token;

  const AuthInitial({this.token = ''});

  @override
  List<Object> get props => [token];
}

class TokenLoaded extends AuthState {
  final String token;

  const TokenLoaded(this.token);

  @override
  List<Object> get props => [token];
}
