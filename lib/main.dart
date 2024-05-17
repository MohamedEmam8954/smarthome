import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/Services/apiservices.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';
import 'package:smarthome/models/blocobserver.dart';
import 'package:smarthome/views/bedRoom.dart';
import 'package:smarthome/views/doorview.dart';
import 'package:smarthome/views/fingerprintview.dart';
import 'package:smarthome/views/introductionview.dart';
import 'package:smarthome/views/livingingroomview.dart';
import 'package:smarthome/views/officeview.dart';

void main() {
  ApiServices(Dio()).weatherdata();
  Bloc.observer = MyBlocObserver();
  runApp(const SmartHome());
}

class SmartHome extends StatelessWidget {
  const SmartHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MqttCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const IntroductionScreen(),
        routes: {
          FingerPrintView.id: (context) => const FingerPrintView(),
          DoorView.id: (context) => const DoorView(),
          LivingRoomView.id: (context) => const LivingRoomView(),
          Officeview.id: (context) => const Officeview(),
          BedRoom.id: (context) => const BedRoom(),
        },
      ),
    );
  }
}
