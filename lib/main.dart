import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'package:caffe/cubit/auth/auth_cubit.dart';
import 'package:caffe/cubit/items/items_cubit.dart';
import 'package:caffe/cubit/filters/filters_cubit.dart';

import 'package:caffe/utils/service/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getTemporaryDirectory(),
  );

  HydratedBlocOverrides.runZoned(
    () => runApp(const MyApp()),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
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
