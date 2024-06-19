import 'package:get_it/get_it.dart';
import 'package:mockapp/src/core/routing/app_routing.dart';
import 'package:mockapp/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:mockapp/src/features/bottom_nav/bottom_nav_injections.dart';
import 'package:mockapp/src/shared/shared_exports.dart';

final GetIt getIt = GetIt.instance;

Future<void> initInjections() async {
  await initRoutingInjections();
  initBottomNavInjections();
  initSharedAppInjections();
}

Future<void> initRoutingInjections() async {
  getIt.registerLazySingleton<AppRoutingAbstract>(() => AppRouting());
}
