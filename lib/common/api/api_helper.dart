import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<Either> postFormData({
    required String url,
    required Map<String, dynamic> data, // Map to store key-value pairs
    final Map<String, String>? headers,
  }) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(url));
      // Add fields to the request
      data.forEach((key, value) {
        if (value is List) {
          request.fields[key] = jsonEncode(value);
        } else {
          request.fields[key] = value.toString();
        }
        print(request.fields);
      });
      if (headers != null) {
        request.headers.addAll(headers);
      }
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200) {
        return Right(response); // Assuming successful response handling
      } else {
        return Left(
            {response.statusCode, response.body}); // Custom Failure class
      }
    } catch (e) {
      return Left("Error:$e");
    }
  }
}
