import 'package:dio/dio.dart';

class RestService {
  final _dio = Dio();

  dynamic get(
      String endpoint, Map<String, dynamic>? data, Map<String, dynamic> headers) async {
    try {
      var response = await _dio.get(
        endpoint,
        queryParameters: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      //
    }
  }
  dynamic post(
      String endpoint, dynamic data, Map<String, dynamic>? headers) async {
    try {
      var response = await _dio.post(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      //
    }
  }

  dynamic put(
      String endpoint, dynamic data, Map<String, dynamic>? headers) async {
    try {
      var response = await _dio.put(
        endpoint,
        data: data,
        options: Options(headers: headers),
      );
      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      //
    }
  }

  dynamic delete(
      String endpoint, Map<String, dynamic>? data, Map<String, dynamic> headers) async {
    try {
      var response = await _dio.delete(
        endpoint,
        queryParameters: data,
        options: Options(headers: headers),
      );

      if (response.statusCode == 200) {
        return response.data;
      }
      return null;
    } catch (e) {
      //
    }
  }
}
