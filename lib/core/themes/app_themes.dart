import 'package:google_fonts/google_fonts.dart';

import '../../core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppThemes {
  const AppThemes._();

  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);

  static final darkTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: AppColors.secondaryColor),
      useMaterial3: true,
      fontFamily: GoogleFonts.poppins().fontFamily);
}
