import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:caffe/cubit/items/items_cubit.dart';
import 'package:caffe/cubit/filters/filters_cubit.dart';

import 'package:caffe/widgets/topbar.dart';
import 'package:caffe/features/main/main.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (BuildContext context) => FiltersCubit(),
          ),
          BlocProvider(
            create: (BuildContext context) =>
                ItemsCubit(filtersCubit: BlocProvider.of<FiltersCubit>(context))
                  ..loadItems(),
          ),
        ],
        child: const MaterialApp(
          title: 'Codempire Caffe',
          home: Scaffold(
            appBar: Topbar(),
            body: MainPage(),
          ),
        ));
  }
}
