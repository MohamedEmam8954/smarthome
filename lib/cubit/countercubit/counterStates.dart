// ignore_for_file: public_member_api_docs, sort_constructors_first
class CounterStates {}

class DecreaseCounterStates extends CounterStates {
  int counter;
  DecreaseCounterStates({
    required this.counter,
  });
}

class InitialCounterStates extends CounterStates {}

class TimeCancelStates extends CounterStates {}
