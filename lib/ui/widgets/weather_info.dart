import 'package:flutter/material.dart';

import 'package:weatherapp/core/model/weather_data.dart';

class WeatherInfo extends StatelessWidget {
  final WeatherData data;

  WeatherInfo({@required this.data});

  @override
  Widget build(BuildContext context) {
    if (data == null) return SizedBox();
    final tt = Theme.of(context).textTheme;

    Widget _rowText({String label, String value}) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(value, style: tt.headline5),
        ],
      );
    }

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          _rowText(label: "Temperature", value: "${data.temp}\u00B0 C"),
          const SizedBox(height: 20),
          _rowText(label: "Weather Condition", value: data.weatherType),
          const SizedBox(height: 20),
          _rowText(label: "Wind Speed", value: data.windSpeed.toString()),
          const SizedBox(height: 20),
          _rowText(label: "Humidity", value: data.humidity?.toString() ?? "-"),
        ],
      ),
    );
  }
}
