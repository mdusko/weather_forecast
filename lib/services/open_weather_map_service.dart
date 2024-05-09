import 'dart:convert';

import 'package:http/http.dart' as http;

import '../config/weather_service_config.dart';
import '../converters/weather_data_converter.dart';
import '../exceptions/bad_request_exception.dart';
import '../exceptions/internal_server_error_exception.dart';
import '../exceptions/not_found_exception.dart';
import '../exceptions/unauthorized_exception.dart';
import '../exceptions/weather_api_exception.dart';
import '../models/weather.dart';
import 'weather_service.dart';

class OpenWeatherMapService implements WeatherService {
  final WeatherServiceConfig config;
  final WeatherDataConverter converter;

  OpenWeatherMapService(this.config, this.converter);

  @override
  Future<Weather> fetchWeatherByCityName(String cityName) async {
    final response = await http.get(Uri.parse(
        '${config.baseUrl}?q=$cityName&appid=${config.apiKey}&units=metric'));

    return _processResponse(response);
  }

  @override
  Future<Weather> fetchWeatherByZipCode(String zipCode) async {
    final response = await http.get(Uri.parse(
        '${config.baseUrl}?zip=$zipCode&appid=${config.apiKey}&units=metric'));

    return _processResponse(response);
  }

  Weather _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return converter.fromJson(json.decode(response.body));
      case 400:
        throw BadRequestException(
            'Invalid request. Please check your parameters.');
      case 401:
        throw UnauthorizedException('Unauthorized. Check your API key.');
      case 404:
        throw NotFoundException('The requested resource was not found.');
      case 500:
        throw InternalServerErrorException(
            'Internal Server Error from the API.');
      default:
        throw WeatherAPIException(
            'Failed to fetch weather data with status code: ${response.statusCode}');
    }
  }
}
