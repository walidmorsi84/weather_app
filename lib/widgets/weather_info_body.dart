import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/main.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});

  final WeatherModel weather;
  @override
  Widget build(BuildContext context) {
    WeatherModel? weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            getThemeColor(weatherModel.weatherCode),
            getThemeColor(weatherModel.weatherCode)[300]!,
            getThemeColor(weatherModel.weatherCode)[200]!,
            getThemeColor(weatherModel.weatherCode)[50]!,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              weatherModel.cityName,
              style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            Text(
                'updated at ${weatherModel.date.hour}:${weatherModel.date.minute}'),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //mainAxisSize: MainAxisSize.min,
              children: [
                Image.network('https:${weatherModel.image}'),
                Text(
                  '${weatherModel.avgTemp.round()}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 50),
                ),
                Column(
                  children: [
                    Text('MaxTemp : ${weatherModel.maxTemp.round()}'),
                    Text('MinTemp : ${weatherModel.minTemp.round()}'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            Text(
              weatherModel.weatherCondition.toString(),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
