import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

class ApiHelper {
  Future<Either> post({
    required String url,
    required Map<String, dynamic> data,
  }) async {
    final response = await http.post(Uri.parse(url), body: jsonEncode(data));
    if (response.statusCode == 200) {
      return right(jsonDecode(response.body));
    } else {
      return left(jsonDecode(response.body));
    }
  }
}
