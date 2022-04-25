import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/blocs/bloc2bloc/color/color_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'increment_event.dart';
part 'increment_state.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  final ColorBloc colorBloc;
  int incrementSize = 1;

  late final StreamSubscription colorSubscription;

  IncrementBloc({ required this.colorBloc }) : super(IncrementState.initial()){
    colorSubscription = colorBloc.stream.listen((BlocColorState colorState) {
      if (colorState.color == Colors.red) {
        incrementSize = 1;
      } else if (colorState.color == Colors.green) {
        incrementSize = 10;
      } else if (colorState.color == Colors.blue) {
        incrementSize = 100;
      } else if (colorState.color == Colors.black) {
        incrementSize = -100;
        add(ChangeIncrementEvent());
      }
    });

    on<ChangeIncrementEvent>((ChangeIncrementEvent event, Emitter<IncrementState> emit){
      emit(state.copyWith(increment: state.increment + incrementSize));
    });
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
