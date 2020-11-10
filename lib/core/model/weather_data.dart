class WeatherData {
  double temp;
  int humidity;
  double windSpeed;
  String weatherType;

  WeatherData({this.temp, this.windSpeed, this.humidity, this.weatherType});

  factory WeatherData.fromWeather(Map<String, dynamic> data) {
    return WeatherData(
      temp: data['main']['temp'],
      windSpeed: data['wind']['speed'],
      humidity: data['main']['humidity'],
      weatherType: data['weather'][0]['main'],
    );
  }

  factory WeatherData.fromForecast(Map<String, dynamic> data) {
    return WeatherData(
      temp: data['list'][0]['main']['temp'],
      windSpeed: data['list'][0]['wind']['speed'],
      humidity: data['list'][0]['main']['humidity'],
      weatherType: data['list'][0]['weather'][0]['main'],
    );
  }
}
