import 'package:appjam_29th/data/post/filter/post_filter_model.dart';
import 'package:dio/dio.dart';
import '../../../core/network/default_api_client.dart';

class PostFilterDatasource {
  Dio dio = DefaultApiClient.dio;

  Future<List<FilterResponseModel>> fetchFilteredReviews(
      List<String> mainCategory, List<String> criteria) async {
    try {
      // Join the mainCategory list into a comma-separated string
      String mainCategoryString = mainCategory.join(', ');
      String criteriaString = criteria.join(', ');
      // Send the GET request with query parameters
      final response = await dio.get(
        '/api/board/filter',
        queryParameters: {
          'mainCategory': mainCategoryString,
          'criteria': criteriaString,
        },
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Parse the response into a list of FilterResponseModel
        List<dynamic> data = response.data;
        return data.map((e) => FilterResponseModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch filtered reviews');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error fetching filtered reviews: $e');
      throw Exception('Error fetching filtered reviews');
    }
  }
}
