part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}
class LocationsLoaded extends LocationState {
  final List<CityLocation> citylocations;

  LocationsLoaded(this.citylocations);
}
