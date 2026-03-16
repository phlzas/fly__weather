class WeatherModel {
  var country;
  var observation_time;
  var temperature;
  var weather_icons;
  var weather_descriptions;
  var wind_speed;
  var pressure;
  var humidity;
  var uv_index;

  WeatherModel({
    required this.country,
    required this.observation_time,
    required this.temperature,
    required this.weather_icons,
    required this.weather_descriptions,
    required this.wind_speed,
    required this.pressure,
    required this.humidity,
    required this.uv_index,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      country: json["location"]["country"] ?? "no data",
      observation_time: json["current"]["observation_time"] ?? "no data",
      weather_icons: json["current"]["weather_icons"] ?? "no data",
      weather_descriptions:
          json["current"]["weather_descriptions"] ?? "no data",
      temperature: json["current"]["temperature"] ?? "no data",
      humidity: json["current"]["humidity"] ?? "no data",
      wind_speed: json["current"]["wind_speed"] ?? "no data",
      pressure: json["current"]["pressure"] ?? "no data",
      uv_index: json["current"]["uv_index"] ?? "no data",
    );
  }
}
