import 'package:weatherapp/locator.dart';
import 'package:weatherapp/core/model/weather_data.dart';
import 'package:weatherapp/core/services/base_service.dart';

class WeatherApiService {
  final _dio = locator<BaseService>().dio;

  Future<WeatherData> fetchWeatherForCurrentLocation(
      Map<String, dynamic> queryParameters) async {
    final res = await _dio.get("weather", queryParameters: queryParameters);
    return WeatherData.fromWeather(res.data);
  }

  Future<WeatherData> fetchWeatherDataForSpecifiedCity(
      Map<String, dynamic> queryParameters) async {
    final res = await _dio.get("forecast", queryParameters: queryParameters);
    return WeatherData.fromForecast(res.data);
  }
}
