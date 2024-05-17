import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smarthome/cubit/countercubit/counterStates.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(InitialCounterStates());
  int counter = 30;
  late Timer timer;

  void startTimer() {
    const onsec = Duration(seconds: 1);
    timer = Timer.periodic(onsec, (timer) {
      if (counter == 0) {
        timer.cancel();
        emit(TimeCancelStates());
        counter = 30;
      } else {
        counter--;
        emit(DecreaseCounterStates(counter: counter));
      }
    });
  }
}
