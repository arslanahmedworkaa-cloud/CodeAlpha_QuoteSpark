import 'package:flutter/material.dart';

class AppColors {
  static const Color background = Color(0xFFF4F2FF);
  static const Color textDark = Color(0xFF2D2A4A);
  static const Color textLight = Color(0xFF7C7A99);
  static const Color accent = Color(0xFF6C4DF6);

  // Each item is a pair of colors that makes one gradient background.
  // Every gradient has exactly 2 colors, so the color change can be animated smoothly.
  static const List<LinearGradient> backgroundGradients = [
    LinearGradient(
      colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFF0F9B8E), Color(0xFF1D6FA3)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFFF6B6B), Color(0xFFC44569)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFF3A1C71), Color(0xFFD76D77)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFF134E5E), Color(0xFF3C8D6E)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFFDA4453), Color(0xFF89216B)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
    LinearGradient(
      colors: [Color(0xFF283E51), Color(0xFF4B79A1)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    ),
  ];
}
