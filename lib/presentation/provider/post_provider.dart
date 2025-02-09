import 'package:appjam_29th/data/post/create/post_create_datasources.dart';
import 'package:appjam_29th/data/post/create/post_create_model.dart';
import 'package:appjam_29th/data/post/filter/post_filter_datasource.dart';
import 'package:flutter/material.dart';

class PostProvider extends ChangeNotifier {
  final List<String> _category = [];
  final List<String> _category2 = [];
  late List<ReviewResponseModel> _postResponseModel = [];

  List<String> get getCategory => _category;

  List<String> get getCategory2 => _category2;

  List<ReviewResponseModel> get postResponseModel => _postResponseModel;

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

  void getPost() async {
    final response = await PostCreateDatasources().fetchReview();
    _postResponseModel = response;
    notifyListeners();
  }

  void getPostFilter() async {
    final response = await PostFilterDatasource()
        .fetchFilteredReviews(_category, _category2);
    _postResponseModel = response.cast<ReviewResponseModel>();
    notifyListeners();
  }

  Future<ReviewResponseModel> getPostId(int id) async {
    final response = await PostCreateDatasources().fetchReviewById(id);
    return response;
  }
}
