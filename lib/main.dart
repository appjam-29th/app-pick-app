import 'package:appjam_29th/core/utils/theme/color.dart';
import 'package:appjam_29th/presentation/provider/auth_provider.dart';
import 'package:appjam_29th/presentation/provider/bottom_navigation_bar_provider.dart';
import 'package:appjam_29th/presentation/provider/match_provider.dart';
import 'package:appjam_29th/presentation/provider/post_provider.dart';
import 'package:appjam_29th/presentation/provider/post_write_provider.dart';
import 'package:appjam_29th/presentation/views/main/main_page.dart';
import 'package:appjam_29th/presentation/views/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => BottomNavigationBarProvider(
            tabController: TabController(
              initialIndex: 1,
              length: 3,
              vsync: this,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (create) => MatchProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => PostProvider(),
        ),
        ChangeNotifierProvider(
          create: (create) => PostWriteProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: AppColor.backgroundNormal,
          ),
          scaffoldBackgroundColor: AppColor.backgroundNormal,
        ),
        home:  SplashPage(),
      ),
    );
  }
}
