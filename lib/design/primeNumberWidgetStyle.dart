import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/color.dart';

class PrimeNumberWidgetStyle {
  static const backgroundColor = AppColors.cardBackground;

  static final handleDecoration = BoxDecoration(
    color: AppColors.accentGreen,
    borderRadius: BorderRadius.circular(10),
  );

  static final titleStyle = GoogleFonts.lexend(
    color: AppColors.primaryText,
    fontSize: 22,
    fontWeight: FontWeight.bold,
  );

  static final bodyStyle = GoogleFonts.lexend(
    color: AppColors.primaryText,
    fontSize: 14,
  );

  static final subtitleStyle = GoogleFonts.lexend(
    color: AppColors.secondaryText,
    fontSize: 14,
  );

  static final buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.accentGreen,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
  );

  static final buttonTextStyle = GoogleFonts.lexend(
    color: AppColors.buttonText,
    fontSize: 15,
  );
}
