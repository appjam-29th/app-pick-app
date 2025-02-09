import 'package:appjam_29th/core/utils/component/button.dart';
import 'package:appjam_29th/core/utils/component/post.dart';
import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/provider/post_provider.dart';
import 'package:appjam_29th/presentation/views/post/post_write_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/component/category.dart';

class PostPage extends StatelessWidget {
  PostPage({super.key});

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
  final List<String> _categoryLis2 = [
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
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '최근 등록된 게시물',
                      style: AppTypography.headline1Medium,
                    ),
                    GestureDetector(
                      onTap: () => showModalBottomSheet(
                        context: context,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20)),
                        ),
                        builder: (context) {
                          return Consumer<PostProvider>(
                            builder: (context, postProvider, child) {
                              return Container(
                                decoration: BoxDecoration(
                                  color: AppColor.backgroundNormal,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                padding: EdgeInsets.all(20),
                                height: 560,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    SingleChildScrollView(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        spacing: 20,
                                        children: [
                                          Center(
                                            child: Text('검색 설정',
                                                style: AppTypography
                                                    .headline1Bold),
                                          ),
                                          Column(
                                            spacing: 10,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '주요 카테고리',
                                                style: AppTypography
                                                    .headline1Medium,
                                              ),
                                              Text(
                                                  '${postProvider.getCategory.length}/3'),
                                              Wrap(
                                                spacing: 10,
                                                runSpacing: 10,
                                                alignment: WrapAlignment.center,
                                                children: _categoryList
                                                    .map((category) {
                                                  bool isSelected = postProvider
                                                      .getCategory
                                                      .contains(category);
                                                  return GestureDetector(
                                                    onTap: () => postProvider
                                                        .toggleCategory(
                                                            category),
                                                    child: Category(
                                                        text: category,
                                                        isSelected: isSelected),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                          Column(
                                            spacing: 10,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                '선택 기준 ',
                                                style: AppTypography
                                                    .headline1Medium,
                                              ),
                                              Text(
                                                  '${postProvider.getCategory2.length}/3'),
                                              Wrap(
                                                spacing: 10,
                                                runSpacing: 10,
                                                alignment: WrapAlignment.start,
                                                children: _categoryLis2
                                                    .map((category) {
                                                  bool isSelected = postProvider
                                                      .getCategory2
                                                      .contains(category);
                                                  return GestureDetector(
                                                    onTap: () => postProvider
                                                        .toggleCategory2(
                                                            category),
                                                    child: Category(
                                                        text: category,
                                                        isSelected: isSelected),
                                                  );
                                                }).toList(),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 100)
                                        ],
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Spacer(),
                                        AppButton(
                                          onTap: () {},
                                          text: '적용하기',
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 71.75, vertical: 16),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Color(0xffe5e5e5),
                          ),
                        ),
                        child: AppIcon.slider(),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: context
                      .read<PostProvider>()
                      .postResponseModel
                      .map(
                        (value) => Post(
                          title: value.title,
                          tag: '${value.mainCategory} • ${value.criteria}',
                          index: value.id,
                          responseModel: value,
                        ),
                      )
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => PostWritePage(),
          ),
        ),
        child: Container(
          alignment: Alignment.center,
          height: 90,
          width: 90,
          decoration: BoxDecoration(
            color: AppColor.secondaryNormal,
            shape: BoxShape.circle,
          ),
          child: Text(
            '게시물\n등록',
            textAlign: TextAlign.center,
            style: AppTypography.headline2Medium.copyWith(
              color: AppColor.common100,
            ),
          ),
        ),
      ),
    );
  }
}
