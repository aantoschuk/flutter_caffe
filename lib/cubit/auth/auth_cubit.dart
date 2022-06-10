import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends HydratedCubit<AuthState> {
  AuthCubit() : super(const AuthInitial());

  void setToken(String token) {
    emit(AuthInitial(token: token));
  }

  void resetToken() {
    emit(const AuthInitial());
  }

  @override
  AuthState fromJson(Map<String, dynamic> json) => json['value'] as AuthState;

  @override
  Map<String, dynamic>? toJson(state) => {'value': state};
}
