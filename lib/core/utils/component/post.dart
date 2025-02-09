import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/data/post/create/post_create_model.dart';
import 'package:appjam_29th/presentation/views/post/post_detail_page.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final String title;
  final String tag;
  final int index;
  final ReviewResponseModel responseModel;

  const Post({
    super.key,
    required this.title,
    required this.tag,
    required this.index,
    required this.responseModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => PostDetailPage(
                title: title,
                category1: responseModel.mainCategory,
                category2: responseModel.criteria,
                content: responseModel.content,
                star: responseModel.star),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(color: AppColor.labelDisable),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(
              title,
              style: AppTypography.headline2Medium,
            ),
            Text(
              tag,
              style: AppTypography.labelRegular,
            )
          ],
        ),
      ),
    );
  }
}
