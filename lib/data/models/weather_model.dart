class CurrentWeather {
  double temperature;
  int windspeed;
  int winddirection;
  int weathercode;
  int isDay;
  String time;

  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.winddirection,
    required this.weathercode,
    required this.isDay,
    required this.time,
  });

  factory CurrentWeather.fromJson(Map<String, dynamic> json) =>
      CurrentWeather(
        temperature: json["temperature"]?.toDouble(),
        windspeed: json["windspeed"],
        winddirection: json["winddirection"],
        weathercode: json["weathercode"],
        isDay: json["is_day"],
        time: json["time"],
      );
  }
