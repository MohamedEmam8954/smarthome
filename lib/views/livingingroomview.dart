import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/components/CustomAppBar.dart';
import 'package:smarthome/components/on/onoffcategories.dart';
import 'package:smarthome/components/on/reultcategory.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';
import 'package:smarthome/cubit/mqttcubit/mqttstates.dart';

class LivingRoomView extends StatefulWidget {
  const LivingRoomView({super.key});
  static String id = "LivingRoom";

  @override
  State<LivingRoomView> createState() => _LivingRoomViewState();
}

class _LivingRoomViewState extends State<LivingRoomView> {
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
              "assets/images/livingroom.jpeg",
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
                  title: "Living Room",
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
                              message: "on", topic: "home/livingRoomFan");
                        },
                        closebuttom: () {
                          setState(() {
                            fanisopened = false;
                          });
                          BlocProvider.of<MqttCubit>(context).publishMessage(
                              message: "off", topic: "home/livingRoomFan");
                        },
                        opentitle: "ON",
                        closetitle: "OFF",
                        gif: "assets/images/onfan.gif",
                        nogif: "assets/images/offFan.jpg",
                      ),
                      // lamb
                      OnOffCategories(
                        isopened: onlamb,
                        openbuttom: () {
                          setState(() {
                            onlamb = true;
                          });
                          BlocProvider.of<MqttCubit>(context).publishMessage(
                              message: "on", topic: "home/livingRoomLed");
                        },
                        closebuttom: () {
                          setState(() {
                            onlamb = false;
                          });
                          BlocProvider.of<MqttCubit>(context).publishMessage(
                              message: "off", topic: "home/livingRoomLed");
                        },
                        opentitle: "ON",
                        closetitle: "OFF",
                        gif: "assets/images/onlight-bulb.gif",
                        nogif: "assets/images/offlamb.jpg",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: BlocBuilder<MqttCubit, MqttStates>(
                    builder: (context, state) {
                      String temperature =
                          BlocProvider.of<MqttCubit>(context).temperature;
                      String gas = BlocProvider.of<MqttCubit>(context).gas;

                      return Row(
                        children: [
                          // temp
                          ResultCategory(
                            title: "$temperature℃",
                            image: "assets/images/ontemperature.gif",
                          ),
                          // tank
                          ResultCategory(
                            title: "$gas%",
                            image: "assets/images/ontank.gif",
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
