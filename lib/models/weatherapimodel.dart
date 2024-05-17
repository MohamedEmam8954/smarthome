class WeatherApiModel {
  final String name;
  final String state;

  final double maxtempc;
  final double mintempc;
  final double windkph;
  final int humidity;
  final String condition;

  WeatherApiModel({
    required this.name,
    required this.state,
    required this.maxtempc,
    required this.mintempc,
    required this.windkph,
    required this.humidity,
    required this.condition,
  });
  factory WeatherApiModel.fromjson(Map<String, dynamic> jsondata) {
    return WeatherApiModel(
      name: jsondata["location"]["name"],
      state: jsondata["current"]["condition"]["text"],
      maxtempc: jsondata["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
      mintempc: jsondata["forecast"]["forecastday"][0]["day"]["mintemp_c"],
      condition: jsondata["forecast"]["forecastday"][0]["day"]["condition"]
          ["text"],
      windkph: jsondata["current"]["wind_kph"],
      humidity: jsondata["current"]["humidity"],
    );
  }
}
