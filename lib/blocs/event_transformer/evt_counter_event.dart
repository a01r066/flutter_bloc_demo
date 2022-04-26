part of 'evt_counter_bloc.dart';

abstract class EvtCounterEvent extends Equatable {
  const EvtCounterEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class IncrementEvtCounterEvent extends EvtCounterEvent {}
class DecrementEvtCounterEvent extends EvtCounterEvent {}
