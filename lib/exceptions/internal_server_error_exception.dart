import 'weather_api_exception.dart';

class InternalServerErrorException extends WeatherAPIException {
  InternalServerErrorException(super.message);
}
