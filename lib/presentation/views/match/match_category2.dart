import 'package:appjam_29th/presentation/views/match/match_matching_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/component/back_button_appbar.dart';
import '../../../core/utils/component/button.dart';
import '../../../core/utils/component/category.dart';
import '../../../core/utils/theme/color.dart';
import '../../../core/utils/theme/typography.dart';
import '../../provider/match_provider.dart';

class MatchCategory2 extends StatelessWidget {
   MatchCategory2({super.key});

  final List<String> _categoryList = [
    '감성',
    '재미',
    '편리함',
    '효율성',
    '사회적 가치',
    '보안 및 신뢰',
    '맞춤형',
    '심플',
    '빠른 진행',
    '낮은 접근성',
  ];

  @override
  Widget build(BuildContext context) {
    var matchProvider = context.watch<MatchProvider>();
    return Scaffold(
      body: Stack(
        children: [
          const BackButtonAppbar(),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 136),
                  const Text('앱을 사용할때 중요한것은?', style: AppTypography.title1Bold),
                  const SizedBox(height: 32),
                  Text(
                    '${matchProvider.getCategory2.length}/3',
                    style: AppTypography.bodyBold
                        .copyWith(color: AppColor.labelAlternative),
                  ),
                  const SizedBox(height: 32),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    alignment: WrapAlignment.center,
                    children: _categoryList.map((category) {
                      bool isSelected =
                          matchProvider.getCategory2.contains(category);
                      return GestureDetector(
                        onTap: () => matchProvider.toggleCategory2(category),
                        child: Category(text: category, isSelected: isSelected),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  AppButton(
                    onTap: matchProvider.getCategory2.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MatchMatchingPage()),
                            );
                          }
                        : () {},
                    text: '다음',
                    color: matchProvider.getCategory2.isNotEmpty
                        ? AppColor.secondaryNormal
                        : AppColor.secondaryAlternative,
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
