import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/components/CustomAppBar.dart';
import 'package:smarthome/components/on/onoffcategories.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';

class Officeview extends StatefulWidget {
  const Officeview({super.key});
  static String id = "Officeview";

  @override
  State<Officeview> createState() => _OfficeviewState();
}

class _OfficeviewState extends State<Officeview> {
  @override
  void initState() {
    super.initState();
  }

  static bool fanisopened = false;
  static bool onlamb = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/office.jpeg",
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
                  title: "Office",
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
                                message: "on", topic: "home/officeFan");
                          },
                          closebuttom: () {
                            setState(() {
                              fanisopened = false;
                            });
                            BlocProvider.of<MqttCubit>(context).publishMessage(
                                message: "off", topic: "home/officeFan");
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
                                message: "on", topic: "home/officeLed");
                          },
                          closebuttom: () {
                            setState(() {
                              onlamb = false;
                            });
                            BlocProvider.of<MqttCubit>(context).publishMessage(
                                message: "off", topic: "home/officeLed");
                          },
                          opentitle: "ON",
                          closetitle: "OFF",
                          gif: "assets/images/onabajora.gif",
                          nogif: "assets/images/offabajora.jpg"),
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
