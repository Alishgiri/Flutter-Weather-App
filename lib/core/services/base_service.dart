import 'package:dio/dio.dart';

class BaseService {
  Dio dio;

  BaseService() {
    configureDio();
  }

  void configureDio() {
    dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        baseUrl: "https://api.openweathermap.org/data/2.5/",
      ),
    );
    dio.interceptors.add(
      InterceptorsWrapper(
        onError: (DioError error) => error,
        onResponse: (Response response) => response,
        onRequest: (RequestOptions options) {
          return options;
        },
      ),
    );
  }
}
