import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/features/cart/cart.dart';
import 'package:caffe/utils/service/secure_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/features.dart';

class Routes {
  static const String initial = '/';
  static const String login = '/login';
  static const String orders = '/orders';
  static const String register = '/register';
  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const MainPage(),
      '/login': (context) => const LoginPage(),
      '/register': (context) => const RegisterPage(),
      '/orders': (context) {
        final authState =
            BlocProvider.of<AuthCubit>(context).state as AuthLoaded;
        if (authState.token.isEmpty) {
          return const LoginPage();
        }
        SecureStorage.removeToken();
        BlocProvider.of<AuthCubit>(context).setToken('');
        return const BadPage();
      }
    };
  }
}
