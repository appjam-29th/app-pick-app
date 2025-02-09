import 'package:appjam_29th/core/utils/component/back_button_appbar.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/theme/color.dart';

class PostDetailPage extends StatelessWidget {
  final String title;
  final String category1;
  final String category2;
  final String content;
  final int star;

  const PostDetailPage({
    super.key,
    required this.title,
    required this.category1,
    required this.category2,
    required this.content,
    required this.star,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackButtonAppbar(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 104,
                ),
                Column(
                  children: [
                    Text(
                      title,
                      style: AppTypography.headline2Bold,
                    ),
                    SizedBox(height: 10),
                    Text('$category1 • $category2'),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: List.generate(
                          5,
                          (index) {
                            return Icon(
                              star > index
                                  ? Icons.star
                                  : Icons.star_border, // 선택된 별과 선택되지 않은 별 구분
                              color: AppColor.secondaryNormal,
                              size: 35,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '내용',
                  style: AppTypography.labelBold,
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: AppColor.fillAlternative,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    content,
                    style: AppTypography.labelMedium,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
