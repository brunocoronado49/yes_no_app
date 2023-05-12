import 'package:flutter/material.dart';

const List<Color> _colorList = [
  _customColor,
  Colors.blue,
  Colors.black45,
  Colors.red,
  Colors.yellow,
  Colors.white30,
  Colors.black,
  Colors.white,
  Colors.orange,
  Colors.green
];

const Color _customColor = Color(0xFF2EE3F0);

class AppTheme {
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor < _colorList.length - 1,
            'Colors must be between $selectedColor and ${_colorList.length - 1}');

  final int selectedColor;

  ThemeData theme() {
    return ThemeData(
        useMaterial3: true, colorSchemeSeed: _colorList[selectedColor]);
  }
}
