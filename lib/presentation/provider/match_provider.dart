import 'package:appjam_29th/data/match/match_datasource.dart';
import 'package:appjam_29th/data/match/match_model.dart';
import 'package:flutter/material.dart';

class MatchProvider extends ChangeNotifier {
  String? _sex;
  int? _old; // Change _old to int
  final List<String> _category = [];
  final List<String> _category2 = [];
  late List<MatchResponseModel> _matchResponseModel = [];

  String? get getSex => _sex;

  int? get getOld => _old; // Getter should return int

  List<String> get getCategory => _category;

  List<String> get getCategory2 => _category2;

  List<MatchResponseModel> get matchResponseModel => _matchResponseModel;

  void setSex(String sex) {
    _sex = sex;
    notifyListeners();
  }

  void setOld(int old) { // Update to accept an int
    _old = old;
    notifyListeners();
  }

  void toggleCategory(String category) {
    if (_category.contains(category)) {
      _category.remove(category); // 이미 선택된 항목이면 삭제
    } else {
      if (_category.length >= 3) return; // 3개 이상이면 추가 방지
      _category.add(category); // 새로운 항목 추가
    }
    notifyListeners();
  }

  void toggleCategory2(String category) {
    if (_category2.contains(category)) {
      _category2.remove(category);
    } else {
      if (_category2.length >= 3) return; // 3개 이상이면 추가 방지
      _category2.add(category); // 새로운 항목 추가
    }
    notifyListeners();
  }

  Future<void> getRecommendations() async {
    final List<MatchResponseModel> response =
    await MatchDataSource().getRecommendations(
      MatchRequestModel(
          category: _category,
          gender: _sex!,
          ageGroup: _old!, // Pass _old as int
          values: _category2),
    );
    _matchResponseModel = response;
    notifyListeners();
  }
}