import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_demo/cubits/cubit2cubit/color/color_cubit.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'increment_state.dart';

class IncrementCubit extends Cubit<IncrementState> {
  int incrementSize = 1;
  final ColorCubit colorCubit;

  late final StreamSubscription colorSubscription;

  IncrementCubit({required this.colorCubit}) : super(IncrementState.initial()) {
    colorSubscription = colorCubit.stream.listen(
      (ColorState colorState) {
        if (colorState.color == Colors.red) {
          incrementSize = 1;
        } else if (colorState.color == Colors.green) {
          incrementSize = 10;
        } else if (colorState.color == Colors.blue) {
          incrementSize = 100;
        } else if (colorState.color == Colors.black) {
          emit(state.copyWith(increment: state.increment - 100));
          incrementSize = -100;
        }
      },
    );
  }

  changeCounter(){
    emit(state.copyWith(increment: state.increment + incrementSize));
  }

  @override
  Future<void> close() {
    colorSubscription.cancel();
    return super.close();
  }
}
