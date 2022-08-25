import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/cubit/cart/cart_cubit.dart';
import 'package:caffe/utils/service/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/cubit/items/items_cubit.dart';
import 'package:caffe/cubit/filters/filters_cubit.dart';

import 'package:caffe/utils/service/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SecureStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String? token = '';
  @override
  initState() {
    super.initState();
    SecureStorage.getToken().then((value) => setState(() {
          token = value;
        }));
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (BuildContext context) => AuthCubit()..setToken(token ?? ''),
        ),
        BlocProvider(
          create: (BuildContext context) => CartCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) => FiltersCubit(),
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ItemsCubit(filtersCubit: BlocProvider.of<FiltersCubit>(context))
                ..loadItems(),
        ),
      ],
      child: MaterialApp(
        title: 'Codempire Caffe',
        routes: Routes.getRoutes(),
        initialRoute: Routes.initial,
      ),
    );
  }
}


/**
 * TODO:
 *  - add geolocation
 *  - push notifications
 *  - video save / player
 */