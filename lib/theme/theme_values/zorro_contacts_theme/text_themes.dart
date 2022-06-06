import 'package:finap_base_theme/base_colors.dart';
import 'package:finap_base_theme/base_font_sizes.dart';
import 'package:finap_base_theme/base_fonts.dart';
import 'package:finap_base_theme/base_text_themes.dart';
import 'package:finap_base_theme/palette.dart';
import 'package:zorro_sign_contacts/injection_container.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/font_sizes.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/fonts.dart';
import 'package:zorro_sign_contacts/theme/theme_values/zorro_contacts_theme/colors.dart'
    as mentoring_color_theme;
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TextThemes extends BaseTextThemes {
  BaseFonts fonts = di<Fonts>();
  BaseFontSizes fontSizes = di<FontSizes>();
  BaseColors colors = mentoring_color_theme.Colors();

  @override
  TextTheme? get accentTextTheme {
    return const TextTheme();
  }

  @override
  TextTheme? get primaryTextTheme {
    return typography?.black.copyWith(
        headline1: TextStyle(
            fontSize: fontSizes.h1.sp,
            fontWeight: FontWeight.w800,
            color: Palette.BLACK),
        headline2: TextStyle(
            fontSize: fontSizes.h2.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline3: TextStyle(
            fontSize: fontSizes.h3.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline4: TextStyle(
            fontSize: fontSizes.h4.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline5: TextStyle(
            fontSize: fontSizes.h5.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline6: TextStyle(
            fontSize: fontSizes.h6.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        bodyText1: TextStyle(
            fontSize: fontSizes.body1.sp,
            fontWeight: FontWeight.w400,
            color: Palette.BLACK),
        bodyText2: TextStyle(
            fontSize: fontSizes.body2.sp,
            fontWeight: FontWeight.w400,
            color: Palette.BLACK),
        subtitle1:
            TextStyle(fontSize: fontSizes.subTitle1.sp, color: Palette.BLACK),
        subtitle2:
            TextStyle(fontSize: fontSizes.subTitle2.sp, color: Palette.BLACK));
  }

  @override
  TextTheme? get textTheme {
    return typography?.black.copyWith(
        headline1: TextStyle(
            fontSize: fontSizes.h1.sp,
            fontWeight: FontWeight.w800,
            color: Palette.BLACK),
        headline2: TextStyle(
            fontSize: fontSizes.h2.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline3: TextStyle(
            fontSize: fontSizes.h3.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline4: TextStyle(
            fontSize: fontSizes.h4.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline5: TextStyle(
            fontSize: fontSizes.h5.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        headline6: TextStyle(
            fontSize: fontSizes.h6.sp,
            fontWeight: FontWeight.w600,
            color: Palette.BLACK),
        bodyText1: TextStyle(
            fontSize: fontSizes.body1.sp,
            fontWeight: FontWeight.w400,
            color: Palette.BLACK),
        bodyText2: TextStyle(
            fontSize: fontSizes.body2.sp,
            fontWeight: FontWeight.w400,
            color: Palette.BLACK),
        subtitle1:
            TextStyle(fontSize: fontSizes.subTitle1.sp, color: Palette.BLACK),
        subtitle2:
            TextStyle(fontSize: fontSizes.subTitle2.sp, color: Palette.BLACK));
  }

  @override
  Typography? get typography => Typography.material2018();
}
