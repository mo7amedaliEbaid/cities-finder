import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:untitled/business_logic/location_cubit.dart';
import 'package:untitled/data/models/location_model.dart';
import 'package:untitled/presentation/screens/map_screen.dart';
import 'package:untitled/presentation/screens/weather_screen.dart';
import 'package:untitled/presentation/widgets/gotomaps_button.dart';

import '../../constants/styles.dart';
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
      backgroundColor: Color(0xFF276875),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(Icons.arrow_back_ios),
          ),
        ),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return BlocBuilder<LocationCubit, LocationState>(
              builder: (context, state) {
                if (state is LocationsLoaded) {
                  citylocations = (state).citylocations;
                  return buildcitylocationbody(context, citylocations);
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            );
          } else {
            return Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 50),
                child: Column(
                  children: [
                    Icon(
                      Icons.signal_wifi_statusbar_connected_no_internet_4_sharp,
                      size: 60,
                      color: Colors.white,
                    ),
                    Text(
                      "Please Check Your Internet Connection",
                      style: hintstyle,
                    )
                  ],
                ),
              ),
            );
          }
        },
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

Widget buildcitylocationbody(
    BuildContext context, List<CityLocation> citylocations) {

  Size size = MediaQuery.of(context).size;

  _buildlocationrow(String lefttext, String righttext) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            lefttext,
            style: headstyle,
          ),
          Text(
            righttext,
            style: hintstyle,
          )
        ],
      ),
    );
  }

  return Padding(
    padding: size.width < 480
        ? EdgeInsets.fromLTRB(45, 0, 45, 10)
        : EdgeInsets.fromLTRB(50, 0, 40, 0),
    child: SingleChildScrollView(
      child: Container(
        height: size.width < 480 ? 700 : 400,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => MapScreen(
                                latitude: citylocations.first.latitude,
                                longitude: citylocations.first.longitude,
                              )));
                    },
                    child: GotomapsButton(context)),
              ),
              _buildlocationrow("City Name", citylocations.first.name),
              _buildlocationrow(
                  "Elevation", citylocations.first.elevation.toString()),
              _buildlocationrow(
                "Population",
                citylocations.first.population.toString(),
              ),
              _buildlocationrow(
                "Country",
                citylocations.first.country.toString(),
              ),
              Flexible(
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => WeatherScreen(
                                latitude: citylocations.first.latitude,
                                longitude: citylocations.first.longitude,
                                cityname: citylocations.first.name,
                              )));
                    },
                    child: GetWeatherButton(context)),
              ),
              SizedBox(
                height: 50,
              )
            ]),
      ),
    ),
  );
}
