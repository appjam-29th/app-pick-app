import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:flutter/material.dart';

class BackButtonAppbar extends StatelessWidget {
  final VoidCallback? onTap;

  const BackButtonAppbar({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 48, 0, 0),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap ?? () => Navigator.pop(context),
        child: AppIcon.backButton(),
      ),
    );
  }
}
