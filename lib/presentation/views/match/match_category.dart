import 'package:appjam_29th/core/utils/component/category.dart';
import 'package:appjam_29th/presentation/views/match/match_category2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/utils/component/back_button_appbar.dart';
import '../../../core/utils/component/button.dart';
import '../../../core/utils/theme/color.dart';
import '../../../core/utils/theme/typography.dart';
import '../../provider/match_provider.dart';
import 'match_old_page.dart';

class MatchCategory extends StatelessWidget {
  MatchCategory({super.key});

  final List<String> _categoryList = [
    '홈',
    '쇼핑',
    '뉴스',
    '교육',
    '금융',
    '음악',
    '날씨',
    '여행',
    '도서',
    '생산성',
    '디자인',
    '사운드',
    '스포츠',
    '비즈니스',
    '유틸리티',
    '개발자 도구',
    '라이프스타일',
    '건강 및 피트니스',
    '소셜 네트워크',
    '사진 및 비디오',
    '위치 기반 서비스',
    '뉴스 및 잡지',
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
                  const Text('어떤 앱 종류를 원하시나요?',
                      style: AppTypography.title1Bold),
                  const SizedBox(height: 32),
                  Text(
                    '${matchProvider.getCategory.length}/3',
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
                          matchProvider.getCategory.contains(category);
                      return GestureDetector(
                        onTap: () => matchProvider.toggleCategory(category),
                        child: Category(text: category, isSelected: isSelected),
                      );
                    }).toList(),
                  ),
                  const Spacer(),
                  AppButton(
                    onTap: matchProvider.getCategory.isNotEmpty
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (builder) => MatchCategory2()),
                            );
                          }
                        : () {},
                    text: '다음',
                    color: matchProvider.getCategory.isNotEmpty
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
