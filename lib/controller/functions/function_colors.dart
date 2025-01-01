// ignore_for_file: deprecated_member_use

import 'dart:ui';

class FunctionColors {
  static Color convertStringToColor(String colorString) {
    List<String> rgbaValues = colorString.replaceAll(' ', '').split(',');
    if (rgbaValues.length != 4) {
      throw ArgumentError('Input string must contain 4 integers for RGBA.');
    }
    int alpha = int.parse(rgbaValues[0]);
    int red = int.parse(rgbaValues[1]);
    int green = int.parse(rgbaValues[2]);
    int blue = int.parse(rgbaValues[3]);

    // Return the Color object
    return Color.fromARGB(alpha, red, green, blue);
  }

  static String getColorRgbValue(Color color) {
    return "255, ${color.red}, ${color.green}, ${color.blue}";
  }
}
