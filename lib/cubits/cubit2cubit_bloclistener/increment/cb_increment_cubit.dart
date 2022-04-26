import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cb_increment_state.dart';

class CbIncrementCubit extends Cubit<CbIncrementState> {
  CbIncrementCubit() : super(CbIncrementState.initial());

  changeIncrement(int incrementSize){
    emit(state.copyWith(increment: state.increment + incrementSize));
  }
}
