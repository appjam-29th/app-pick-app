import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import '../theme/color.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final double width;
  final EdgeInsetsGeometry padding;
  final Color color;
  final BorderRadius borderRadius;
  final TextStyle textStyle;
  final Color textColor;

  const AppButton({
    super.key,
    required this.onTap,
    required this.text,
    this.width = double.infinity,
    this.padding = const EdgeInsets.symmetric(
      vertical: 10,
    ),
    this.color = AppColor.secondaryNormal,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(20),
    ),
    this.textStyle = AppTypography.headline2Bold,
    this.textColor = AppColor.common100,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: padding,
        alignment: Alignment.center,
        width: width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: borderRadius,
        ),
        child: Text(
          text,
          style: textStyle.copyWith(
            color: textColor,
            decoration: TextDecoration.none
          ),
        ),
      ),
    );
  }
}
