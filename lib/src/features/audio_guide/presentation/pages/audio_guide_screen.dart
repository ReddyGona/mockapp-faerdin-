import 'package:flutter/material.dart';
import 'package:mockapp/src/core/core_injections.dart';
import 'package:mockapp/src/core/routing/app_routing_abstract/app_routing_abstract.dart';
import 'package:mockapp/src/core/routing/route_constants.dart';
import 'package:mockapp/src/core/utils/constants/app_paths.dart';

class AudioGuideScreen extends StatelessWidget {
  const AudioGuideScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppPaths.audioGuideScreenBgImage,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Text(
                    'Select An Audio Guide From the list below.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: List<Widget>.generate(
                          5,
                          (index) => GestureDetector(
                            onTap: () => getIt
                                .get<AppRoutingAbstract>()
                                .navigateWithPush(
                                  context,
                                  RouteConstants.kAudiGuideDetailScreen.path,
                                ),
                            child: Container(
                              width: double.infinity,
                              margin: const EdgeInsets.only(bottom: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(30),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 5,
                                    spreadRadius: 0,
                                  ),
                                ],
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppPaths.listImage,
                                    height: 160,
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const Text(
                                          'Oslo - Bergen',
                                          style: TextStyle(fontSize: 26),
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AppPaths.locationImage,
                                                  width: 20,
                                                ),
                                                const Text('Point 1: Oslo'),
                                              ],
                                            ),
                                            const SizedBox(width: 15),
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AppPaths.locationImage,
                                                  width: 20,
                                                ),
                                                const Text('Point 2: Bergen'),
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 10),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              children: [
                                                Image.asset(
                                                  AppPaths.timeImage,
                                                  width: 20,
                                                ),
                                                const SizedBox(width: 8),
                                                const Text('7h 3m'),
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
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
