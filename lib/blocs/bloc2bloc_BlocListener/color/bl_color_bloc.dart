import 'dart:async';
import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'bl_color_event.dart';

part 'bl_color_state.dart';

class BlColorBloc extends Bloc<BlColorEvent, BlColorState> {
  BlColorBloc() : super(BlColorState.initial()) {
    on<ChangeBlColorEvent>(
      (event, emit) {
        if (state.color == Colors.red) {
          emit(state.copyWith(color: Colors.green));
        } else if (state.color == Colors.green) {
          emit(state.copyWith(color: Colors.blue));
        } else if (state.color == Colors.blue) {
          emit(state.copyWith(color: Colors.black));
        } else if (state.color == Colors.black) {
          emit(state.copyWith(color: Colors.red));
        }
      },
    );
  }
}
