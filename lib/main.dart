import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockapp/src/core/core_injections.dart';
import 'package:mockapp/src/core/routing/routes.dart';
import 'package:mockapp/src/features/bottom_nav/presentation/cubit/navigation_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initInjections();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => getIt<NavigationCubit>()),
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
    return MaterialApp.router(
      title: 'MockApp',
      theme: ThemeData(useMaterial3: true),
      routerConfig: router,
    );
  }
}
