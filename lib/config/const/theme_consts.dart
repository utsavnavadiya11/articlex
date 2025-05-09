import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ThemeConsts {
  static final ThemeConsts _instance = ThemeConsts._internal();

  factory ThemeConsts() {
    return _instance;
  }

  ThemeConsts._internal() {
    // initialization logic
  }

  static const String kThemeFontFamily = "ProductSans";

  static const String kAppName = "ArticleX";

  static const Color kPrimaryColor = Color(0xFF181881);
  static const Color kScaffoldBgColor = Color(0xFFFBFBFB);
  static const Color kNormalTextColor = Color(0xFF262626);
  static const Color kToastSuccessColor = Color(0xFF38A904);
  static const Color kToastErrorColor = Color(0xFFF14D29);
  static const Color kWhiteTextColor = Color(0xFFFFFFFF);
  static const Color kTextFieldBorderColor = Color(0xFFC8C9D3);
  static const Color kCardBorderColor = Color(0xFFE9E9E9);
  static const Color kLabelTextColor = Color(0xFF999999);
  static const Color kDividerColor = Color(0xFFF3F3F3);
  static const Color kWhiteColor = Colors.white;
  static const Color kHintTextColor = Color(0xFF222222);
  static const Color kPrefixIconColor = Color(0xFF222222);
  static const Color kAppbarBgColor = Color(0xFFFFFFFF);
  static const Color kTransparentColor = Colors.transparent;
  static const Color kButtonPrimaryColor = Color(0xFFE3000F);
  static Color kShimmerBaseColor = Colors.grey.shade300;
  static Color kShimmerHighLightColor = Colors.grey.shade100;
  static Color kGreyTextColor = const Color(0xFF757575);
}

class ThemeStyle {
  static final ThemeStyle _instance = ThemeStyle._internal();

  factory ThemeStyle() {
    return _instance;
  }

  ThemeStyle._internal();

  static ThemeData themeData() {
    return ThemeData.light().copyWith(
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        displayMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        displaySmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        bodyLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        bodyMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        bodySmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        labelLarge: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kLabelTextColor,
        ),
        labelMedium: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kLabelTextColor,
        ),
        labelSmall: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kLabelTextColor,
        ),
        titleLarge: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        titleMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        titleSmall: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        headlineLarge: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        headlineMedium: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
        headlineSmall: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: ThemeConsts.kThemeFontFamily,
          color: ThemeConsts.kNormalTextColor,
        ),
      ),
      scaffoldBackgroundColor: ThemeConsts.kScaffoldBgColor,
      primaryColor: ThemeConsts.kPrimaryColor,
      dividerColor: ThemeConsts.kDividerColor,
      hintColor: ThemeConsts.kLabelTextColor,
      colorScheme: const ColorScheme.light(primary: ThemeConsts.kPrimaryColor),
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: ThemeConsts.kWhiteColor,
        hintStyle: TextStyle(
          color: ThemeConsts.kHintTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
        ),
        labelStyle: TextStyle(
          color: ThemeConsts.kLabelTextColor,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          fontFamily: ThemeConsts.kThemeFontFamily,
        ),
        prefixIconColor: ThemeConsts.kPrefixIconColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ThemeConsts.kTextFieldBorderColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ThemeConsts.kPrimaryColor,
            width: 1.0,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            color: ThemeConsts.kTextFieldBorderColor,
            width: 1.0,
          ),
        ),
      ),
      appBarTheme: const AppBarTheme(
        centerTitle: false,
        backgroundColor: ThemeConsts.kAppbarBgColor,
        surfaceTintColor: ThemeConsts.kAppbarBgColor,
        titleTextStyle: TextStyle(
          color: ThemeConsts.kNormalTextColor,
          fontSize: 18,
          fontWeight: FontWeight.w800,
          fontFamily: ThemeConsts.kThemeFontFamily,
        ),
        elevation: 2,
        titleSpacing: 0,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: ThemeConsts.kAppbarBgColor,
          systemNavigationBarColor: ThemeConsts.kWhiteColor,
          systemNavigationBarIconBrightness: Brightness.dark,
          statusBarIconBrightness: Brightness.dark,
          statusBarBrightness: Brightness.light,
        ),
      ),
      splashColor: ThemeConsts.kTransparentColor,
      highlightColor: ThemeConsts.kTransparentColor,
    );
  }
}
