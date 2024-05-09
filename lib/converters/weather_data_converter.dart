import '../models/weather.dart';

abstract class WeatherDataConverter {
  Weather fromJson(Map<String, dynamic> json);
}
