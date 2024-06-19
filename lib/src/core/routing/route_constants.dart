import 'package:mockapp/src/core/routing/app_route_config.dart';

class RouteConstants {
  static const AppRouteConfig kSplashScreen = AppRouteConfig(
    name: 'splashScreen',
    path: '/splashScreen',
  );

  static const AppRouteConfig kHomeScreen = AppRouteConfig(
    name: 'homeScreen',
    path: '/homeScreen',
  );

  static const AppRouteConfig kAudioGuideScreen = AppRouteConfig(
    name: 'audioGuideScreen',
    path: '/audioGuideScreen',
  );

  static const AppRouteConfig kSettingsScreen = AppRouteConfig(
    name: 'settingsScreen',
    path: '/settingsScreen',
  );

  static const AppRouteConfig kAudiGuideDetailScreen = AppRouteConfig(
    name: 'audiGuideDetailScreen',
    path: '/AudiGuideDetailScreen',
  );

  static const AppRouteConfig kGoogleMapsScreen = AppRouteConfig(
    name: 'googleMapsScreen',
    path: '/GoogleMapsScreen',
  );

  static const AppRouteConfig kGoogleMapsFullScreen = AppRouteConfig(
    name: 'googleMapsFullScreen',
    path: '/GoogleMapsFullScreen',
  );
}
