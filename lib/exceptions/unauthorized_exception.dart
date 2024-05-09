import 'weather_api_exception.dart';

class UnauthorizedException extends WeatherAPIException {
  UnauthorizedException(super.message);
}
