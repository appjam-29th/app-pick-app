import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher_string.dart';

class AppList extends StatelessWidget {
  final String appName;
  final String appDescription;
  final String image;
  final String appUrl;

  const AppList({
    super.key,
    required this.appName,
    required this.appDescription,
    required this.image,
    required this.appUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        height: 69,
        child: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColor.lineNormal,
              ),
              child: Image.network(image),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: SizedBox(
                          width: 180,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                appName,
                                style: AppTypography.bodyMedium,
                              ),
                              const SizedBox(height: 5),
                              SizedBox(
                                width: 180,
                                child: Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  appDescription,
                                  style: AppTypography.captionMedium.copyWith(
                                    color: AppColor.labelAlternative,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 17),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.fillAlternative,
                          ),
                          child: Material(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColor.fillAlternative,
                            child: InkWell(
                              onTap: () async => await launchUrlString(appUrl),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 6),
                                child: Text(
                                  '이동하기',
                                  style: AppTypography.captionBold.copyWith(
                                    color: AppColor.secondaryNormal,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: AppColor.fillAlternative,
                    height: 0,
                    thickness: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
