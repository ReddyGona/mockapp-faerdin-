part of 'navigation_cubit.dart';

@immutable
sealed class NavigationState {}

final class NavigationInitial extends NavigationState {
  final int index;
  NavigationInitial({required this.index});
}

class NavigationUpdated extends NavigationState {
  final int index;
  NavigationUpdated({required this.index});
}
