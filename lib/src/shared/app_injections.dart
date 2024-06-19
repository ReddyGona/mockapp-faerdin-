import 'package:mockapp/src/core/core_exports.dart';
import 'package:mockapp/src/shared/shared_exports.dart';

void initSharedAppInjections() {
  // Register AppSharedPrefs as a singleton
  getIt.registerLazySingleton<AppSharedPrefs>(() => AppSharedPrefs(getIt()));

  // Register ThemeSwitchBloc as a singleton
  getIt.registerFactory<ThemeSwitchBloc>(() => ThemeSwitchBloc());
}
