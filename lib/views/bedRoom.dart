import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/components/CustomAppBar.dart';
import 'package:smarthome/components/on/onoffcategories.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';

class BedRoom extends StatefulWidget {
  const BedRoom({super.key});

  static String id = "BedRoom";
  @override
  State<BedRoom> createState() => _BedRoomState();
}

class _BedRoomState extends State<BedRoom> {
  static bool fanisopened = false;
  static bool onlamb = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/bedroom.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  ontap: () {
                    Navigator.pop(context);
                  },
                  title: "Bed Room",
                ),
                const SizedBox(
                  height: 125,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      // fan
                      OnOffCategories(
                          isopened: fanisopened,
                          openbuttom: () {
                            setState(() {
                              fanisopened = true;
                            });
                            BlocProvider.of<MqttCubit>(context).publishMessage(
                                message: "on", topic: "home/bedRoomFan");
                          },
                          closebuttom: () {
                            setState(() {
                              fanisopened = false;
                            });
                            BlocProvider.of<MqttCubit>(context).publishMessage(
                                message: "off", topic: "home/bedRoomFan");
                          },
                          opentitle: "ON",
                          closetitle: "OFF",
                          gif: "assets/images/onfan.gif",
                          nogif: "assets/images/offFan.jpg"),
                      // lamb
                      OnOffCategories(
                          isopened: onlamb,
                          openbuttom: () {
                            setState(() {
                              onlamb = true;
                            });
                            BlocProvider.of<MqttCubit>(context).publishMessage(
                                message: "on", topic: "home/bedRoomLed");
                          },
                          closebuttom: () {
                            setState(() {
                              onlamb = false;
                            });
                            BlocProvider.of<MqttCubit>(context).publishMessage(
                                message: "off", topic: "home/bedRoomLed");
                          },
                          opentitle: "ON",
                          closetitle: "OFF",
                          gif: "assets/images/otherlamb.gif",
                          nogif: "assets/images/offotherlamb.jpg"),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
