import 'package:flutter/material.dart';

class BottomNavigationBarProvider extends ChangeNotifier {
  int _pageIndex = 1;
  late final TabController? _tabController;

  BottomNavigationBarProvider({
    required TabController tabController,
  }) : _tabController = tabController;

  int get pageIndex => _pageIndex;

  TabController get tabController => _tabController!;

  void setPageIndex(TabController controller) {
    _pageIndex = controller.index;
    notifyListeners();
  }
}
