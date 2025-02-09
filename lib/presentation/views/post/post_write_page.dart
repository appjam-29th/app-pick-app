import 'package:appjam_29th/core/utils/component/back_button_appbar.dart';
import 'package:appjam_29th/core/utils/component/button.dart';
import 'package:appjam_29th/core/utils/component/textfield.dart';
import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/provider/auth_provider.dart';
import 'package:appjam_29th/presentation/provider/post_write_provider.dart';
import 'package:appjam_29th/presentation/views/main/main_page.dart';
import 'package:appjam_29th/presentation/views/post/post_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/component/category.dart';
import '../../provider/post_provider.dart';

class PostWritePage extends StatelessWidget {
  PostWritePage({super.key});

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
    '유용성',
  ];

  @override
  Widget build(BuildContext context) {
    var postWriteProvider = context.watch<PostWriteProvider>();
    return Scaffold(
      body: Stack(
        children: [
          BackButtonAppbar(),
          SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 30,
                children: [
                  SizedBox(
                    height: 78,
                  ),
                  Center(
                    child: Text(
                      '게시물 등록하기',
                      style: AppTypography.headline2Bold,
                    ),
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '제목',
                        style: AppTypography.labelBold,
                      ),
                      AppTextField(
                        padding: EdgeInsets.zero,
                        textFieldState: AppTextFieldState.basic,
                        controller: postWriteProvider.titleController,
                        hintText: '제목을 입력해주세요',
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '주요 카테고리',
                        style: AppTypography.labelBold,
                      ),
                      Text(
                        '${postWriteProvider.getCategory.length}/3',
                        style: AppTypography.labelMedium
                            .copyWith(color: AppColor.labelAlternative),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 10,
                          children: _categoryList.map((category) {
                            bool isSelected = postWriteProvider.getCategory
                                .contains(category);
                            return GestureDetector(
                              onTap: () =>
                                  postWriteProvider.toggleCategory(category),
                              child: Category(
                                  text: category, isSelected: isSelected),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '선택 기준',
                        style: AppTypography.labelBold,
                      ),
                      Text(
                        '${postWriteProvider.getCategory2.length}/3',
                        style: AppTypography.labelMedium
                            .copyWith(color: AppColor.labelAlternative),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Wrap(
                          spacing: 10,
                          children: _categoryLis2.map((category) {
                            bool isSelected = postWriteProvider.getCategory2
                                .contains(category);
                            return GestureDetector(
                              onTap: () =>
                                  postWriteProvider.toggleCategory2(category),
                              child: Category(
                                  text: category, isSelected: isSelected),
                            );
                          }).toList(),
                        ),
                      )
                    ],
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '별점',
                        style: AppTypography.labelBold,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(5, (index) {
                          return GestureDetector(
                            onTap: () {
                              postWriteProvider.setStar(index + 1);
                            },
                            child: Icon(
                              postWriteProvider.star > index
                                  ? Icons.star
                                  : Icons.star_border, // 선택된 별과 선택되지 않은 별 구분
                              color: AppColor.secondaryNormal,
                              size: 40,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                  Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '내용',
                        style: AppTypography.labelBold,
                      ),
                      AppTextField(
                        minLine: 10,
                        padding: EdgeInsets.zero,
                        textFieldState: AppTextFieldState.basic,
                        controller: postWriteProvider.contentController,
                        hintText: '내용을 입력해주세요',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: [
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: AppButton(
                  onTap: () {
                    showDialog(
                      barrierColor: Color(0xffd9d9d9).withOpacity(0.7),
                      context: context,
                      builder: (BuildContext context) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 30),
                          margin: EdgeInsets.symmetric(
                              horizontal: 79, vertical: 300),
                          decoration: BoxDecoration(
                            color: AppColor.backgroundNormal,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            spacing: 20,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '게시글을 등록하시겠습니까?',
                                style: AppTypography.bodyBold.copyWith(
                                  color: AppColor.common0,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                              AppButton(
                                  onTap: () async {
                                    context.read<PostWriteProvider>().postWrite(
                                        await context.read<AuthProvider>().userId);
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (builder) => MainPage()),
                                      (predicate) => false,
                                    );
                                    context.read<PostProvider>().getPost();
                                  },
                                  text: '예')
                            ],
                          ),
                        );
                      },
                    );
                  },
                  text: '등록하기',
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
              ),
              SizedBox(
                height: 33,
              ),
            ],
          )
        ],
      ),
    );
  }
}
