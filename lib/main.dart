import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'bloc/weather_bloc.dart';
import 'config/weather_service_config.dart';
import 'converters/open_weather_map_converter.dart';
import 'handlers/city_name_input_handler.dart';
import 'handlers/composite_input_handler.dart';
import 'handlers/input_handler.dart';
import 'handlers/zip_code_input_handler.dart';
import 'screens/home_screen.dart';
import 'services/open_weather_map_service.dart';
import 'services/weather_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final WeatherService weatherService = OpenWeatherMapService(
    WeatherServiceConfig(
      baseUrl: 'https://api.openweathermap.org/data/2.5/weather',
      apiKey: dotenv.env['OPENWEATHERMAP_API_KEY'] ?? "",
    ),
    OpenWeatherMapConverter(),
  );

  final InputHandler inputHandler = CompositeInputHandler([
    CityNameInputHandler(),
    ZipCodeInputHandler(),
  ]);

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(weatherService: weatherService),
      child: MaterialApp(
        title: 'Weather Forecast',
        home: HomeScreen(inputHandler: inputHandler),
      ),
    );
  }
}
