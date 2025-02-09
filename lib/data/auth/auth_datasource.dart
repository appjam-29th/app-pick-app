import 'dart:convert';

import 'package:appjam_29th/core/network/default_api_client.dart';
import 'package:appjam_29th/data/auth/auth_model.dart';
import 'package:dio/dio.dart';

class AuthDatasource {
  Dio dio = DefaultApiClient.dio;

  Future<AuthModel> signup(AuthModel authModel) async {
    final response = await dio.post(
      '/api/register',
      data: authModel.toJson(),
    );
    print(response.data['id']);
    return AuthModel.fromJson(response.data);
  }

  Future<AuthModel> login(AuthModel authModel) async {
    final response = await dio.post(
      '/api/login',
      data: jsonEncode(
        authModel.toJson(),
      ),
    );
    print(response.data['id']);
    return AuthModel.fromJson(response.data);
  }
}
