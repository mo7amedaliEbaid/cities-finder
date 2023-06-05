import 'dart:convert';
import 'dart:developer';
import 'package:untitled/constants/api_constants.dart';
import 'package:untitled/data/models/location_model.dart';
import 'package:http/http.dart' as http;

class LocationWebServices {
  List<CityLocation> citylocations = [];

  Future<List<CityLocation>> getcitylocation(
      {required String name, required int count}) async {
    var response = await http.get(Uri.parse(
        "${ApiConstants.LOCATION_BASE_URL}${ApiConstants.CITY_NAME}${name}&${ApiConstants.COUNT}${count}"));
    print('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    var data = jsonDecode(response.body);
    List locationTempList = [];
    for (var v in data["results"]) {
      locationTempList.add(v);
      log(v.toString());
      print(data["results"].length.toString());
    }
    if (response.statusCode == 200) {
      citylocations = CityLocation.locationsFromSnapshot(locationTempList);
      return citylocations;
    } else {
      throw Exception('Failed to load location');
    }
  }
}
