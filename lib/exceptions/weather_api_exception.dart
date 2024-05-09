class WeatherAPIException implements Exception {
  final String message;

  WeatherAPIException(this.message);

  @override
  String toString() => message;
}
