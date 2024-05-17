import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/Services/apiservices.dart';
import 'package:smarthome/components/CustomAppBar.dart';
import 'package:smarthome/components/categories.dart';
import 'package:smarthome/components/weatherdata.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';
import 'package:smarthome/helper/constant.dart';
import 'package:smarthome/models/weatherapimodel.dart';
import 'package:smarthome/views/bedRoom.dart';
import 'package:smarthome/views/doorview.dart';
import 'package:smarthome/views/livingingroomview.dart';
import 'package:smarthome/views/officeview.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MqttCubit(),
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/categories.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: BlocProvider(
              create: (context) => MqttCubit(),
              child: Column(
                children: [
                  CustomAppBar(
                    ontap: () {
                      Navigator.pop(context);
                    },
                    title: "Categories",
                  ),
                  FutureBuilder<WeatherApiModel>(
                    future: ApiServices(Dio()).weatherdata(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return WeatherData(weatherApiModel: snapshot.data!);
                      } else {
                        return Container(
                          width: 340,
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
                          child: const Center(
                            child: CircularProgressIndicator(
                              color: kprimarycolor,
                              strokeWidth: 3,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Categories(
                        ontap: () {
                          Navigator.pushNamed(context, DoorView.id);
                        },
                        image: "assets/images/livingroom (4).svg",
                        title: "Door",
                      ),
                      Categories(
                        ontap: () {
                          Navigator.pushNamed(context, LivingRoomView.id);
                        },
                        image: "assets/images/livingroom (1).svg",
                        title: "Living Room",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Categories(
                        ontap: () {
                          Navigator.pushNamed(context, Officeview.id);
                        },
                        image: "assets/images/livingroom (2).svg",
                        title: "Office",
                      ),
                      Categories(
                        ontap: () {
                          Navigator.pushNamed(context, BedRoom.id);
                        },
                        image: "assets/images/livingroom (3).svg",
                        title: "Bed Room",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
