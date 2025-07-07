import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../design/color.dart';

class ClockScreenStyles {
  static const backgroundColor = AppColors.background;

  static final timeTextStyle = GoogleFonts.lexend(
    color: AppColors.primaryText,
    fontSize: 64,
    fontWeight: FontWeight.w400,
  );

  static final dateTextStyle = GoogleFonts.lexend(
    color: AppColors.primaryText,
    fontSize: 24,
  );

  static final weekTextStyle = GoogleFonts.lexend(
    color: AppColors.secondaryText,
    fontSize: 16,
  );
}
