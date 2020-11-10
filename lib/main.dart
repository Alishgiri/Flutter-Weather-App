import 'package:flutter/material.dart';

import 'package:weatherapp/locator.dart';
import 'package:weatherapp/ui/views/help_view.dart';
import 'package:weatherapp/core/services/hive_service.dart';

void main() async {
  setupLocator();
  await locator<HiveService>().initHive();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
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
