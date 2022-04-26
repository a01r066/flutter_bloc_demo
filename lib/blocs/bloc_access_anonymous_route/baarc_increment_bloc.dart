import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'baarc_increment_event.dart';
part 'baarc_increment_state.dart';

class BaarcIncrementBloc extends Bloc<BaarcIncrementEvent, BaarcIncrementState> {
  BaarcIncrementBloc() : super(BaarcIncrementState.initial()) {
    on<ChangeBaarcIncrementEvent>((event, emit) {
      emit(state.copyWith(increment: state.increment + 1));
    });
  }
}
