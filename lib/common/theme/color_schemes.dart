import 'package:flutter/material.dart';
import 'package:flutter_demo/common/theme/theme.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppTheme.colorMainBlue,
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFFF5F5F5),
  onSecondary: Color(0xFF666666),
  tertiary: Color(0xFFEEEEEE),
  onTertiary: Color(0xFF808080),
  error: Color(0xFFF44459),
  onError: Color(0xFFFFFFFF),
  background: AppTheme.backgroundPrimaryLight,
  onBackground: AppTheme.textColorPrimaryLight,
  surface: Color(0xFFE1E1E1),
  onSurface: Color(0xFFD2D2D2),
  surfaceVariant: Color(0xFF3D3D3D),
  shadow: Colors.transparent,
);

const darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppTheme.colorMainBlue,
  onPrimary: Color(0xFFFFFFFF),
  secondary: Color(0xFF212121),
  onSecondary: Color(0xFFBDBDBD),
  tertiary: Color(0xFF292929),
  onTertiary: Color(0xFF8F8F8F),
  error: Color(0xFFF44459),
  onError: Color(0xFFFFFFFF),
  background: AppTheme.backgroundPrimaryDark,
  onBackground: AppTheme.textColorPrimaryDark,
  surface: Color(0xFF373737),
  onSurface: Color(0xFF3D3D3D),
  surfaceVariant: Color(0xFFD2D2D2),
  shadow: Colors.transparent,
);