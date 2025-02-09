import 'package:appjam_29th/core/network/default_api_client.dart';
import 'package:appjam_29th/data/post/create/post_create_model.dart';
import 'package:dio/dio.dart';

class PostCreateDatasources {
  Dio dio = DefaultApiClient.dio;

  // Method to submit a review (POST request)
  Future<ReviewResponseModel> upload(ReviewRequestModel requestModel) async {
    try {
      // Send the POST request with the request model as JSON
      final response = await dio.post(
        '/api/board',
        data: requestModel.toJson(),
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Convert the response data into a ReviewResponseModel
        return ReviewResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to submit review');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error submitting review: $e');
      throw Exception('Error submitting review');
    }
  }

  // Method to fetch a specific review by its ID (GET request)
  Future<List<ReviewResponseModel>> fetchReview() async {
    try {
      // Send the GET request with the review ID as part of the URL
      final response = await dio.get(
        '/api/board', // URL with the dynamic review ID
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Convert the response data into a ReviewResponseModel
        List<dynamic> data = response.data;
        return data.map((e) => ReviewResponseModel.fromJson(e)).toList();
      } else {
        throw Exception('Failed to fetch review by ID');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error fetching review by ID: $e');
      throw Exception('Error fetching review by ID');
    }
  }

  // Method to fetch a specific review by its ID (GET request)
  Future<ReviewResponseModel> fetchReviewById(int id) async {
    try {
      // Send the GET request with the review ID as part of the URL
      final response = await dio.get(
        '/api/board/$id', // URL with the dynamic review ID
      );

      // Check if the request was successful (status code 200)
      if (response.statusCode == 200) {
        // Convert the response data into a ReviewResponseModel
        return ReviewResponseModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch review by ID');
      }
    } catch (e) {
      // Handle any errors that occur during the request
      print('Error fetching review by ID: $e');
      throw Exception('Error fetching review by ID');
    }
  }
}
