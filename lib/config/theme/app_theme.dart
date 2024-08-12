import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF1A54C7);
const List<Color> _colorTheme = [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.green,
  Colors.black,
  Colors.white,
  Colors.teal
];

class AppTheme {
  final int selectedColor;

  AppTheme({this.selectedColor = 0}):
    assert(
      selectedColor >= 0 && selectedColor <= _colorTheme.length,
      'Colors must be between 0 and ${ _colorTheme.length }'
    );

  ThemeData theme() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorTheme[selectedColor],
      // brightness: Brightness.dark,
    );
  }
}

