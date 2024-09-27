import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pokedex_scaffold/ui/styles/colors.gen.dart';
import 'package:pokedex_scaffold/ui/styles/fonts.gen.dart';
import 'package:pokedex_scaffold/utils/extensions/build_context.dart';

class AppTheme {
  static const _kDefaultFontFamily = FontFamily.lato;

  static ThemeData get lightMaterialTheme => ThemeData(
        brightness: Brightness.light,
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.cF5F6F7,
        fontFamily: _kDefaultFontFamily,
        cardTheme: const CardTheme(
          shadowColor: Colors.transparent,
          margin: EdgeInsets.zero,
          color: Colors.white,
        ),
      );

  static ThemeData get darkMaterialTheme => ThemeData(
        brightness: Brightness.dark,
        primaryColor: AppColors.darkPrimary,
        scaffoldBackgroundColor: AppColors.iosDark,
        fontFamily: _kDefaultFontFamily,
        cardTheme: const CardTheme(
          shadowColor: Colors.transparent,
          margin: EdgeInsets.zero,
          color: AppColors.androidDark,
        ),
      );

  // static CupertinoThemeData get cupertinoTheme => const CupertinoThemeData(
  //       primaryColor: AppColors.primary,
  //       scaffoldBackgroundColor: AppColors.cF5F6F7,
  //       textTheme: CupertinoTextThemeData(
  //         textStyle: TextStyle(
  //           fontFamily: _kDefaultFontFamily,
  //         ),
  //       ),
  //     );

  // Colors
  static Color primary(BuildContext context) =>
      context.isDarkMode() ? AppColors.darkPrimary : AppColors.primary;

  static Color secondary(BuildContext context) =>
      context.isDarkMode() ? AppColors.darkSecondary : AppColors.secondary;

  static Color lF5F6F7dIosDark(BuildContext context) =>
      context.isDarkMode() ? AppColors.iosDark : AppColors.cF5F6F7;

  static Color lPrimarydF5F6F7(BuildContext context) =>
      context.isDarkMode() ? AppColors.cF5F6F7 : AppColors.primary;

  static Color lF5F6F7dDarkPrimary(BuildContext context) =>
      context.isDarkMode() ? AppColors.darkPrimary : AppColors.cF5F6F7;

  static Color lWhitedAndroidDark(BuildContext context) =>
      context.isDarkMode() ? AppColors.androidDark : Colors.white;

  static Color l53E053d3EB33E(BuildContext context) =>
      context.isDarkMode() ? AppColors.c3EB33E : AppColors.c53E053;

  static Color l44000000d44AAAAAA(BuildContext context) =>
      context.isDarkMode() ? AppColors.c44AAAAAA : AppColors.c44000000;

  // Fonts
  static TextStyle defaultFontTextStyle(BuildContext context) => TextStyle(
        fontFamily: _kDefaultFontFamily,
        fontSize: 16.sp,
        fontWeight: FontWeight.w400,
        height: 1.36,
        color: context.isDarkMode() ? Colors.white : AppColors.c120507,
        decoration: TextDecoration.none,
      );

  // font styles
  static TextStyle s16w400h20l120507dWhite(BuildContext context) =>
      defaultFontTextStyle(context).copyWith(
        height: 1.25,
      );

  // Html text style
  // static Style defaultHtmlStyle(BuildContext context) => Style(
  //       fontSize: FontSize.rem(1.14),
  //       fontWeight: FontWeight.w400,
  //       fontFamily: _kDefaultFontFamily,
  //       lineHeight: const LineHeight(1.5),
  //       padding: EdgeInsets.zero,
  //       color: context.isDarkMode() ? Colors.white : AppColors.c1F2933,
  //     );

  // static Style cardSubheaderHtmlStyle(BuildContext context) => defaultHtmlStyle(context).copyWith(
  //       fontSize: FontSize.rem(1.43),
  //       lineHeight: const LineHeight(1.2),
  //     );

  // Spacings
  // static EdgeInsets sidePadding(BuildContext context) =>
  //     ResponsivenessUtils.getValueForDeviceRefinedSize(
  //       context,
  //       mobileSmall: const EdgeInsets.symmetric(horizontal: 14.0),
  //       mobileNormal: const EdgeInsets.symmetric(horizontal: 18.0),
  //       mobileLarge: const EdgeInsets.symmetric(horizontal: 20.0),
  //       mobileExtraLarge: const EdgeInsets.symmetric(horizontal: 24.0),
  //     );
}
