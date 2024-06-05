import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:mockapp/src/core/core_injections.dart';
import 'package:mockapp/src/core/routing/routes.dart';
import 'package:mockapp/src/core/themes/theme.dart';
import 'package:mockapp/src/features/bottom_nav/presentation/cubit/navigation_cubit.dart';
import 'package:mockapp/src/shared/presentation/bloc/theme_switch/theme_switch_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();

  // created the storage variable instance to store the data in local storage
  HydratedStorage storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  // using the HydratedBloc to implement the Hydrated bloc storage
  HydratedBloc.storage = storage;

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<NavigationCubit>()),
        BlocProvider<ThemeSwitchBloc>(create: (_) => getIt<ThemeSwitchBloc>()),
      ],
      child: const MyApp(),
    ),
  );

  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeSwitchBloc, ThemeSwitchState>(
      builder: (BuildContext context, ThemeSwitchState state) {
        return MaterialApp.router(
          title: 'MockApp',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.switchValue ? ThemeMode.dark : ThemeMode.light,
          routerConfig: router,
        );
      },
    );
  }
}
