import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mockapp/src/core/utils/constants/app_paths.dart';

class AudioGuideDetailScreen extends StatelessWidget {
  const AudioGuideDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.49,
                child: Image.asset(
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
                  icon: const Icon(Icons.arrow_back, size: 35),
                ),
              ),
              Positioned(
                bottom: 30,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    ElevatedButton(
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
                        'View On Map',
                        style: TextStyle(fontSize: 20),
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
                      'Oslo - Bergen',
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
                      mainAxisAlignment: MainAxisAlignment.start,
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
                    const SizedBox(height: 18),
                    const Text(
                      "The journey between Oslo and Bergen across Hardangervidda offers beautiful jords, spectacular mountains and fabulous nature. Among things you will find on this trip are Northern Europe's largest mountain plateau, Hardangervidda, some of Norway's greatest waterfalls, one of the world's longest suspension bridge and much",
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
        padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 30),
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
            'Start Your Journey',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
