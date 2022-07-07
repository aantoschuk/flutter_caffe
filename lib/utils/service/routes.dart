import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/cubit/auth/auth_cubit.dart';

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
        final state = BlocProvider?.of<AuthCubit>(context).state;
        if (state.token == '') {
          return const LoginPage();
        }
        BlocProvider.of<AuthCubit>(context).resetToken();
        return const BadPage();
      }
    };
  }
}
