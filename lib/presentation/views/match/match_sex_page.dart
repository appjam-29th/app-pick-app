import 'package:appjam_29th/core/utils/component/back_button_appbar.dart';
import 'package:appjam_29th/core/utils/component/button.dart';
import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/views/match/match_old_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/match_provider.dart';

class MatchSexPage extends StatelessWidget {
  const MatchSexPage({super.key});

  @override
  Widget build(BuildContext context) {
    var matchProvider = context.watch<MatchProvider>();
    return Scaffold(
      body: Stack(
        children: [
          BackButtonAppbar(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 136,
                  ),
                  Text(
                    '성별',
                    style: AppTypography.title1Bold,
                  ),
                  SizedBox(height: 32),
                  Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () => matchProvider.setSex('남성'),
                          child: Container(
                            height: 191,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColor.labelAssistive,
                              ),
                            ),
                            child: Column(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  spacing: 10,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '남성',
                                      style: AppTypography.headline2Medium,
                                    ),
                                    matchProvider.getSex == '남성'
                                        ? AppIcon.check()
                                        : SizedBox(),
                                  ],
                                ),
                                matchProvider.getSex == null
                                    ? AppIcon.man()
                                    : matchProvider.getSex == '남성'
                                        ? AppIcon.manOn()
                                        : AppIcon.manOff()
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () => matchProvider.setSex('여성'),
                          // Add this line for setting female
                          child: Container(
                            height: 191,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: AppColor.labelAssistive,
                              ),
                            ),
                            child: Column(
                              spacing: 5,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  spacing: 10,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      '여성',
                                      style: AppTypography.headline2Medium,
                                    ),
                                    matchProvider.getSex == '여성'
                                        ? AppIcon.check()
                                        : SizedBox(),
                                  ],
                                ),
                                matchProvider.getSex == null
                                    ? AppIcon.woman() // Default icon
                                    : matchProvider.getSex == '여성'
                                        ? AppIcon.womanOn() // Selected icon
                                        : AppIcon.womanOff()
                                // Icon when not selected
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Spacer(),
                  AppButton(
                    onTap: matchProvider.getSex != null
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (builder) => MatchOldPage(),
                              ),
                            );
                          }
                        : () {},
                    // Only enable if sex is selected
                    text: '다음',
                    color: matchProvider.getSex != null
                        ? AppColor.secondaryNormal
                        : AppColor.secondaryAlternative,
                  ),
                  SizedBox(
                    height: 40,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
