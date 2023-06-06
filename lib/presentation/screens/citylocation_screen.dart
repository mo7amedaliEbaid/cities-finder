import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/business_logic/location_cubit.dart';
import 'package:untitled/data/models/location_model.dart';
import 'package:untitled/presentation/screens/weather_screen.dart';

import '../../constants/app_constants.dart';
import '../widgets/getweatherbutton_widget.dart';

class CityLocationScreen extends StatefulWidget {
  CityLocationScreen({Key? key, required this.cityname}) : super(key: key);
  final String cityname;

  @override
  State<CityLocationScreen> createState() => _CityLocationScreenState();
}

class _CityLocationScreenState extends State<CityLocationScreen> {
  late List<CityLocation> citylocations;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<LocationCubit>(context)
        .getcitylocation(name: widget.cityname.toLowerCase(), count: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationsLoaded) {
            citylocations = (state).citylocations;
            return buildcitylocationbody(context, citylocations);
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

Widget buildcitylocationbody(
    BuildContext context, List<CityLocation> citylocations) {
  Size size = MediaQuery.of(context).size;
  return Padding(
    padding: size.width < 480
        ? EdgeInsets.fromLTRB(45,45,45,10)
        : EdgeInsets.fromLTRB(50, 0, 40, 0),
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "City Name",
                  style: headstyle,
                ),
                Text(
                  citylocations.first.name,
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
                  "Latitude",
                  style: headstyle,
                ),
                Text(
                  citylocations.first.latitude.toString(),
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
                  "Longitude",
                  style: headstyle,
                ),
                Text(
                  citylocations.first.longitude.toString(),
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
                  "Elevation",
                  style: headstyle,
                ),
                Text(
                  citylocations.first.elevation.toString(),
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
                  "Population",
                  style: headstyle,
                ),
                Text(
                  citylocations.first.population.toString(),
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
                  "Country",
                  style: headstyle,
                ),
                Text(
                  citylocations.first.country.toString(),
                  style: hintstyle,
                )
              ],
            ),
          ),
          Flexible(
            child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => WeatherScreen(
                          latitude: citylocations.first.latitude,
                          longitude: citylocations.first.longitude,
                        cityname: citylocations.first.name,)));
                },
                child: GetWeatherButton(context)),
          )
        ]),
  );
}
