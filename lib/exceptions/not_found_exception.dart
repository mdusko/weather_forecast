import 'weather_api_exception.dart';

class NotFoundException extends WeatherAPIException {
  NotFoundException(super.message);
}
