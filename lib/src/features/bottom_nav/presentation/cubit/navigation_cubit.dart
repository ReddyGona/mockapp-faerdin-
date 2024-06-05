import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockapp/src/core/core_exports.dart';

part 'navigation_state.dart';

class NavigationCubit extends Cubit<NavigationState> {
  NavigationCubit() : super(NavigationInitial(index: 0));

  void navigateTo(BuildContext context, int index) {
    final routes = [
      RouteConstants.kHomeScreen.path,
      RouteConstants.kAudioGuideScreen.path,
      RouteConstants.kSettingsScreen.path,
    ];

    final routeIndex = index.clamp(0, routes.length - 1);
    getIt.get<AppRoutingAbstract>().navigate(context, routes[routeIndex]);

    emit(NavigationUpdated(index: routeIndex));
  }
}
