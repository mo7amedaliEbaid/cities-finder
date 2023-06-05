import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/business_logic/location_cubit.dart';
import 'package:untitled/data/models/location_model.dart';

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
      body: BlocBuilder<LocationCubit, LocationState>(
        builder: (context, state) {
          if (state is LocationsLoaded) {
            citylocations = (state).citylocations;
            return Container(
              height: 50,
              width: 50,
              child: Text(
                citylocations.first.name,
                style: TextStyle(color: Colors.black),
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
