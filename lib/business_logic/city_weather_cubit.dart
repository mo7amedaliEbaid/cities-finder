import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/weather_model.dart';
import 'package:untitled/data/repositories/weather_repo.dart';

part 'city_weather_state.dart';

class CityWeatherCubit extends Cubit<CityWeatherState> {
  final WeatherRepo weatherRepo;
  CurrentWeather currentWeather = CurrentWeather();

  CityWeatherCubit(this.weatherRepo) : super(CityWeatherInitial());

  CurrentWeather getcityweather(
      {required double latitude,
      required double longitude,
      required bool currentweather}) {
    weatherRepo
        .getweather(
            latitude: latitude,
            longitude: longitude,
            currentweather: currentweather)
        .then((cityweather) {
      emit(WeatherLoaded(cityweather));
      this.currentWeather = cityweather;
    });
    return currentWeather;
  }
}
