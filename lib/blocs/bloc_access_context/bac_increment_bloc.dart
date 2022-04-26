import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bac_increment_event.dart';
part 'bac_increment_state.dart';

class BacIncrementBloc extends Bloc<BacIncrementEvent, BacIncrementState> {
  BacIncrementBloc() : super(BacIncrementState.initial()) {
    on<ChangeBacIncrementEvent>((event, emit) {
      emit(state.copyWith(increment: state.increment + 1));
    });
  }
}
