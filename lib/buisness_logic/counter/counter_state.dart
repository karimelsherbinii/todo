part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

// class ChangeState extends CounterState {
//   int counter;
//   ChangeState(this.counter);
// }

class CounterPlus extends CounterState {}

class CounterMinus extends CounterState {}
