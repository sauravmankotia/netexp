import 'package:dio/dio.dart';
import 'package:network_logger/network_logger.dart';

import 'api_result.dart';
import 'dio_client.dart';
import 'logging_interceptors.dart';
import 'network_exception.dart';

class APIRepository {
  DioClient? _dioClient;
  final _baseUrl = "https://api2.binance.com/api/v3/ticker";

  APIRepository() {
    var dio = Dio();
      _dioClient = DioClient(_baseUrl, dio);
  }

  Future fetchMovieList() async {
    try {
      final response = await _dioClient!.get("/24hr");
      return response;
    } catch (e) {
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
}
