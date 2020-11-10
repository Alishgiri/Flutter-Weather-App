import 'package:get_it/get_it.dart';

import 'package:weatherapp/core/services/base_service.dart';
import 'package:weatherapp/core/services/hive_service.dart';
import 'package:weatherapp/core/view_models/home_view_model.dart';
import 'package:weatherapp/core/services/weather_api_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  // Models
  locator.registerFactory(() => HomeViewModel());

  // Services
  locator.registerSingleton(HiveService());
  locator.registerSingleton(BaseService());
  locator.registerFactory(() => WeatherApiService());
}
