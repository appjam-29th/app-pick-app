import 'package:appjam_29th/core/utils/component/bottom_navigation_bar.dart';
import 'package:appjam_29th/presentation/provider/bottom_navigation_bar_provider.dart';
import 'package:appjam_29th/presentation/provider/post_provider.dart';
import 'package:appjam_29th/presentation/views/main/home_page.dart';
import 'package:appjam_29th/presentation/views/post/post_page.dart';
import 'package:appjam_29th/presentation/views/main/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _pages = [
    PostPage(),
    HomePage(),
    SettingPage(),
  ];

  @override
  void initState() {
    super.initState();
    context
        .read<BottomNavigationBarProvider>()
        .tabController
        .addListener(listener);
    context.read<PostProvider>().getPost();
  }

  @override
  void dispose() {
    context
        .read<BottomNavigationBarProvider>()
        .tabController
        .removeListener(listener);
    super.dispose();
  }

  void listener() {
    context.read<BottomNavigationBarProvider>().setPageIndex(
        context.read<BottomNavigationBarProvider>().tabController);
  }

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<BottomNavigationBarProvider>();
    return Scaffold(
      body: TabBarView(
        controller: provider.tabController,
        children: _pages,
      ),
      bottomNavigationBar: AppBottomNavigationBar(),
    );
  }
}
