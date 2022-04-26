import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bl_increment_event.dart';
part 'bl_increment_state.dart';

class BlIncrementBloc extends Bloc<BlIncrementEvent, BlIncrementState> {
  BlIncrementBloc() : super(BlIncrementState.initial()) {
    on<ChangeBlIncrementEvent>((event, emit) {
      emit(state.copyWith(increment: state.increment + event.incrementSize));
    });
  }
}
