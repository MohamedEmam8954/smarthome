import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/components/CustomAppBar.dart';
import 'package:smarthome/components/on/onoffcategories.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';

class DoorView extends StatefulWidget {
  const DoorView({super.key});
  static String id = "Door";

  @override
  State<DoorView> createState() => _DoorViewState();
}

class _DoorViewState extends State<DoorView> {
  static bool isopened = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              "assets/images/door.jpeg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(
                ontap: () {
                  Navigator.pop(context);
                },
                title: "Door",
              ),
              SizedBox(
                height: 600,
                child: OnOffCategories(
                    isopened: isopened,
                    openbuttom: () {
                      setState(() {
                        isopened = true;
                      });
                      BlocProvider.of<MqttCubit>(context)
                          .publishMessage(message: "open", topic: "home/door");
                    },
                    closebuttom: () {
                      setState(() {
                        isopened = false;
                      });
                      BlocProvider.of<MqttCubit>(context)
                          .publishMessage(message: "close", topic: "home/door");
                    },
                    opentitle: "Open",
                    closetitle: "Close",
                    gif: "assets/images/ondoor.gif",
                    nogif: "assets/images/closedoor.jpg"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
