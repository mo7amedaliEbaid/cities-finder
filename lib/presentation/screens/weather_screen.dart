import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:untitled/business_logic/city_weather_cubit.dart';
import 'package:untitled/data/models/weather_model.dart';
import 'package:untitled/presentation/screens/searchlocation_screen.dart';

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
    Size size = MediaQuery.sizeOf(context);
    /*log(currentWeather.time.toString());
    int idx = currentWeather.time!.indexOf("T");
    List parts = [currentWeather.time!.substring(0,idx).trim(), currentWeather.time!.substring(idx+1).trim()];
    String date=parts.first;
    String time=parts.last;
    log(parts.toString());*/
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: BlocBuilder<CityWeatherCubit, CityWeatherState>(
        builder: (context, state) {
          if (state is WeatherLoaded) {
            currentWeather = (state).currentWeather;
            int idx = currentWeather.time!.indexOf("T");
            List parts = [
              currentWeather.time!.substring(0, idx).trim(),
              currentWeather.time!.substring(idx + 1).trim()
            ];
            String date = parts.first;
            String time = parts.last;
            log(parts.toString());
            return Stack(
              children: [
                Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        /* colorFilter: currentWeather.isDay == 1
                            ? ColorFilter.mode(Colors.amber.shade200, BlendMode.colorBurn)
                            : ColorFilter.mode(Colors.black, BlendMode.color),*/
                        image: currentWeather.isDay == 1
                            ? AssetImage("screen_shots/sunny.jpeg")
                            : AssetImage("screen_shots/night3.jpg"),
                        fit: size.width < 480
                            ? BoxFit.fitHeight
                            : BoxFit.fitWidth),
                  ),
                  child: SingleChildScrollView(
                    child: buildcityweatherbody(
                        context, currentWeather, widget.cityname, date, time),
                  ),
                ),
                Positioned(
                    top: 40,
                    left: 30,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        size: 35,
                        color: currentWeather.isDay == 1
                            ? Colors.black
                            : Colors.white,
                      ),
                    ))
              ],
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buildcityweatherbody(BuildContext context, CurrentWeather currentWeather,
    String cityname, String date, String time) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: size.width < 480 ? EdgeInsets.all(45) : EdgeInsets.all(50),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Color(0xffcedbdb),
                borderRadius: BorderRadius.circular(10)),
            child: Text(
              cityname,
              style: currentWeather.isDay == 0 ? citynightstyle : citydaystyle,
            ),
          ),
          SizedBox(
            height: 22,
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(10)),
            child: Center(
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
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(10)),
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
          Container(
            padding: const EdgeInsets.all(18.0),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(10)),
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
          Container(
            padding: const EdgeInsets.all(18.0),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Date",
                  style: headstyle,
                ),
                Text(
                  date,
                  style: hintstyle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(18.0),
            margin: EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
                color: Colors.green.shade900,
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Time",
                  style: headstyle,
                ),
                Text(
                  time,
                  style: hintstyle1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SearchLocationScreen()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xffcedbdb),
                  borderRadius: BorderRadius.circular(10)),
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(8),
              width: 250,
              height: 40,
              child: Center(
                child: Text(
                  "Search For Another City",
                  style: greenstyle,
                ),
              ),
            ),
          )
        ]),
  );
}
