import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCode,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

// Define a method to get the material color based on weather condition code
MaterialColor getThemeColor(int? conditionCode) {
  if (conditionCode == null) {
    return Colors.blue;
  }
  switch (conditionCode) {
    case 1000: // Sunny/Clear
      return Colors.yellow;
    case 1003: // Partly cloudy
    case 1030: // Mist
    case 1066: // Patchy snow possible
    case 1069: // Patchy sleet possible
    case 1072: // Patchy freezing drizzle possible
    case 1114: // Blowing snow
    case 1117: // Blizzard
    case 1150: // Patchy light drizzle
    case 1153: // Light drizzle
    case 1168: // Freezing drizzle
    case 1171: // Heavy freezing drizzle
    case 1198: // Light freezing rain
    case 1201: // Moderate or heavy freezing rain
    case 1204: // Light sleet
    case 1207: // Moderate or heavy sleet
    case 1210: // Patchy light snow
    case 1213: // Light snow
    case 1216: // Patchy moderate snow
    case 1219: // Moderate snow
    case 1222: // Patchy heavy snow
    case 1225: // Heavy snow
    case 1237: // Ice pellets
    case 1249: // Light sleet showers
    case 1252: // Moderate or heavy sleet showers
    case 1255: // Light snow showers
    case 1258: // Moderate or heavy snow showers
    case 1261: // Light showers of ice pellets
    case 1264: // Moderate or heavy showers of ice pellets
      return Colors.lightBlue;
    case 1006: // Cloudy
    case 1135: // Fog
    case 1147: // Freezing fog
      return Colors.grey;
    case 1009: // Overcast
      return Colors.blueGrey;
    case 1063: // Patchy rain possible
      return Colors.lightGreen;
    case 1087: // Thundery outbreaks possible
      return Colors.deepPurple;
    case 1180: // Patchy light rain
    case 1183: // Light rain
    case 1240: // Light rain shower
      return Colors.lightGreen;
    case 1186: // Moderate rain at times
    case 1189: // Moderate rain
    case 1192: // Heavy rain at times
    case 1195: // Heavy rain
    case 1243: // Moderate or heavy rain shower
    case 1246: // Torrential rain shower
      return Colors.green;
    case 1273: // Patchy light rain with thunder
    case 1279: // Patchy light snow with thunder
      return Colors.orange;
    case 1276: // Moderate or heavy rain with thunder
    case 1282: // Moderate or heavy snow with thunder
      return Colors.red;
    default:
      return Colors.blue;
  }
}
