import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/business_logic/location_cubit.dart';
import 'package:untitled/data/repositories/location_repo.dart';
import 'package:untitled/data/web_services/location_webservices.dart';
import 'package:untitled/presentation/screens/searchlocation_screen.dart';


void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider<LocationCubit>(
      create: (context) => LocationCubit(
        (LocationRepo(LocationWebServices())),
      ),
    )
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SearchLocationScreen(),
    );
  }
}
