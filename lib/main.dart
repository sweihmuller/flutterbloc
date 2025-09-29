import 'package:blocs_app/presentation/blocs/02-counter/counter_cubit.dart';
import 'package:blocs_app/presentation/blocs/03-theme/theme_cubit.dart';
import 'package:flutter/material.dart';

import 'package:blocs_app/config/config.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blocs_app/presentation/blocs/01-simple_cubit/username_cubit.dart';

void main() {
  runApp(const BlocsProviders());
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => UsernameCubit()),
      BlocProvider(create: (context) => RouterSimpleCubit()),
      BlocProvider(create: (context) => CounterCubit()),
      BlocProvider(create: (context) => ThemeCubit())
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;
    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
    );
  }
}
