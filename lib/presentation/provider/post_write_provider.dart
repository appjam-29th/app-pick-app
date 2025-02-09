import 'package:appjam_29th/data/post/create/post_create_datasources.dart';
import 'package:appjam_29th/data/post/create/post_create_model.dart';
import 'package:flutter/cupertino.dart';

class PostWriteProvider extends ChangeNotifier {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  int _star = 0;
  final List<String> _category = [];
  final List<String> _category2 = [];

  TextEditingController get titleController => _titleController;

  TextEditingController get contentController => _contentController;

  int get star => _star;

  List<String> get getCategory => _category;

  List<String> get getCategory2 => _category2;

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

  void setStar(int star) {
    _star = star;
    notifyListeners();
  }

  void postWrite(int id) async {
    final response = PostCreateDatasources().upload(
      ReviewRequestModel(
          userID: id.toString(),
          title: _titleController.text,
          mainCategory: _category,
          criteria: _category2,
          star: star,
          content: _contentController.text),
    );
  }
}
