import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mockapp/src/core/utils/constants/app_paths.dart';
import 'package:mockapp/src/features/bottom_nav/presentation/cubit/navigation_cubit.dart';

class ScaffoldBottomNavBar extends StatelessWidget {
  final Widget child;
  const ScaffoldBottomNavBar({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, NavigationState>(
      builder: (context, state) {
        // Extract the current index from the state
        int currentIndex = 0; // Default value
        if (state is NavigationInitial) {
          currentIndex = state.index;
        } else if (state is NavigationUpdated) {
          currentIndex = state.index;
        }

        return Scaffold(
          backgroundColor: Colors.white,
          body: child,
          floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
          floatingActionButton: Visibility(
            visible: currentIndex == 0,
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(bottom: 50),
              child: FloatingActionButton(
                onPressed: () {},
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
                child: const Icon(Icons.mic, size: 40),
              ),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            onTap: (value) =>
                context.read<NavigationCubit>().navigateTo(context, value),
            items: [
              BottomNavigationBarItem(
                icon: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppPaths.disabledHomeImage,
                      height: 24,
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
                activeIcon: Image.asset(
                  AppPaths.homeImage,
                  height: 24,
                  width: 24,
                  fit: BoxFit.cover,
                ),
                label: 'Home',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.audiotrack_outlined, size: 24),
                activeIcon: Icon(Icons.audiotrack_rounded, size: 24),
                label: 'Audio Guide',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined, size: 24),
                activeIcon: Icon(Icons.settings, size: 24),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }
}
