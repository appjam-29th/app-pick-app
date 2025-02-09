import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppIcon {
  const AppIcon();

  static SvgPicture logo({double width = 72,
    double height = 52,
    Color color = AppColor.secondaryNormal}) =>
      SvgPicture.asset(
        'assets/image/logo.svg',
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      );

  static SvgPicture backButton({double width = 32,
    double height = 32,
    Color color = AppColor.common0}) =>
      SvgPicture.asset(
        'assets/image/back_button.svg',
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      );

  static Image main1() =>
      Image.asset(
        'assets/image/main1.png',
      );

  static SvgPicture arrowRight({double width = 15,
    double height = 30,
    Color color = AppColor.common0}) =>
      SvgPicture.asset(
        'assets/image/arrow_right.svg',
        width: width,
        height: height,
        colorFilter: ColorFilter.mode(
          color,
          BlendMode.srcIn,
        ),
      );

  static SvgPicture homeOff({
    double width = 60,
    double height = 60,
  }) =>
      SvgPicture.asset(
        'assets/image/home-off.svg',
        width: width,
        height: height,
      );

  static SvgPicture postOff({
    double width = 60,
    double height = 60,
  }) =>
      SvgPicture.asset(
        'assets/image/post-off.svg',
        width: width,
        height: height,
      );

  static SvgPicture settingOff({double width = 60, double height = 60}) =>
      SvgPicture.asset(
        'assets/image/setting-off.svg',
        width: width,
        height: height,
      );

  static SvgPicture homeOn({
    double width = 60,
    double height = 60,
  }) =>
      SvgPicture.asset(
        'assets/image/home-on.svg',
        width: width,
        height: height,
      );

  static SvgPicture postOn({
    double width = 60,
    double height = 60,
  }) =>
      SvgPicture.asset(
        'assets/image/post-on.svg',
        width: width,
        height: height,
      );

  static SvgPicture settingOn({
    double width = 60,
    double height = 60,
  }) =>
      SvgPicture.asset(
        'assets/image/setting-on.svg',
        width: width,
        height: height,
      );

  static Image smile({
    double width = 100,
    double height = 100,
  }) =>
      Image.asset(
        'assets/image/smile.png',
        width: width,
        height: height,
      );

  static Image woman({
    double width = 70,
    double height = 91,
  }) =>
      Image.asset(
        'assets/image/woman.png',
        width: width,
        height: height,
      );

  static Image womanOff({
    double width = 70,
    double height = 91,
  }) =>
      Image.asset(
        'assets/image/woman-off.png',
        width: width,
        height: height,
      );

  static Image womanOn({
    double width = 70,
    double height = 91,
  }) =>
      Image.asset(
        'assets/image/woman-on.png',
        width: width,
        height: height,
      );

  static Image man({
    double width = 70,
    double height = 91,
  }) =>
      Image.asset(
        'assets/image/man.png',
        width: width,
        height: height,
      );

  static Image manOff({
    double width = 70,
    double height = 91,
  }) =>
      Image.asset(
        'assets/image/man-off.png',
        width: width,
        height: height,
      );

  static Image manOn({
    double width = 70,
    double height = 91,
  }) =>
      Image.asset(
        'assets/image/man-on.png',
        width: width,
        height: height,
      );

  static Image check({
    double width = 16,
    double height = 16,
  }) =>
      Image.asset(
        'assets/image/check.png',
        width: width,
        height: height,
      );

  static Image think({
    double width = 100,
    double height = 100,
  }) =>
      Image.asset(
        'assets/image/think.png',
        width: width,
        height: height,
      );

  static Image slider({ double width = 20,
    double height = 20,}) =>  Image.asset(
    'assets/image/slider.png',
    width: width,
    height: height,
  );
}
