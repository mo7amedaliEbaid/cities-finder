import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:untitled/data/models/location_model.dart';
import 'package:untitled/data/repositories/location_repo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepo;
  List<CityLocation> citylocations = [];
  LocationCubit(this.locationRepo) : super(LocationInitial());
  List<CityLocation> getcitylocation({required String name,required int count}) {
    locationRepo.getlocations(name: name, count: count).then((locations) {
      emit(LocationsLoaded(locations));
      this.citylocations = locations;
    });
    return citylocations;
  }
}
