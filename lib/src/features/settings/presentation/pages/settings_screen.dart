import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockapp/src/core/utils/constants/app_language.dart';
import 'package:mockapp/src/features/settings/presentation/widgets/font_size_widget.dart';
import 'package:mockapp/src/features/settings/presentation/widgets/language_picker_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String hintText = appLanguages.first.value;
  bool showLanguagePicker = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Settings',
                style: TextStyle(fontSize: 26),
              ),
              const ExpansionTile(
                title: Text(
                  'User Preferences',
                  style: TextStyle(fontSize: 20),
                ),
                tilePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                shape: RoundedRectangleBorder(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'App Font Size',
                        style: TextStyle(fontSize: 18),
                      ),
                      // Row(
                      //   children: [
                      //     const Icon(Icons.remove),
                      //     Container(
                      //       width: 50,
                      //       height: 30,
                      //       margin: const EdgeInsets.symmetric(horizontal: 8),
                      //       decoration: BoxDecoration(
                      //         color: Colors.grey.shade300,
                      //       ),
                      //       child: const Center(
                      //         child: Text(
                      //           'M',
                      //           style: TextStyle(fontSize: 18),
                      //         ),
                      //       ),
                      //     ),
                      //     const Icon(Icons.add)
                      //   ],
                      // )
                      FontSizeWidget(),
                    ],
                  ),
                ],
              ),
              const Divider(),
              ExpansionTile(
                title: const Text(
                  'Language Settings',
                  style: TextStyle(fontSize: 20),
                ),
                tilePadding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                shape: const RoundedRectangleBorder(),
                expandedAlignment: Alignment.centerLeft,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'App Language',
                        style: TextStyle(fontSize: 18),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () => setState(
                            () => showLanguagePicker = !showLanguagePicker,
                          ),
                          child: Container(
                            width: 150,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            alignment: Alignment.centerLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(hintText),
                                const Icon(Icons.arrow_drop_down),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Visibility(
                    visible: showLanguagePicker,
                    child: LanguagePickerWidget(
                      languagesList: appLanguages,
                      onChanged: (id, value) =>
                          setState(() => hintText = value),
                    ),
                  ),
                ],
              ),
              const Divider(),
              const ExpansionTile(
                title: Text(
                  'Terms Of service',
                  style: TextStyle(fontSize: 20),
                ),
                tilePadding: EdgeInsets.symmetric(horizontal: 0, vertical: 20),
                shape: RoundedRectangleBorder(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
