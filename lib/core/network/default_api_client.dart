import 'package:dio/dio.dart';

class DefaultApiClient {
  static Dio dio = Dio(BaseOptions(baseUrl: 'http://172.16.1.54:8081'));
}
