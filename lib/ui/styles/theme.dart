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

  static TextStyle s16w400h20cWhite(BuildContext context) => defaultFontTextStyle(context).copyWith(
        height: 1.25,
        color: Colors.white,
      );

  static TextStyle s16w600h20cWhite(BuildContext context) => defaultFontTextStyle(context).copyWith(
        fontWeight: FontWeight.w600,
        height: 1.25,
        color: Colors.white,
      );

  static TextStyle s18w700h20l120507dWhite(BuildContext context) =>
      defaultFontTextStyle(context).copyWith(
        fontSize: 18.sp,
        fontWeight: FontWeight.w700,
        height: 1.11,
      );

  static TextStyle s20w700h20cPrimary(BuildContext context) =>
      defaultFontTextStyle(context).copyWith(
        fontSize: 20.sp,
        fontWeight: FontWeight.w700,
        height: 1,
        color: primary(context),
      );

  static TextStyle s26w700h20cPrimary(BuildContext context) => s20w700h20cPrimary(context).copyWith(
        fontSize: 26.sp,
      );

  static final TextStyle s12w600h30cWhite = TextStyle(
    fontFamily: _kDefaultFontFamily,
    fontSize: 12.sp < 12 ? 12 : 12.sp,
    fontWeight: FontWeight.w600,
    height: 2.5,
    color: Colors.white,
    decoration: TextDecoration.none,
    wordSpacing: 0.1,
    letterSpacing: 0.1,
  );

  static final TextStyle s12w600h30cIosDark = TextStyle(
    fontFamily: _kDefaultFontFamily,
    fontSize: 12.sp < 12 ? 12 : 12.sp,
    fontWeight: FontWeight.w600,
    height: 2.5,
    color: AppColors.iosDark,
    decoration: TextDecoration.none,
    wordSpacing: 0.1,
    letterSpacing: 0.1,
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

  static final appBarHeight = 56.h;

  static final appBarLeadingButtonIconSize = 26.h;

  static const bottomBarHeight = 70.0;

  static final sidePadding = const EdgeInsets.symmetric(horizontal: 24).w;

  static final defaultTopPadding = const EdgeInsets.only(top: 25).h;

  static final mainTabsWaveViewBottomPadding = 20.h;

  static final modalBarHeight = 44.h;

  static final defaultButtonWidth = 220.w;

  static final defaultButtonHeight = 56.h;

  static final defaultIconSize = 24.w;

  static final defaultBorderRadiusValue = 20.w;

  static final defaultBorderRadius = const BorderRadius.all(
    Radius.circular(20),
  ).w;

  static double topSafeAreaHeight(BuildContext context) => View.of(context).padding.top;

  static double bottomSafeAreaHeight(BuildContext context) {
    var bottomSafeAreaPadding = MediaQuery.of(context).padding.bottom;
    return bottomSafeAreaPadding > 0 ? bottomSafeAreaPadding : 20.0;
  }

  static double bottomTabsHeightWithSafeArea(BuildContext context) =>
      bottomSafeAreaHeight(context) + bottomBarHeight + mainTabsWaveViewBottomPadding;

  static EdgeInsets bottomTabsPaddingWithSafeArea(BuildContext context) =>
      EdgeInsets.only(bottom: bottomTabsHeightWithSafeArea(context));

  static EdgeInsets sidePaddingWithBottomSafeArea(BuildContext context) =>
      sidePadding.copyWith(bottom: bottomSafeAreaHeight(context));

  static EdgeInsets sidePaddingWithBottomBottomTabsPaddingAndSafeArea(BuildContext context) =>
      sidePadding.copyWith(bottom: bottomTabsHeightWithSafeArea(context));
}
