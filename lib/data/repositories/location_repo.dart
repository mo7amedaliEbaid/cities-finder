import 'package:untitled/data/models/location_model.dart';

import '../web_services/location_webservices.dart';

class LocationRepo {
  final LocationWebServices locationWebServices;

  LocationRepo(this.locationWebServices);

  Future<List<CityLocation>> getlocations(
      {required String name, required int count}) async {
    final locations =
        await locationWebServices.getcitylocation(name: name, count: count);
    return locations;
  }
}
