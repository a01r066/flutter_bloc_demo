import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

part 'evt_counter_event.dart';

part 'evt_counter_state.dart';

class EvtCounterBloc extends Bloc<EvtCounterEvent, EvtCounterState> {
  EvtCounterBloc() : super(EvtCounterState.initial()) {
    // on<IncrementEvtCounterEvent>(_incrementEvt, transformer: sequential());
    // on<DecrementEvtCounterEvent>(_decrementEvt, transformer: sequential());

    // Event transformer
    on<EvtCounterEvent>((event, emit) async {
      if (event is IncrementEvtCounterEvent) {
        await _incrementEvt(event, emit);
      } else if (event is DecrementEvtCounterEvent) {
        await _decrementEvt(event, emit);
      }
    }, transformer: sequential());
  }

  Future<void> _incrementEvt(event, emit) async {
    await Future.delayed(const Duration(seconds: 4));
    emit(state.copyWith(increment: state.increment + 1));
  }

  Future<void> _decrementEvt(event, emit) async {
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(increment: state.increment - 1));
  }
}
