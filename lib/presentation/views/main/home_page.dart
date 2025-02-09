import 'dart:async';

import 'package:appjam_29th/core/utils/component/app_list.dart';
import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/views/match/match_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> imageUrls = [
    'assets/image/main1.png',
    'assets/image/main2.png',
    'assets/image/main3.png',
  ];
  int _currentIndex = 0;
  double _opacity = 1.0;

  @override
  void initState() {
    super.initState();
    Timer.periodic(Duration(seconds: 5), (timer) {
      setState(() {
        _opacity = 0.0; // 먼저 투명하게 만든 후 변경
      });

      Future.delayed(Duration(milliseconds: 500), () {
        setState(() {
          _currentIndex = (_currentIndex + 1) % imageUrls.length;
          _opacity = 1.0; // 다시 나타나게 만듦
        });
      });
    });
  }

  List<AppList> app = [
    AppList(
      appName: '배틀그라운드',
      appUrl:
          'https://apps.apple.com/kr/app/%EB%B0%B0%ED%8B%80%EA%B7%B8%EB%9D%BC%EC%9A%B4%EB%93%9C/id1366526331?uo=4',
      image:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/4f/8d/38/4f8d3800-68b5-1c53-b0f7-7d46bda6a394/AppIcon-0-0-1x_U007emarketing-0-7-0-85-220.png/512x512bb.jpg',
      appDescription: '현실적인 그래픽과 다양한 모드로 즐길 수 있는 전략적인 배틀로얄 게임',
    ),
    AppList(
      appName: '배달의민족 - 무료배달 배민클럽',
      appUrl:
          'https://apps.apple.com/kr/app/%EB%B0%B0%EB%8B%AC%EC%9D%98%EB%AF%BC%EC%A1%B1-%EB%AC%B4%EB%A3%8C%EB%B0%B0%EB%8B%AC-%EB%B0%B0%EB%AF%BC%ED%81%B4%EB%9F%BD/id378084485?uo=4',
      image:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/6e/05/82/6e058226-0610-ca51-ec65-6b35fc0ec7f2/AppIcon2015-0-0-1x_U007emarketing-0-5-0-85-220.png/512x512bb.jpg',
      appDescription: '편리한 주문 서비스와 다양한 메뉴 선택',
    ),
    AppList(
      appName: '쿠팡 (Coupang)',
      appUrl:
          'https://apps.apple.com/kr/app/%EC%BF%A0%ED%8C%A1-coupang/id454434967?uo=4',
      image:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/0a/eb/59/0aeb5960-5adb-de63-9c3a-35983e3734b7/AppIcon-0-0-1x_U007emarketing-0-10-0-85-220.png/512x512bb.jpg',
      appDescription: '다양한 상품과 빠른 배송 서비스',
    ),
    AppList(
      appName: 'Coursera: 경력 성장',
      appUrl:
          'https://apps.apple.com/kr/app/coursera-%EA%B2%BD%EB%A0%A5-%EC%84%B1%EC%9E%A5/id736535961?uo=4',
      image:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple211/v4/9f/13/88/9f13882d-fdf3-de19-66f1-4f765ece8167/AppIcon-0-1x_U007epad-0-1-0-0-85-220-0.png/512x512bb.jpg',
      appDescription: '전세계 명품 대학의 강의를 온라인에서 접할 수 있는 교육 플랫폼',
    ),
    AppList(
      appName: '빙글 - 빈티지 보물찾기',
      appUrl:
          'https://apps.apple.com/kr/app/%EB%B9%99%EA%B8%80-%EB%B9%88%ED%8B%B0%EC%A7%80-%EB%B3%B4%EB%AC%BC%EC%B0%BE%EA%B8%B0/id6503185186?uo=4',
      image:
          'https://is1-ssl.mzstatic.com/image/thumb/Purple221/v4/28/24/e1/2824e111-74d5-1771-97a0-d1397b1bb787/AppIcon-0-0-1x_U007emarketing-0-5-0-85-220.png/512x512bb.jpg',
      appDescription: '다양한 관심사를 공유하고 소통할 수 있는 커뮤니티',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 78),
          child: Column(
            spacing: 20,
            children: [
              GestureDetector(
                onTap: () => Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (builder) => MatchPage(),
                  ),
                  (_) => false,
                ),
                child: Container(
                  alignment: Alignment.topCenter,
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                  decoration: BoxDecoration(
                    color: AppColor.secondaryNormal,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      AnimatedOpacity(
                        duration: Duration(milliseconds: 500),
                        opacity: _opacity,
                        child: Image.asset(
                          imageUrls[_currentIndex],
                        ),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => MatchPage(),
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(),
                          height: 53,
                          width: double.infinity,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              '앱 찾으로 가기',
                              style: AppTypography.headline2Bold.copyWith(
                                color: AppColor.common100,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Row(
                          spacing: 5,
                          children: [
                            Text(
                              '이런 앱은 어때요?',
                              style: AppTypography.headline2Bold,
                            ),
                            AppIcon.arrowRight()
                          ],
                        ),
                      ),
                    ),
                    for (int i = 0; i < 3; i++) app[i]
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(),
                        child: Text(
                          'ChillGuy들이 사용하는 앱',
                          style: AppTypography.headline2Bold,
                        ),
                      ),
                    ),
                    for (int i = 3; i < 5; i++) app[i]
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
