import 'package:flutter/material.dart';
import 'package:mockapp/src/core/utils/constants/app_paths.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            AppPaths.homeScreenBgImage,
            fit: BoxFit.fitHeight,
            height: double.infinity,
          ),
          Positioned(
            bottom: 150,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 10),
                  Image.asset(
                    AppPaths.homeImage,
                    width: 70,
                  ),
                  const Text(
                    'Welcome to Faerdin',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Thank you for choosing to participate in the Faerdin pilot test for the audio guide. This version is an MVP - a version containing the most essential functionality based on the feedback from you and other test pilots. This app is built to support the visually impaired or blind users. Say "Hi Faerdin" or Hit the voice command button on the bottom right to explore.\n\nDrive safely and enjoy your trip.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 50,
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
                    'Contionue',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
