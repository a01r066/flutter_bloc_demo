part of 'increment_cubit.dart';

class IncrementState extends Equatable {
  const IncrementState({ required this.increment});

  final int increment;

  @override
  List<Object?> get props => [increment];

  @override
  String toString() {
    return "Increment: $increment";
  }

  factory IncrementState.initial(){
    return const IncrementState(increment: 1);
  }

  IncrementState copyWith({ int? increment }){
    return IncrementState(increment: increment ?? this.increment);
  }
}