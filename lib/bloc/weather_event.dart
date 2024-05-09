part of 'weather_bloc.dart';

sealed class WeatherEvent extends Equatable {
  const WeatherEvent();

  @override
  List<Object> get props => [];
}

class WeatherByCityNameRequested extends WeatherEvent {
  final String cityName;

  const WeatherByCityNameRequested(this.cityName);

  @override
  List<Object> get props => [cityName];
}

class WeatherByZipCodeRequested extends WeatherEvent {
  final String zipCode;

  const WeatherByZipCodeRequested(this.zipCode);

  @override
  List<Object> get props => [zipCode];
}
