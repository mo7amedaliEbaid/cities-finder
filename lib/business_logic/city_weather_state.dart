part of 'city_weather_cubit.dart';

@immutable
abstract class CityWeatherState {}

class CityWeatherInitial extends CityWeatherState {}

class WeatherLoaded extends CityWeatherState {
  final CurrentWeather currentWeather;

  WeatherLoaded(this.currentWeather);
}
