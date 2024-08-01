
import 'package:dio/dio.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(
      BaseOptions(
        baseUrl: 'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response> getdata({
    required String url,
    required Map<String, dynamic> query,
  }) async {
    try {
      return await dio.get(url, queryParameters: query);
    } catch (e) {
      // Handle the exception
      print('Error fetching data: $e');
      rethrow;
    }
  }

}