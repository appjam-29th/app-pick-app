import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/core/utils/theme/typography.dart';
import 'package:appjam_29th/presentation/views/match/match_sex_page.dart';
import 'package:flutter/material.dart';

class MatchPage extends StatefulWidget {
  const MatchPage({super.key});

  @override
  State<MatchPage> createState() => _MatchPageState();
}

class _MatchPageState extends State<MatchPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (builder) => MatchSexPage(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          spacing: 10,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon.smile(),
            Text(
              '원하는 앱을 찾기 위해\n정보가 필요해요!',
              textAlign: TextAlign.center,
              style: AppTypography.title1Bold,
            )
          ],
        ),
      ),
    );
  }
}
