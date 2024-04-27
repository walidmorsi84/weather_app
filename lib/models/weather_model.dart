class WeatherModel {
  final String cityName;
  final DateTime date;
  final String weatherCondition;
  final String image;
  final double maxTemp;
  final double minTemp;
  final double avgTemp;
  final int weatherCode;

  const WeatherModel({
    required this.cityName,
    required this.date,
    required this.weatherCondition,
    required this.image,
    required this.maxTemp,
    required this.minTemp,
    required this.avgTemp,
    required this.weatherCode,
  });

  factory WeatherModel.fromJson(json) {
    return WeatherModel(
      cityName: json['location']['name'],
      date: DateTime.parse(json['current']['last_updated']),
      weatherCondition: json['current']['condition']['text'],
      image: json['current']['condition']['icon'],
      maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
      minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
      avgTemp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
      weatherCode: json['current']['condition']['code'],
    );
  }
}
