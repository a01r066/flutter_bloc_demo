import 'package:bloc_demo/blocs/bloc_counter_event.dart';
import 'package:bloc_demo/blocs/bloc_counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCounter extends Bloc<BlocCounterEvent, BlocCounterState> {
  BlocCounter() : super(BlocCounterState.initial()) {
    on<IncrementCounterEvent>((event, emit) {
      emit(state.copyWith(counter: state.counter + 1));
    });

    // on<DecrementCounterEvent>((event, emit){
    //   emit(state.copyWith(counter: state.counter -1));
    // });
    on<DecrementCounterEvent>(_decrementCounter);
  }

  // Separated to used for complex methods
  _decrementCounter(DecrementCounterEvent event, Emitter<BlocCounterState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
  }
}
