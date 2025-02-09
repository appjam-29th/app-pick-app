import 'package:appjam_29th/data/auth/auth_datasource.dart';
import 'package:appjam_29th/data/auth/auth_model.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  late final int _userId;

  TextEditingController get idController => _idController;

  TextEditingController get pwController => _pwController;

  int get userId => _userId;

  Future<bool> login() async {
    final response = await AuthDatasource().login(
      AuthModel(userID: _idController.text, password: _pwController.text),
    );
    if (response.id != null) {
      _userId = response.id!;
      return true;
    }
    return false;
  }

  Future<bool> signUp() async {
    final response = await AuthDatasource().signup(
      AuthModel(userID: _idController.text, password: _pwController.text),
    );
    if (response.id != null) {
      _userId = response.id!;
      return true;
    }
    return false;
  }
}
