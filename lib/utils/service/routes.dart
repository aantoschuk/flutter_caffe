import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/cubit/auth/auth_cubit.dart';

import '../../features/features.dart';

class Routes {
  static const String initial = '/';
  static const String login = '/login';
  static const String orders = '/orders';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      '/': (context) => const MainPage(),
      '/login': (context) => const LoginPage(),
      '/orders': (context) {
        final state = BlocProvider.of<AuthCubit>(context).state as AuthInitial;
        if (state.token == '') {
          return const BadPage();
        }
        return const LoginPage();
      }
    };
  }
}
