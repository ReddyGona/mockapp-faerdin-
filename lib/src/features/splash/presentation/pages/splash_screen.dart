import 'package:flutter/material.dart';
import 'package:mockapp/src/core/core_exports.dart';
import 'package:mockapp/src/core/utils/constants/app_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // ignore: always_specify_types
      Future.delayed(const Duration(seconds: 1), () {
        getIt
            .get<AppRoutingAbstract>()
            .navigate(context, RouteConstants.kHomeScreen.path);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.asset(
        AppPaths.splashImage,
        width: double.infinity,
        height: double.infinity,
        fit: BoxFit.cover,
      ),
    );
  }
}
