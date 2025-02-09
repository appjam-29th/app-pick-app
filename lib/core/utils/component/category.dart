import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final String text;
  final bool isSelected;

  const Category({super.key, required this.text, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: isSelected
                      ? AppColor.secondaryNormal
                      : AppColor.labelAlternative,
                ),
                color: isSelected ? AppColor.primaryNormal : Colors.transparent,
              ),
              child: Text(
                text,
                style: AppTypography.labelMedium.copyWith(
                  color: isSelected ? Colors.white : AppColor.labelAlternative,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
