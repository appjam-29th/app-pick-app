import 'package:dio/dio.dart';
import '../../core/network/default_api_client.dart';
import 'match_model.dart';

class MatchDataSource {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'http://172.16.1.54:8000',
      followRedirects: false, // We will manually handle redirects
      validateStatus: (status) {
        return status != null && status < 400; // Treat redirects as valid
      },
    ),
  );

  Future<List<MatchResponseModel>> getRecommendations(
      MatchRequestModel requestModel) async {
    try {
      print(requestModel.values);
      print(requestModel.category);
      print(requestModel.ageGroup);
      print(requestModel.gender);
      final response = await dio.post(
        '/recommend_apps/',
        data: requestModel.toJson(),
      );

      // Check for 307 redirect
      if (response.statusCode == 307) {
        String? newUrl = response.headers['location']?.first;
        if (newUrl != null) {
          print('Redirecting to: $newUrl');

          // Make a new request to the redirected URL
          final newResponse =
              await dio.post(newUrl, data: requestModel.toJson());
          print(newResponse.statusCode);

          if (newResponse.statusCode == 200) {
            return (newResponse.data as List)
                .map((json) => MatchResponseModel.fromJson(json))
                .toList();
          } else {
            throw Exception('Failed to load recommendations after redirect');
          }
        } else {
          throw Exception('Redirect detected but no Location header found');
        }
      }

      // Normal successful request
      else if (response.statusCode == 200) {
        return (response.data as List)
            .map((json) => MatchResponseModel.fromJson(json))
            .toList();
      } else {
        throw Exception('Failed to load recommendations');
      }
    } catch (e) {
      print('Error fetching recommendations: $e');
      throw Exception('Error fetching recommendations');
    }
  }
}
