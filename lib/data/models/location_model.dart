import 'dart:convert';
import 'dart:html';

class CityLocation {
  int id;
  String name;
  double latitude;
  double longitude;
  int elevation;
  String featureCode;
  String countryCode;
  String timezone;
  int population;
  int countryId;
  String country;

  CityLocation({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.elevation,
    required this.featureCode,
    required this.countryCode,
    required this.timezone,
    required this.population,
    required this.countryId,
    required this.country,
  });

  factory CityLocation.fromJson(Map<String, dynamic> json) => CityLocation(
    id: json["id"],
    name: json["name"],
    latitude: json["latitude"]?.toDouble(),
    longitude: json["longitude"]?.toDouble(),
    elevation: json["elevation"],
    featureCode: json["feature_code"],
    countryCode: json["country_code"],
    timezone: json["timezone"],
    population: json["population"],
    countryId: json["country_id"],
    country: json["country"],
  );

  static List<CityLocation> locationsFromSnapshot(List locationSnapshot) {
    return locationSnapshot.map((json) {
      return CityLocation.fromJson(json);
    }).toList();
  }
}
