import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseUrl = 'https://api.weatherapi.com/v1';
  final String apiKey = '5e966b8a059a4ad3a4094925231907';
  final int day = 1;
  const WeatherService(this.dio);
  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&$day');
      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMsg = e.response?.data['error']['message'] ??
          'Oops there was an error, try later';
      throw Exception(errorMsg);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops there was an error, try later');
    }
  }
}
