import 'package:untitled/data/models/weather_model.dart';
import 'package:untitled/data/web_services/weather_webservices.dart';

class WeatherRepo {
  final WeatherWebServices weatherWebServices;

  WeatherRepo(this.weatherWebServices);

  Future<CurrentWeather> getweather(
      {required double latitude, required double longitude,required bool currentweather}) async {
    final cityweather =
    await weatherWebServices.getcityWeather(latitude: latitude, longitude: longitude, currentweather: currentweather);
    return cityweather;
  }
}
