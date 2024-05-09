import 'weather_api_exception.dart';

class BadRequestException extends WeatherAPIException {
  BadRequestException(super.message);
}
