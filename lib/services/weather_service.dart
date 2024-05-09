import '../models/weather.dart';

abstract class WeatherService {
  Future<Weather> fetchWeatherByCityName(String cityName);

  Future<Weather> fetchWeatherByZipCode(String zipCode);
}
