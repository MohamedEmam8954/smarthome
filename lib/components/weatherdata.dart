import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smarthome/helper/constant.dart';
import 'package:smarthome/models/weatherapimodel.dart';

class WeatherData extends StatelessWidget {
  const WeatherData({super.key, required this.weatherApiModel});
  final WeatherApiModel weatherApiModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 328,
      height: 63,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(24),
        boxShadow: const [
          BoxShadow(
            color: kprimarycolor,
            blurRadius: 8.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 8, top: 3, right: 3),
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      weatherState(weatherApiModel.condition),
                      width: 45,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Temp",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${weatherApiModel.maxtempc.toInt()}°/${weatherApiModel.mintempc.toInt()}°",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const VerticalDivider(
              color: kprimarycolor,
              thickness: 1,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/state.svg",
                      width: 32,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "State",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  weatherApiModel.state,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const VerticalDivider(
              color: kprimarycolor,
              thickness: 1,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/wind.svg",
                      width: 32,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "Wind",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "${weatherApiModel.windkph.toInt()} Km/h",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            VerticalDivider(
              color: kprimarycolor,
              thickness: 1,
            ),
            Column(
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      "assets/images/Humidity.svg",
                      width: 32,
                      height: 25,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      "${weatherApiModel.humidity.toInt()}%",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 4,
                ),
                Text(
                  "humidity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  String weatherState(String state) {
    final stateLower = state.toLowerCase();
    switch (stateLower) {
      case "sunny":
        return "assets/images/sunny.svg";
      case "cloudy":
        return "assets/images/windy.svg";
      case "rainy":
        return "assets/images/rainy.svg";
      case "snowy":
        return "assets/images/Vector(3).svg";
      case "partly cloudy":
        return "assets/images/Vector1.svg";
      case "foggy":
        return "assets/images/Vector1.svg";
      case "windy":
        return "assets/images/Vector.svg";
      case "thunderstorm":
        return "assets/images/windy.svg";
      default:
        return "assets/images/Vector.svg";
    }
  }
}
