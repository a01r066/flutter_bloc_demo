part of 'increment_bloc.dart';

class IncrementState extends Equatable {
  const IncrementState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [];

  @override
  String toString() {
    return "IncrementState(increment: $increment)";
  }

  factory IncrementState.initial(){
    return const IncrementState(increment: 0);
  }

  IncrementState copyWith({ int? increment }){
    return IncrementState(increment: increment ?? this.increment);
  }
}
