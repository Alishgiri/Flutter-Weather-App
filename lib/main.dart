import 'package:flutter/material.dart';

import 'package:weatherapp/locator.dart';
import 'package:weatherapp/ui/views/help_view.dart';

void main() async {
  setupLocator();
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HelpView(),
      title: 'Weather App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
