import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/weather_bloc.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Details'),
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadInProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is WeatherLoadSuccess) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(state.weather.name),
                  const SizedBox(height: 20),
                  Image.network(state.weather.icon),
                  Text(state.weather.description),
                  const SizedBox(height: 20),
                  Text(
                    'Temperature: ${state.weather.temperature.toStringAsFixed(1)}°C',
                  ),
                  Text('Pressure: ${state.weather.pressure} hPa'),
                  Text('Humidity: ${state.weather.humidity}%'),
                ],
              ),
            );
          } else if (state is WeatherLoadFailure) {
            return Center(
              child: Text(state.error),
            );
          }
          return const Center(
            child: Text('Please enter a city name or zip code'),
          );
        },
      ),
    );
  }
}
