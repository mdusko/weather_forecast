import '../models/weather.dart';
import 'weather_data_converter.dart';

class OpenWeatherMapConverter implements WeatherDataConverter {
  @override
  Weather fromJson(Map<String, dynamic> json) {
    return Weather(
      name: json['name'],
      description: json['weather'][0]['description'],
      temperature: json['main']['temp'],
      pressure: json['main']['pressure'],
      humidity: json['main']['humidity'],
      icon:
          'https://openweathermap.org/img/wn/${json['weather'][0]['icon']}@2x.png',
    );
  }
}
