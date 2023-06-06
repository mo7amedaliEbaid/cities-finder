import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/business_logic/city_weather_cubit.dart';
import 'package:untitled/data/models/weather_model.dart';

import '../../constants/app_constants.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen(
      {Key? key,
      required this.latitude,
      required this.longitude,
      required this.cityname})
      : super(key: key);
  final double latitude;
  final double longitude;
  final String cityname;

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late CurrentWeather currentWeather;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CityWeatherCubit>(context).getcityweather(
        latitude: widget.latitude,
        longitude: widget.longitude,
        currentweather: true);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: BlocBuilder<CityWeatherCubit, CityWeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            currentWeather = (state).currentWeather;
            return Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: currentWeather.isDay == 1
                          ? AssetImage("assets/day.jpg")
                          : AssetImage("assets/night.jpg"),
                      fit: size.width < 480
                          ? BoxFit.fitHeight
                          : BoxFit.fitWidth)),
              child: buildcityweatherbody(
                  context, currentWeather, widget.cityname),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buildcityweatherbody(
    BuildContext context, CurrentWeather currentWeather, String cityname) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: size.width < 480 ? EdgeInsets.all(45) : EdgeInsets.all(50),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 28.0, 0, 50),
            child: Text(
              cityname,
              style: currentWeather.isDay == 0 ? citynightstyle : citydaystyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Temperature",
                  style: headstyle,
                ),
                Text(
                  currentWeather.temperature.toString(),
                  style: hintstyle,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wind Speed",
                  style: headstyle,
                ),
                Text(
                  currentWeather.windspeed.toString(),
                  style: hintstyle,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Wind Direction",
                  style: headstyle,
                ),
                Text(
                  currentWeather.winddirection.toString(),
                  style: hintstyle,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date/Time",
                  style: headstyle,
                ),
                Text(
                  currentWeather.time.toString(),
                  style: hintstyle,
                )
              ],
            ),
          ),
        ]),
  );
}
