part of 'bl_increment_bloc.dart';

class BlIncrementState extends Equatable {
  const BlIncrementState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [increment];

  @override
  String toString() {
    return "BlInCrementState(increment: $increment)";
  }

  factory BlIncrementState.initial(){
    return const BlIncrementState(increment: 0);
  }

  BlIncrementState copyWith({ int? increment }){
    return BlIncrementState(increment: increment ?? this.increment);
  }
}