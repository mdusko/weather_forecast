import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/weather.dart';
import '../services/weather_service.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherService weatherService;

  WeatherBloc({required this.weatherService}) : super(WeatherInitial()) {
    on<WeatherByCityNameRequested>(_onByCityNameRequested);
    on<WeatherByZipCodeRequested>(_onByZipCodeRequested);
  }

  Future<void> _onByCityNameRequested(
    WeatherByCityNameRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoadInProgress());
    try {
      final Weather weather =
          await weatherService.fetchWeatherByCityName(event.cityName);
      emit(WeatherLoadSuccess(weather));
    } catch (e) {
      emit(WeatherLoadFailure(e.toString()));
    }
  }

  Future<void> _onByZipCodeRequested(
    WeatherByZipCodeRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(WeatherLoadInProgress());
    try {
      final Weather weather =
          await weatherService.fetchWeatherByZipCode(event.zipCode);
      emit(WeatherLoadSuccess(weather));
    } catch (e) {
      emit(WeatherLoadFailure(e.toString()));
    }
  }
}
