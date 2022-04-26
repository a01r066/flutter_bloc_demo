part of 'bac_increment_bloc.dart';

class BacIncrementState extends Equatable {
  const BacIncrementState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [increment];

  @override
  String toString() {
    return "BacIncrementState(increment: $increment)";
  }

  factory BacIncrementState.initial(){
    return const BacIncrementState(increment: 0);
  }

  BacIncrementState copyWith({ int? increment }){
    return BacIncrementState(increment: increment ?? this.increment);
  }
}