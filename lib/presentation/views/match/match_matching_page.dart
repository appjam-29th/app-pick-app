import 'package:appjam_29th/core/utils/theme/icon.dart';
import 'package:appjam_29th/presentation/provider/match_provider.dart';
import 'package:appjam_29th/presentation/views/match/match_result_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/theme/typography.dart';

class MatchMatchingPage extends StatefulWidget {
  const MatchMatchingPage({super.key});

  @override
  State<MatchMatchingPage> createState() => _MatchMatchingPageState();
}

class _MatchMatchingPageState extends State<MatchMatchingPage> {
  bool isLoading = true; // Add a loading state

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await context.read<MatchProvider>().getRecommendations();
    setState(() {
      isLoading = false; // Update loading state when recommendations are fetched
    });

    // Navigate after the loading is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => MatchResultPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: isLoading
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppIcon.think(),
            SizedBox(height: 10),
            Text(
              '요구에 맞는 앱을\n찾는 중이에요...',
              textAlign: TextAlign.center,
              style: AppTypography.title1Bold,
            ),
          ],
        )
            : CircularProgressIndicator(), // Show a loading indicator while waiting
      ),
    );
  }
}