import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/components/sucessfingerprint.dart';
import 'package:smarthome/cubit/countercubit/counterStates.dart';
import 'package:smarthome/cubit/countercubit/countercubit.dart';
import 'package:smarthome/cubit/fingerprintcubit/fingerprintcubit.dart';
import 'package:smarthome/cubit/fingerprintcubit/fingerprintcubitstate.dart';
import 'package:smarthome/cubit/mqttcubit/mqttcubit.dart';
import 'package:smarthome/helper/constant.dart';
import 'package:smarthome/views/homeview.dart';

class FingerPrintView extends StatefulWidget {
  const FingerPrintView({super.key});
  static String id = "FingerPrintView";

  @override
  State<FingerPrintView> createState() => _FingerPrintViewState();
}

class _FingerPrintViewState extends State<FingerPrintView> {
  int count = 0;
  @override
  void initState() {
    BlocProvider.of<MqttCubit>(context).connect();
    super.initState();
  }

  @override
  // void initState() {
  //   super.initState();
  //   auth.isDeviceSupported().then((bool issupported) {
  //     setState(() {
  //       supportState =
  //           issupported ? SupportState.supported : SupportState.unsupported;
  //     });
  //   });
  //   checkBiometric();
  //   getAvailableBiometrices();
  // }

  // Future<void> checkBiometric() async {
  //   late bool cancheckbiometric;
  //   try {
  //     cancheckbiometric = await auth.canCheckBiometrics;
  //     log("biometric supported $cancheckbiometric");
  //   } on PlatformException catch (e) {
  //     log(e.toString());
  //     cancheckbiometric = false;
  //   }
  // }

  // Future<void> getAvailableBiometrices() async {
  //   late List<BiometricType> biometrictypes;
  //   try {
  //     biometrictypes = await auth.getAvailableBiometrics();
  //     log("supported biometric $biometrictypes");
  //   } on PlatformException catch (e) {
  //     log(e.toString());
  //   }
  //   if (!mounted) {
  //     return;
  //   }
  //   setState(() {
  //     availablebiometric = biometrictypes;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FingerPrintCubit(),
        ),
        BlocProvider(
          create: (context) => CounterCubit(),
        ),
      ],
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/fingerprintview.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: BlocBuilder<CounterCubit, CounterStates>(
            builder: (context, state) {
              return BlocConsumer<FingerPrintCubit, FingerPrintStates>(
                listener: (context, state) {
                  if (state is SucessFingerPrintStates) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ),
                    );
                  }
                  if (state is FailureFingerPrintStates) {
                    BlocProvider.of<CounterCubit>(context).startTimer();
                  }
                },
                builder: (context, state) {
                  if (state is FailureFingerPrintStates) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SucessFingerPrint(
                          ontap: count == 0
                              ? BlocProvider.of<FingerPrintCubit>(context)
                                  .authenticatewithbiometrices
                              : () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        BlocBuilder<CounterCubit, CounterStates>(
                          builder: (context, state) {
                            if (state is DecreaseCounterStates) {
                              count = state.counter;
                              return Text(
                                "Wait for: ${state.counter} seconds",
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: fontfamily,
                                ),
                              );
                            }
                            return Container();
                          },
                        )
                      ],
                    );
                  } else {
                    return SucessFingerPrint(
                      ontap: BlocProvider.of<FingerPrintCubit>(context)
                          .authenticatewithbiometrices,
                    );
                  }
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
