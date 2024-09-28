import 'dart:io';
import 'package:ansicolor/ansicolor.dart';
import 'package:care_mingle/core/base/base_model.dart';
import 'package:care_mingle/core/consts/api_constants.dart';
import 'package:dio/dio.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';
class TheHttpExecuter {
  String apiUrl() => baseUrl+port;
  TheHttpExecuter() {
    dio.interceptors.add(TalkerDioLogger(
        settings: TalkerDioLoggerSettings(
      printErrorData: true,
      printRequestData: true,
      printRequestHeaders: true,
      printErrorHeaders: true,
      printErrorMessage: true,
      printResponseData: true,
      responsePen: AnsiPen()..green(),
      errorPen: AnsiPen()..red(),
      requestPen: AnsiPen()..yellow(),
    )));
  }
  final dio = Dio();
  Future<dynamic> get<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Map<String, String>? queryParameters = const {},
    required T model,
  }) async {
    final response = await dio.get(
      options: Options(headers: headers),
      "{$apiUrl()}=path",
      queryParameters: queryParameters,
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return '403';
      case HttpStatus.notFound:
        return '404';
      default:
        throw response.data;
    }
  }
  Future<dynamic> post<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
     bool isMultipart = false
  }) async {
    try {
    dynamic requestBody;
    if (isMultipart && body is Map<String, dynamic>) {
      requestBody = FormData.fromMap(body);
    } else {
      requestBody = body; 
    }
      final response = await dio.post("${apiUrl()}$path",
          queryParameters: queryParameters,
          options: Options(headers: headers),
          data: requestBody);
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.created:
          {
            return _jsonBodyParser(model, response.data);
          }
        case HttpStatus.forbidden:
          return response.data;
        case HttpStatus.unprocessableEntity:
          return 'Check request Key';
        case HttpStatus.notFound:
          return "404";
        default:
          throw response.data;
      }
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> put<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required model,
  }) async {
    final response = await dio.put(
      "${apiUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return "403";
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }
  Future<dynamic> delete<T extends BaseModel>({
    String? path,
    Map<String, String>? headers,
    Object? body = const {},
    Map<String, dynamic>? queryParameters = const {},
    required T model,
  }) async {
    final response = await dio.delete(
      "${apiUrl()}$path",
      queryParameters: queryParameters,
      options: Options(headers: headers),
    );
    switch (response.statusCode) {
      case HttpStatus.ok:
      case HttpStatus.created:
        {
          return _jsonBodyParser<T>(model, response.data);
        }
      case HttpStatus.forbidden:
        return response.data;
      case HttpStatus.unprocessableEntity:
        return 'Check request key';
      case HttpStatus.unauthorized:
        return '403';
      case HttpStatus.notFound:
        return "404";
      default:
        throw response.data;
    }
  }

  dynamic _jsonBodyParser<T>(model, body) {
    if (body is List) {
      final res = body
          .map((e) {
            return model.fromJson(e as Map<String, dynamic>);
          })
          .toList()
          .cast<T>();
      return res;
    } else if (body is! List) {
      return model.fromJson(body);
    } else {
      return body;
    }
  }
}
