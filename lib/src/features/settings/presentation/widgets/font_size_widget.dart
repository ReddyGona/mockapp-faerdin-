import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum SizeType { Small, Medium, Large }

class FontSizeWidget extends StatefulWidget {
  const FontSizeWidget({super.key});

  @override
  State<FontSizeWidget> createState() => _FontSizeWidgetState();
}

class _FontSizeWidgetState extends State<FontSizeWidget> {
  SizeType _sizeType = SizeType.Medium;

  void _decreaseSize() {
    setState(() {
      if (_sizeType == SizeType.Large) {
        _sizeType = SizeType.Medium;
      } else if (_sizeType == SizeType.Medium) {
        _sizeType = SizeType.Small;
      }
    });
  }

  void _increaseSize() {
    setState(() {
      if (_sizeType == SizeType.Small) {
        _sizeType = SizeType.Medium;
      } else if (_sizeType == SizeType.Medium) {
        _sizeType = SizeType.Large;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    String displayText;
    switch (_sizeType) {
      case SizeType.Small:
        displayText = 'S';
        break;
      case SizeType.Medium:
        displayText = 'M';
        break;
      case SizeType.Large:
        displayText = 'L';
        break;
    }

    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.remove),
          onPressed: _decreaseSize,
        ),
        Container(
          width: 50,
          height: 30,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
          ),
          child: Center(
            child: Text(
              displayText,
              style: const TextStyle(fontSize: 18),
            ),
          ),
        ),
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: _increaseSize,
        ),
      ],
    );
  }
}
