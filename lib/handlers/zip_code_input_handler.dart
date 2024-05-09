import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/weather_bloc.dart';
import '../screens/weather_screen.dart';
import 'input_handler.dart';

class ZipCodeInputHandler implements InputHandler {
  @override
  void handleInput(String input, BuildContext context) {
    if (input.isNotEmpty && RegExp(r'^\d+$').hasMatch(input)) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: BlocProvider.of<WeatherBloc>(context)
              ..add(WeatherByZipCodeRequested(input)),
            child: const WeatherScreen(),
          ),
        ),
      );
    }
  }
}
