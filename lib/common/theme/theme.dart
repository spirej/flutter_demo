import 'package:flutter/material.dart';
import 'color_schemes.dart';

class AppTheme {
  static const String _family = 'Lexend';

  static const colorMainBlue = Color(0xFF3C92FF);
  static const colorVip = Color(0xFFECB97A);
  static const colorYellow = Color(0xFFFFAB2E);
  static const colorOrange = Color(0xFFF88E53);
  static const colorRed = Color(0xFFF44459);
  static const colorPurple = Color(0xFFBF5AF2);
  static const colorIndigo = Color(0xFF6823F9);
  static const colorSea = Color(0xFF5056FB);
  static const colorBlueSky = Color(0xFF54D6FF);
  static const colorCyan = Color(0xFF05F0FF);
  static const colorMint = Color(0xFF00D6B9);
  static const colorPink = Color(0xFFFD346E);

  static const gradientYellow = [Color(0xFFF2AF12), Color(0xFFFFD200)];
  static const gradientBlueLight = [Color(0xFF6823F9), Color(0xFF05F0FF)];
  static const gradientBluePurple = [Color(0xFF6823F9), Color(0xFF43BDFF)];
  static const gradientDeepBlue = [Color(0xFF2A99F4), Color(0xFF2DB3ED)];
  static const gradientDeepBlueAlpha = [Color(0x4C2A99F4), Color(0x4C2DB3ED)];
  static const gradientBlueTint = [Color(0xFF79FDDD), Color(0xFF3BB1F3)];
  static const gradientBlueGreen = [Color(0xFF2DAAED), Color(0xFF95D96D)];
  static const gradientVip = [Color(0xFFECB97A), Color(0xFFFFD390)];
  static const gradientVipAlpha = [Color(0x4CECB97A), Color(0x4CFFD390)];
  static const gradientHeart = [Color(0xFFFF696B), Color(0xFFCD0243)];

  static const textColorPrimaryDark = Color(0xFFFFFFFF);
  static const textColorSecondaryDark = Color(0xFFBDBDBD);
  static const textColorTertiaryDark = Color(0xFF8F8F8F);
  static const textColorQuaternaryDark = Color(0xFF818181);
  static const textColorDisabledDark = Color(0xFF5A5A5A);

  static const textColorPrimaryLight = Color(0xFF32323C);
  static const textColorSecondaryLight = Color(0xFF666666);
  static const textColorTertiaryLight = Color(0xFF808080);
  static const textColorQuaternaryLight = Color(0xFFAFAFAF);
  static const textColorDisabledLight = Color(0xFFC9C9C9);

  static const backgroundPrimaryDark = Color(0xFF151515);
  static const backgroundSecondaryDark = Color(0xFF212121);
  static const backgroundTertiaryDark = Color(0xFF292929);
  static const backgroundQuaternaryDark = Color(0xFF2F2F2F);
  static const backgroundDividersOnPrimaryDark = Color(0xFF373737);
  static const backgroundDividersOnSecondaryDark = Color(0xFF3D3D3D);
  static const backgroundDialogDark = Color(0xFF212121);

  static const backgroundPrimaryLight = Color(0xFFFFFFFF);
  static const backgroundSecondaryLight = Color(0xFFF5F5F5);
  static const backgroundTertiaryLight = Color(0xFFEEEEEE);
  static const backgroundQuaternaryLight = Color(0xFFEAEAEA);
  static const backgroundDividersOnPrimaryLight = Color(0xFFE1E1E1);
  static const backgroundDividersOnSecondaryLight = Color(0xFFD2D2D2);
  static const backgroundDialogLight = Color(0xFFF5F5F5);

  static const largeTitle = TextStyle(fontSize: 34, fontWeight: FontWeight.bold, fontFamily: _family);
  static const title = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: _family);
  static const title1 = TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: _family);
  static const title2 = TextStyle(fontSize: 20, fontWeight: FontWeight.bold, fontFamily: _family);
  static const title3 = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: _family);
  static const headline = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: _family);
  static const subHead = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: _family);
  static const bold_13 = TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontFamily: _family);
  static const bold_14 = TextStyle(fontSize: 14, fontWeight: FontWeight.bold, fontFamily: _family);

  static const button1 = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: _family);
  static const button2 = TextStyle(fontSize: 14, fontWeight: FontWeight.w500, fontFamily: _family);
  static const button3 = TextStyle(fontSize: 12, fontWeight: FontWeight.w600, fontFamily: _family);
  static const button4 = TextStyle(fontSize: 16, fontWeight: FontWeight.w600, fontFamily: _family);
  static const body = TextStyle(fontSize: 16, fontWeight: FontWeight.normal, fontFamily: _family);
  static const callout = TextStyle(fontSize: 15, fontWeight: FontWeight.normal, fontFamily: _family);
  static const normal_12 = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: _family);
  static const normal_14 = TextStyle(fontSize: 14, fontWeight: FontWeight.normal, fontFamily: _family);
  static const footnote = TextStyle(fontSize: 13, fontWeight: FontWeight.normal, fontFamily: _family);
  static const caption1 = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, fontFamily: _family);
  static const caption2 = TextStyle(fontSize: 11, fontWeight: FontWeight.normal, fontFamily: _family);
  static const caption3 = TextStyle(fontSize: 10, fontWeight: FontWeight.normal, fontFamily: _family);
  static const caption4 = TextStyle(fontSize: 8, fontWeight: FontWeight.normal, fontFamily: _family);

  static ThemeData light = ThemeData.light().copyWith(
      colorScheme: lightColorScheme,
      primaryColor: lightColorScheme.primary,
      textTheme: ThemeData.light().textTheme.apply(fontFamily: _family),
      primaryTextTheme: ThemeData.light().textTheme.apply(fontFamily: _family),
      scaffoldBackgroundColor: backgroundPrimaryLight,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: backgroundPrimaryLight,
        foregroundColor: textColorPrimaryLight,
        shadowColor: Colors.transparent,
        titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textColorPrimaryLight, fontFamily: _family),
      ),
      iconTheme: const IconThemeData().copyWith(color: lightColorScheme.onPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)))),
              elevation: MaterialStateProperty.all(0))),
      textButtonTheme: const TextButtonThemeData(style: ButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: textColorDisabledLight),
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
              elevation: 0)),
      dialogBackgroundColor: Colors.white.withOpacity(0.8),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: Colors.white.withOpacity(0.8)),
      // pageTransitionsTheme: const PageTransitionsTheme(builders: {
      //   TargetPlatform.android: ZoomPageTransitionsBuilder(),
      //   TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
      // })
  );

  static ThemeData dark = ThemeData.dark().copyWith(
      colorScheme: darkColorScheme,
      primaryColor: darkColorScheme.primary,
      textTheme: ThemeData.dark().textTheme.apply(fontFamily: _family),
      primaryTextTheme: ThemeData.dark().textTheme.apply(fontFamily: _family),
      scaffoldBackgroundColor: backgroundPrimaryDark,
      appBarTheme: const AppBarTheme().copyWith(
        backgroundColor: backgroundPrimaryDark,
        foregroundColor: textColorPrimaryDark,
        shadowColor: Colors.transparent,
        titleTextStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textColorPrimaryDark, fontFamily: _family),
      ),
      iconTheme: const IconThemeData().copyWith(color: darkColorScheme.onPrimary),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(shape: MaterialStateProperty.all(const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))),
      ),
      textButtonTheme: const TextButtonThemeData(style: ButtonStyle()),
      outlinedButtonTheme: OutlinedButtonThemeData(
          style: OutlinedButton.styleFrom(
              side: const BorderSide(color: textColorDisabledDark), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))))),
      dialogBackgroundColor: const Color(0xFF303030).withOpacity(0.8),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor: const Color(0xFF303030).withOpacity(0.8)),
      // pageTransitionsTheme: const PageTransitionsTheme(builders: {
      //   TargetPlatform.android: ZoomPageTransitionsBuilder(),
      //   TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
      // })
  );
}

///用于重命名颜色属性
extension ThemeDataColorExtension on ThemeData {
  Color get textColorPrimary => isDark ? AppTheme.textColorPrimaryDark : AppTheme.textColorPrimaryLight;

  Color get textColorSecondary => isDark ? AppTheme.textColorSecondaryDark : AppTheme.textColorSecondaryLight;

  Color get textColorTertiary => isDark ? AppTheme.textColorTertiaryDark : AppTheme.textColorTertiaryLight;

  Color get textColorQuaternary => isDark ? AppTheme.textColorQuaternaryDark : AppTheme.textColorQuaternaryLight;

  Color get textColorDisabled => isDark ? AppTheme.textColorDisabledDark : AppTheme.textColorDisabledLight;

  Color get backgroundPrimary => isDark ? AppTheme.backgroundPrimaryDark : AppTheme.backgroundPrimaryLight;

  Color get backgroundSecondary => isDark ? AppTheme.backgroundSecondaryDark : AppTheme.backgroundSecondaryLight;

  Color get backgroundTertiary => isDark ? AppTheme.backgroundTertiaryDark : AppTheme.backgroundTertiaryLight;

  Color get backgroundQuaternary => isDark ? AppTheme.backgroundQuaternaryDark : AppTheme.backgroundQuaternaryLight;

  Color get backgroundDividersOnPrimary => isDark ? AppTheme.backgroundDividersOnPrimaryDark : AppTheme.backgroundDividersOnPrimaryLight;

  Color get backgroundDividersOnSecondary => isDark ? AppTheme.backgroundDividersOnSecondaryDark : AppTheme.backgroundDividersOnSecondaryLight;

  Color get backgroundDialog => isDark ? AppTheme.backgroundDialogDark : AppTheme.backgroundDialogLight;

  // 判断主题
  bool get isDark => false;
}
