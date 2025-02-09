import 'package:appjam_29th/core/utils/component/button.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/provider/match_provider.dart';
import 'package:appjam_29th/presentation/views/main/main_page.dart';
import 'package:appjam_29th/presentation/views/match/match_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/component/app_list.dart';
import '../../../core/utils/theme/color.dart';

class MatchResultPage extends StatelessWidget {
  MatchResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 106,
            ),
            Text(
              '이런 앱들은 어때요?',
              style: AppTypography.title2Bold,
            ),
            SizedBox(
              height: 42,
            ),
            Column(
              children: context.read<MatchProvider>().matchResponseModel.map(
                    (value) => AppList(
                        appName: value.appName,
                        appDescription: value.strength,
                        image: value.appIconUrl,
                        appUrl: value.appUrl),
                  ).toList(),
            ),
            SizedBox(
              height: 89,
            ),
            Row(
              spacing: 5,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '마음에 드는 앱이 없나요?',
                  style: AppTypography.headline2Medium.copyWith(
                    color: AppColor.common0,
                  ),
                ),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (builder) => MatchPage(),
                    ),
                  ),
                  child: Text(
                    '다시 선택하기',
                    style: AppTypography.headline2Medium.copyWith(
                      color: AppColor.secondaryNormal,
                    ),
                  ),
                ),
              ],
            ),
            Spacer(),
            AppButton(
                padding: EdgeInsets.symmetric(vertical: 15),
                onTap: () => Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (builder) => MainPage()),
                      (predicate) => false,
                    ),
                text: '홈으로 가기'),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    );
  }
}
