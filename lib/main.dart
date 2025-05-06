import 'package:final_project/bloc/theme_cubit.dart';
import 'package:final_project/templates/routes.dart';
import 'package:final_project/templates/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:final_project/db/app_db.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void main() {
  setupInjector();
  runApp(const MyApp());
}

void setupInjector() {
  getIt.registerSingleton(AppDatabase());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Final Project',
            themeMode: state,
            theme: lightTheme,
            darkTheme: darkTheme,
            routes: routes,
            initialRoute: MyRoutes.splashRoute,
          );
        }
      ),
    );
  }
}
