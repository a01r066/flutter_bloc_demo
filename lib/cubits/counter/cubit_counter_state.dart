import 'package:equatable/equatable.dart';

enum CubitCounterStatus {
  initial,
  loading,
  success,
  failure
}

class CubitCounterState extends Equatable {
  final CubitCounterStatus status;
  final int counter;
  final String error;

  const CubitCounterState({ required this.status, required this.counter, required this.error });

  @override
  List<Object?> get props => [status, counter, error];

  @override
  String toString() {
    return ('CounterState(status: $status, counter: $counter, error: $error)');
  }

  factory CubitCounterState.initial(){
    return const CubitCounterState(status: CubitCounterStatus.initial, counter: 0, error: '');
  }

  CubitCounterState copyWith({CubitCounterStatus? status, int? counter, String? error}){
    return CubitCounterState(
        status: status ?? this.status,
        counter: counter ?? this.counter,
        error: error ?? this.error);
  }
}