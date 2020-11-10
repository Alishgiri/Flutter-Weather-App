import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveService {
  final _savedCity = 'city';
  final _configBox = "Config";

  Future initHive() async {
    await Hive.initFlutter();
    await Hive.openBox(_configBox);
  }

  String getSavedCity() {
    final authBox = Hive.box(_configBox);
    return authBox.get(_savedCity, defaultValue: null);
  }

  Future saveCity(String city) async {
    final authBox = Hive.box(_configBox);
    await authBox.put(_savedCity, city);
  }
}
