import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/provider/bottom_navigation_bar_provider.dart';

class AppBottomNavigationBar extends StatefulWidget {
  const AppBottomNavigationBar({super.key});

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    var pageIndex = context.watch<BottomNavigationBarProvider>();
    return SafeArea(
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: AppColor.backgroundNormal,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              enableFeedback: false,
              onPressed: () {
                  pageIndex.tabController.animateTo(0);
              },
              icon: pageIndex.pageIndex == 0
                  ?  AppIcon.postOn()
                  : AppIcon.postOff()
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                pageIndex.tabController.animateTo(1);
              },
              icon: pageIndex.pageIndex == 1
                  ?  AppIcon.homeOn()
                  : AppIcon.homeOff()
            ),
            IconButton(
              enableFeedback: false,
              onPressed: () {
                pageIndex.tabController.animateTo(2);
              },
              icon: pageIndex.pageIndex == 2
                  ?  AppIcon.settingOn()
                  : AppIcon.settingOff()
            ),
          ],
        ),
      ),
    );
  }
}
