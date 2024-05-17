import 'dart:async';
import 'dart:developer';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:local_auth/local_auth.dart';
import 'package:smarthome/cubit/fingerprintcubit/fingerprintcubitstate.dart';

class FingerPrintCubit extends Cubit<FingerPrintStates> {
  FingerPrintCubit() : super(InitalizeFingerPrintStates());
  final LocalAuthentication auth = LocalAuthentication();

  Future<void> authenticatewithbiometrices() async {
    try {
      final authenticated = await auth.authenticate(
        localizedReason: "Authenicate With FingerPrint",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      if (authenticated) {
        emit(SucessFingerPrintStates());
      }
    } on PlatformException catch (e) {
      emit(FailureFingerPrintStates());
      log(e.toString());
      return;
    }
  }
}
