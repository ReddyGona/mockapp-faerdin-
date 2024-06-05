import 'package:flutter/material.dart';

import 'package:go_router/go_router.dart';
import 'package:mockapp/src/core/routing/route_constants.dart';
import 'package:mockapp/src/features/audio_guide/presentation/pages/audio_guide_detail_screen.dart';
import 'package:mockapp/src/features/audio_guide/presentation/pages/audio_guide_screen.dart';
import 'package:mockapp/src/features/bottom_nav/presentation/pages/bottom_nav_bar.dart';
import 'package:mockapp/src/features/home_screen/presentation/pages/home_screen.dart';
import 'package:mockapp/src/features/settings/presentation/pages/settings_screen.dart';
import 'package:mockapp/src/features/splash/presentation/pages/splash_screen.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shell');

final GoRouter router = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: RouteConstants.kSplashScreen.path,
  debugLogDiagnostics: true,
  refreshListenable: null,
  routes: <RouteBase>[
    GoRoute(
      name: RouteConstants.kSplashScreen.name,
      path: RouteConstants.kSplashScreen.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: const SplashScreen(),
        );
      },
    ),
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return ScaffoldBottomNavBar(child: child);
      },
      routes: [
        GoRoute(
          name: RouteConstants.kHomeScreen.name,
          path: RouteConstants.kHomeScreen.path,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<dynamic>(
              key: state.pageKey,
              child: const HomeScreen(),
            );
          },
        ),
        GoRoute(
          name: RouteConstants.kAudioGuideScreen.name,
          path: RouteConstants.kAudioGuideScreen.path,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<dynamic>(
              key: state.pageKey,
              child: const AudioGuideScreen(),
            );
          },
        ),
        GoRoute(
          name: RouteConstants.kSettingsScreen.name,
          path: RouteConstants.kSettingsScreen.path,
          pageBuilder: (BuildContext context, GoRouterState state) {
            return MaterialPage<dynamic>(
              key: state.pageKey,
              child: const SettingsScreen(),
            );
          },
        ),
      ],
    ),
    GoRoute(
      name: RouteConstants.kAudiGuideDetailScreen.name,
      path: RouteConstants.kAudiGuideDetailScreen.path,
      pageBuilder: (BuildContext context, GoRouterState state) {
        return MaterialPage<dynamic>(
          key: state.pageKey,
          child: const AudioGuideDetailScreen(),
        );
      },
    ),
  ],
  redirect: (BuildContext context, GoRouterState state) async {
    return null;
  },
);
