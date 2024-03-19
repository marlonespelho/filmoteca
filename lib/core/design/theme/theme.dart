// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tmdb/core/design/theme/main.dart';

class DefaultTheme {
  static void init() {
    GoogleFonts.config.allowRuntimeFetching = false;
  }

  static ThemeData getTheme(BuildContext context) => ThemeData(
        useMaterial3: true,
        primarySwatch: Palette.materialPrimary,
        primaryColor: Palette.primary,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Palette.secondary,
          primary: Palette.primary,
        ),
        scaffoldBackgroundColor: Palette.secondary,
        iconTheme: DefaultTheme.iconTheme(),
        dialogBackgroundColor: Palette.primary,
        floatingActionButtonTheme: DefaultTheme.floatingActionButtonTheme(),
        textTheme: DefaultTheme.textTheme(),
        outlinedButtonTheme: DefaultTheme.outlinedButtonTheme(),
        elevatedButtonTheme: DefaultTheme.elevatedButtonTheme(),
        inputDecorationTheme: DefaultTheme.inputDecoration(),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: DefaultTheme.inputDecoration(),
          textStyle: const TextStyle(
            color: Palette.titleColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        textButtonTheme: DefaultTheme.textButtonTheme(),
        brightness: Brightness.light,
        textSelectionTheme: DefaultTheme.textSelectionTheme(),
        appBarTheme: const AppBarTheme(
          color: Palette.secondary,
          iconTheme: IconThemeData(color: Palette.secondary),
        ),
        progressIndicatorTheme: progressIndicatorTheme(),
        cardColor: Palette.secondary,
        cardTheme: const CardTheme(color: Colors.white, elevation: 2),
        dividerColor: Palette.gray,
        canvasColor: Colors.white,
      );

  static inputDecoration() {
    return InputDecorationTheme(
      fillColor: Palette.accent,
      focusColor: Palette.accent,
      hoverColor: Palette.accent,
      filled: true,
      labelStyle: inputDecorationTextTheme(
        color: Palette.textColor,
        bold: false,
        size: 14,
      ),
      errorMaxLines: 2,
      suffixIconColor: Palette.titleColor,
      prefixIconColor: Palette.titleColor,
      hintStyle: inputDecorationTextTheme(size: 14, color: Palette.textColor),
      errorStyle: inputDecorationTextTheme(size: 12, color: Palette.error),
      errorBorder: inputDecorationBorderStyle(color: Palette.error),
      focusedErrorBorder: inputDecorationBorderStyle(color: Palette.error),
      contentPadding: const EdgeInsets.all(8),
      border: inputDecorationBorderStyle(color: Palette.titleColor),
      enabledBorder: inputDecorationBorderStyle(color: Palette.titleColor),
      focusedBorder: inputDecorationBorderStyle(color: Palette.primary),
    );
  }

  static inputDecorationBorderStyle({@required color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(
        width: 1,
        color: color,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    );
  }

  static inputDecorationTextTheme({color, double size = 14, bool bold = false}) {
    return TextStyle(
      color: color,
      fontSize: size,
      fontWeight: bold ? FontWeight.bold : FontWeight.w400,
    );
  }

  static TextTheme textTheme() => GoogleFonts.notoSansTextTheme(
        const TextTheme(
          titleLarge: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Palette.titleColor,
          ),
          titleMedium: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Palette.titleColor,
          ),
          titleSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Palette.titleColor,
          ),
          bodySmall: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Palette.textColor,
            decorationThickness: 0,
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Palette.textColor,
            decorationThickness: 0,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Palette.textColor,
            decorationThickness: 0,
          ),
          labelLarge: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: Palette.textColor,
          ),
          labelMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
            color: Palette.labelColor,
          ),
          labelSmall: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Palette.labelColor,
          ),
        ),
      );

  static ElevatedButtonThemeData elevatedButtonTheme() {
    return ElevatedButtonThemeData(
      style: OutlinedButton.styleFrom(
        backgroundColor: Palette.primary,
        foregroundColor: Palette.primary,
        minimumSize: const Size(80, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  static TextButtonThemeData textButtonTheme() {
    return TextButtonThemeData(
      style: OutlinedButton.styleFrom(
        enableFeedback: true,
        foregroundColor: Palette.secondary,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
      ),
    );
  }

  static OutlinedButtonThemeData outlinedButtonTheme() {
    return OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Palette.primary,
        backgroundColor: Colors.white,
        minimumSize: const Size(80, 48),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        side: const BorderSide(color: Colors.white, width: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
        ),
      ),
    );
  }

  static TextSelectionThemeData textSelectionTheme() {
    return const TextSelectionThemeData(
        cursorColor: Palette.accent, selectionColor: Palette.secondary, selectionHandleColor: Palette.primary);
  }

  static floatingActionButtonTheme() {
    return const FloatingActionButtonThemeData(
      backgroundColor: Palette.primary,
      iconSize: 32,
    );
  }

  static iconTheme() {
    return const IconThemeData(color: Palette.textColor);
  }

  static progressIndicatorTheme() {
    return const ProgressIndicatorThemeData(
      color: Palette.primary,
    );
  }
}
