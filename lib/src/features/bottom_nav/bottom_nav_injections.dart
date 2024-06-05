import 'package:mockapp/src/core/core_injections.dart';
import 'package:mockapp/src/features/bottom_nav/presentation/cubit/navigation_cubit.dart';

void initBottomNavInjections() {
  getIt.registerLazySingleton<NavigationCubit>(() => NavigationCubit());
}
