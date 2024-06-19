import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mockapp/src/core/core_exports.dart';
import 'package:mockapp/src/core/utils/constants/app_paths.dart';
import 'package:mockapp/src/features/google_maps/presentation/pages/google_maps_screen.dart';

class AudioGuideDetailScreen extends StatefulWidget {
  const AudioGuideDetailScreen({super.key});

  @override
  State<AudioGuideDetailScreen> createState() => _AudioGuideDetailScreenState();
}

class _AudioGuideDetailScreenState extends State<AudioGuideDetailScreen> {
  bool viewOnMap = false;
  bool displayFullScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.49,
                child: viewOnMap
                    ? const GoogleMapsScreen()
                    : Image.asset(
                        AppPaths.listImage,
                        fit: BoxFit.cover,
                        gaplessPlayback: true,
                      ),
              ),
              Positioned(
                top: 40,
                left: 10,
                child: IconButton(
                  onPressed: () => context.pop(),
                  icon: Icon(
                    Icons.arrow_back,
                    size: 35,
                    color: Theme.of(context).colorScheme.surface,
                  ),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (!viewOnMap) {
                          viewOnMap = !viewOnMap;
                          setState(() {});
                        } else {
                          getIt.get<AppRoutingAbstract>().navigateWithPush(
                                context,
                                RouteConstants.kGoogleMapsFullScreen.path,
                              );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        backgroundColor: Colors.deepOrangeAccent.shade100,
                        foregroundColor: Colors.white,
                        minimumSize: const Size(250, 50),
                      ),
                      child: Text(
                        viewOnMap
                            ? AppStrings.viewFullScreenMaps
                            : AppStrings.viewOnMapText,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      AppStrings.osloBergenText,
                      style: TextStyle(fontSize: 26),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppPaths.locationImage,
                              width: 20,
                            ),
                            const Text(AppStrings.point1Text),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            Image.asset(
                              AppPaths.locationImage,
                              width: 20,
                            ),
                            const Text(AppStrings.point2Text),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              AppPaths.timeImage,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text(AppStrings.timeText),
                          ],
                        ),
                        const SizedBox(width: 15),
                        Row(
                          children: [
                            Image.asset(
                              AppPaths.flagImage,
                              width: 20,
                            ),
                            const SizedBox(width: 8),
                            const Text('Norway'),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      AppStrings.osloDescriptionText,
                      style: TextStyle(fontSize: 18),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            backgroundColor: Colors.deepOrangeAccent.shade100,
            foregroundColor: Colors.white,
            minimumSize: const Size(250, 50),
          ),
          child: const Text(
            AppStrings.startYourJourneyText,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
