class CurrentWeather {
  double? temperature;
  double? windspeed;
  double? winddirection;
  int? isDay;
  String? time;

  CurrentWeather({
    this.temperature,
    this.windspeed,
    this.winddirection,
    this.isDay,
    this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) => CurrentWeather(
        temperature: json["temperature"]?.toDouble() ?? null,
        windspeed: json["windspeed"] ?? null,
        winddirection: json["winddirection"] ?? null,
        isDay: json["is_day"] ?? null,
        time: json["time"] ?? null,
      );
}
