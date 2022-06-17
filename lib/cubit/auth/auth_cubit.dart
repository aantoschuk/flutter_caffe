import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthModel {
  final String role;
  final String token;

  const AuthModel({required this.role, required this.token});
}

class AuthCubit extends HydratedCubit<AuthModel> {
  AuthCubit() : super(const AuthModel(role: '', token: ''));

  void setToken(String token) => emit(AuthModel(role: '', token: token));
  void resetToken() => emit(const AuthModel(role: '', token: ''));

  @override
  AuthModel fromJson(Map<String, dynamic> json) =>
      AuthModel(role: json['role'], token: json['token']);

  @override
  Map<String, dynamic> toJson(AuthModel state) => {
        'role': state.role,
        'token': state.token,
      };
}
