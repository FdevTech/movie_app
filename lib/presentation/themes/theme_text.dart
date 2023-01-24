import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/common/constants/size_contants.dart';
import 'package:movie_app/presentation/themes/app_colors.dart';

class ThemeText {
  const ThemeText._();

  static TextTheme get _poppinsTextTheme => GoogleFonts.poppinsTextTheme();

  static TextStyle get _whiteHeadline6 => _poppinsTextTheme.headline6!.copyWith(
    fontSize: 20,
    color: Colors.white);

  static TextStyle get whiteSubtitle => _poppinsTextTheme.subtitle1!.copyWith(
    fontSize: Sizes.dimen_16.sp,
    color: Colors.white
  );

  static TextStyle get whiteBodyText2 => _poppinsTextTheme.bodyText2!.copyWith(
    color: Colors.white,
    fontSize: Sizes.dimen_14.sp,
    wordSpacing: 0.25,
    letterSpacing: 0.25,
    height: 1.5
  );

  static TextStyle get whiteHeadline5 => _poppinsTextTheme.headline5!.copyWith(
      fontSize: Sizes.dimen_16.sp,
      color: Colors.white
  );

  static TextStyle get _whiteButton => _poppinsTextTheme.button!.copyWith(
    fontSize: Sizes.dimen_16.sp,
    color: Colors.white
  );

  static getTextTheme() => TextTheme(
    headline6: _whiteHeadline6,
    subtitle1: whiteSubtitle,
    subtitle2: whiteBodyText2,
    headline5:whiteHeadline5,
    button: _whiteButton
  );
}

extension ThemeTextExtension on TextTheme {
  TextStyle get royalBlueSubtitle2 => subtitle1!.copyWith(
    color: AppColor.royalBlue,
    fontWeight: FontWeight.w600
  );

  TextStyle get whiteBodyText2 => bodyText2!.copyWith(
      color: Colors.white,
      fontSize: Sizes.dimen_14.sp,
      wordSpacing: 0.25,
      letterSpacing: 0.25,
      height: 1.5
  );

  TextStyle get greySubtitle1 => subtitle1!.copyWith(
    color: Colors.grey
  );
  TextStyle get violetHeadline6 => headline6!.copyWith(
    color: AppColor.violet
  );
}