part of 'evt_counter_bloc.dart';

class EvtCounterState extends Equatable {
  const EvtCounterState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [increment];

  @override
  String toString() {
    return "EvtCounterState(increment: $increment)";
  }

  factory EvtCounterState.initial(){
    return const EvtCounterState(increment: 0);
  }

  EvtCounterState copyWith({ int? increment }){
    return EvtCounterState(increment: increment ?? this.increment);
  }
}
