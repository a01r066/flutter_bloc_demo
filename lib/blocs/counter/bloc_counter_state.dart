import 'package:equatable/equatable.dart';

enum BlocCounterStatus {
  initial,
  loading,
  success,
  failure
}

class BlocCounterState extends Equatable {
  final BlocCounterStatus status;
  final int counter;
  final String error;

  const BlocCounterState({ required this.status, required this.counter, required this.error });

  @override
  List<Object?> get props => [status, counter, error];

  @override
  String toString() {
    return ('BlocCounterState(status: $status, counter: $counter, error: $error)');
  }

  factory BlocCounterState.initial(){
    return const BlocCounterState(status: BlocCounterStatus.initial, counter: 0, error: '');
  }

  BlocCounterState copyWith({BlocCounterStatus? status, int? counter, String? error}){
    return BlocCounterState(
        status: status ?? this.status,
        counter: counter ?? this.counter,
        error: error ?? this.error);
  }
}