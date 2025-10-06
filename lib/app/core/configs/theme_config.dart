import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../themes/color_theme.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: ColorsTheme.homeBackground,
      primaryColor: ColorsTheme.primary,
      colorScheme: const ColorScheme.dark(
        primary: ColorsTheme.primary,
        secondary: ColorsTheme.secondary,
        surface: ColorsTheme.cardBackground,
        error: ColorsTheme.error,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: ColorsTheme.primary,
        foregroundColor: ColorsTheme.secondary,
        elevation: 2,
        centerTitle: true,
        titleTextStyle: GoogleFonts.robotoSlab(
          color: ColorsTheme.secondary,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      textTheme: GoogleFonts.robotoTextTheme().apply(
        bodyColor: ColorsTheme.primaryText,
        displayColor: ColorsTheme.primaryText,
      ),
      cardColor: ColorsTheme.cardBackground,
      iconTheme: const IconThemeData(color: ColorsTheme.secondaryIcon),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: ColorsTheme.cardBackground,
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsTheme.border),
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsTheme.borderSecondary),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: ColorsTheme.primary, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
        hintStyle: const TextStyle(color: ColorsTheme.hintText),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ColorsTheme.primary,
        foregroundColor: ColorsTheme.secondary,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorsTheme.primary,
          foregroundColor: ColorsTheme.secondary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
