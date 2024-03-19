import 'package:flutter/material.dart';
import 'color_helpers.dart';

class Palette {
  static const Color backgroundColor = Color(0xFFF4F4F4);
  static const Color darkBackgroundColor = Color(0xFFEDF2F7);
  static const Color whiteSmoke = Color(0xFFF7FAFC);
  static const Color backgroundCardPayment = Color(0xFF19504C);

  static const Color inputBackground = Color(0xFFFFFFFF);
  static const Color inputBorderColor = Color(0xFF626262);
  static const Color inputBorderFocusedColor = Color(0xFF699C44);
  static const Color dividerListColor = Color(0xFFD9D9D9);

  static const Color textColor = Color(0xFFD9D9D9);
  static const Color labelColor = Color(0xFFD9D9D9);
  static const Color titleColor = Color(0xFFD9D9D9);
  static const Color titleDarkColor = Color(0xFF1D1D1D);
  static const Color dividerColor = Color(0xFFD9D9D9);

  static const Color neutral100 = Color(0xFFF7FAFC);
  static const Color neutral200 = Color(0xFFEDF2F7);
  static const Color neutral300 = Color(0xFFE2E8F0);
  static const Color neutral400 = Color(0xFFCBD5E0);
  static const Color neutral500 = Color(0xFFA0AEC0);
  static const Color neutral600 = Color(0xFF718096);
  static const Color neutral700 = Color(0xFF4A5568);
  static const Color neutral800 = Color(0xFF2D3748);

  static const Color primary = Color(0xFF932020);
  static const Color primaryDark = Color(0xFF007844);
  static const Color primaryMedium = Color(0xFF699C44);
  static const Color secondary = Color(0xFF1E1E1E);
  static const Color accent = Color(0xFF2E2A2A);

  static const Color hoverButton = Color(0xFF004829);
  static const Color gray = Color(0xFFB5B5C3);
  static const Color lightGrey = Color(0xFF9F9F9);

  static const Color attention = Colors.yellow;
  static const Color error = Color(0xFFE53E3E);
  static const Color success = Color(0xFF68D391);
  static const Color limeGreen = Color(0xFF56FF3B);

  static const Color gradientGreenColor1 = Color(0xFF1EB652);
  static const Color gradientGreenColor2 = Color(0xFF084022);

  static Color get backgroundSnackAlert => generateMaterialColor(const Color.fromRGBO(255, 248, 224, 1));
  static Color get backgroundSnackError => generateMaterialColor(primary);
  static Color get backgroundSnackSuccess => generateMaterialColor(Color(0xFF1EB652));

  static MaterialColor materialPrimary = generateMaterialColor(primary);
  static MaterialColor materialSecondary = generateMaterialColor(secondary);
  static MaterialColor materialHoverButton = generateMaterialColor(hoverButton);
}
