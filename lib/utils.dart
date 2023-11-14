import 'package:flutter/material.dart';

Color colorHexToArgb(String hexColor) {
  final hexCode = hexColor.replaceAll('#', '');
  return Color(int.parse('FF$hexCode', radix: 16));
}

Color calcForegroundColor(Color color, [int alpha = -1]) {
  int d = 0;
  if (alpha < 0) {
    alpha = color.alpha;
  }

  // Counting the perceptive luminance - human eye favors green color...
  double luminance =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

  if (luminance > 0.5) {
    d = 16; // bright colors - black font
  } else {
    d = 240; // dark colors - white font
  }

  return Color.fromARGB(alpha, d, d, d);
}
