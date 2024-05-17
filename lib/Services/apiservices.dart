import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:smarthome/models/weatherapimodel.dart';

class ApiServices {
  final Dio dio;

  ApiServices(this.dio);

  static const String baseurl = "http://api.weatherapi.com/v1";
  String apikey = "bce08b7cdc484258b51154554242901";

  Future<WeatherApiModel> weatherdata() async {
    try {
      final response = await dio.get(
          "$baseurl/forecast.json?key=$apikey&q=egypt&days=1&aqi=no&alerts=no");
      if (response.statusCode == 200) {
        return WeatherApiModel.fromjson(response.data);
      } else {
        throw Exception(
            "API request failed with status code: ${response.statusCode}");
      }
    } on DioException catch (e) {
      log("Error fetching weather data: $e");
      rethrow; // Rethrow for further handling in calling code
    }
  }
}
