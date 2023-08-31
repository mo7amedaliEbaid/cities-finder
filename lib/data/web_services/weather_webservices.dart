import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:untitled/constants/api_constants.dart';
import 'package:untitled/data/models/weather_model.dart';

class WeatherWebServices {
  CurrentWeather currentWeather = CurrentWeather();

  Future<CurrentWeather> getcityWeather(
      {required double latitude,
      required double longitude,
      required bool currentweather}) async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiConstants.WEARTHER_BASE_URL}${ApiConstants.LATITUDE}${latitude.toDouble()}&${ApiConstants.LONGITUDE}${longitude.toDouble()}&${ApiConstants.CURRENT_WEATHER}${currentweather}"));
      print("response ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      currentWeather = CurrentWeather.fromJson(data["current_weather"]);
      return currentWeather;
    } catch (error) {
      log("an error occured while getting weather info $error");
      throw error.toString();
    }
  }
}
