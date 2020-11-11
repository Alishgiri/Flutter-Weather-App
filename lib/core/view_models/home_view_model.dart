import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import 'package:weatherapp/locator.dart';
import 'package:weatherapp/core/model/weather_data.dart';
import 'package:weatherapp/core/services/hive_service.dart';
import 'package:weatherapp/core/view_models/base_model.dart';
import 'package:weatherapp/core/services/weather_api_service.dart';

class HomeViewModel extends BaseModel {
  String city;
  WeatherData weatherData;
  final formKey = GlobalKey<FormState>();
  final _hiveService = locator<HiveService>();
  final _weatherApiService = locator<WeatherApiService>();

  Future<void> initState() async {
    await _hiveService.initHive();
    city = _hiveService.getSavedCity();
    if (city != null) {
      _fetchWeatherData({"q": city});
      return;
    }
    getCurrentLocation();
  }

  Future getCurrentLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.always ||
        permission == LocationPermission.whileInUse) {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      final params = {"lat": position.latitude, "lon": position.longitude};
      _fetchWeatherData(params, isGeoLocation: true);
    } else {
      await Geolocator.requestPermission();
      getCurrentLocation();
    }
  }

  void onSearchChanged(String value) {
    city = value;
    notifyListeners();
  }

  void onSearch() {
    if (formKey.currentState.validate()) _fetchWeatherData({"q": city});
  }

  Future _fetchWeatherData(Map<String, dynamic> queryParams,
      {bool isGeoLocation = false}) async {
    setBusy();
    final queryParameters = {
      ...queryParams,
      "units": "metric",
      "APPID": "a44c63bf4a70d8d8dd6758497afce4ec",
    };
    try {
      WeatherData result;
      if (isGeoLocation) {
        result = await _weatherApiService.fetchWeatherForCurrentLocation(
          queryParameters,
        );
      } else {
        result = await _weatherApiService.fetchWeatherDataForSpecifiedCity(
          queryParameters,
        );
        _hiveService.saveCity(city);
      }
      weatherData = result;
    } catch (e) {
      String errorMessage = e.toString();
      if (e is DioError) {
        errorMessage = e.response.data['message'];
      }
      scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(errorMessage + "!")),
      );
    }
    setBusy(false);
  }
}
