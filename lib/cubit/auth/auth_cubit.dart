import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'auth_state.dart';

class AuthModel {
  final String token;

  const AuthModel({required this.token});
}

class AuthCubit extends HydratedCubit<AuthModel> {
  AuthCubit() : super(const AuthModel(token: ''));

  void setToken(String token) => emit(AuthModel(token: token));
  void resetToken() => emit(const AuthModel(token: ''));

  @override
  AuthModel fromJson(Map<String, dynamic> json) =>
      AuthModel(token: json['token']);

  @override
  Map<String, dynamic> toJson(AuthModel state) => {
        'token': state.token,
      };
}
