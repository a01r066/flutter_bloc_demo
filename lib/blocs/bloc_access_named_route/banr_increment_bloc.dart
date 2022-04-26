import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'banr_increment_event.dart';
part 'banr_increment_state.dart';

class BanrIncrementBloc extends Bloc<BanrIncrementEvent, BanrIncrementState> {
  BanrIncrementBloc() : super(BanrIncrementState.initial()) {
    on<ChangeBanrIncrementEvent>((event, emit) {
      emit(state.copyWith(increment: state.increment + 1));
    });
  }
}
