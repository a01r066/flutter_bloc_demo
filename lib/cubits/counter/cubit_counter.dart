import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit_counter_state.dart';

class CounterImpl extends Cubit<CubitCounterState>{
  CounterImpl() : super(CubitCounterState.initial());

  increment(){
    final newState = state.copyWith(counter: state.counter + 1);
    emit(newState);
  }

  decrement(){
    final newState = state.copyWith(counter: state.counter -1);
    emit(newState);
  }
}
