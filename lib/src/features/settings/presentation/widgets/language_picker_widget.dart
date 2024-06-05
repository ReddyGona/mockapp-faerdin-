import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mockapp/src/core/core_exports.dart';

class LanguagePickerWidget extends StatelessWidget {
  final List<DropdownModel> languagesList;
  final Function(String id, String value)? onChanged;

  const LanguagePickerWidget({
    super.key,
    required this.languagesList,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: Colors.grey.shade200,
      child: Center(
        child: SizedBox(
          height: 300,
          child: CupertinoPicker(
            itemExtent: 64,
            magnification: 0.9,
            selectionOverlay: Container(
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Colors.grey),
                  bottom: BorderSide(color: Colors.grey),
                  right: BorderSide.none,
                  left: BorderSide.none,
                ),
              ),
            ),
            onSelectedItemChanged: (int value) => onChanged?.call(
                languagesList[value].id, languagesList[value].value),
            children:
                languagesList.map((e) => Center(child: Text(e.value))).toList(),
          ),
        ),
      ),
    );
  }
}
