import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'cb_color_state.dart';

class CbColorCubit extends Cubit<CbColorState> {
  CbColorCubit() : super(CbColorState.initial());

  changeColor(){
    if(state.color == Colors.red){
      emit(state.copyWith(color: Colors.green));
    } else if(state.color == Colors.green){
      emit(state.copyWith(color: Colors.blue));
    } else if(state.color == Colors.blue){
      emit(state.copyWith(color: Colors.black));
    } else {
      emit(state.copyWith(color: Colors.red));
    }
  }
}
