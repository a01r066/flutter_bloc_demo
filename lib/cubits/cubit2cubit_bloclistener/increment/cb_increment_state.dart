part of 'cb_increment_cubit.dart';

class CbIncrementState extends Equatable {
  const CbIncrementState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [increment];

  @override
  String toString() {
    return "CbIncrementState(increment: $increment)";
  }

  factory CbIncrementState.initial(){
    return const CbIncrementState(increment: 0);
  }

  CbIncrementState copyWith({ int? increment }){
    return CbIncrementState(increment: increment ?? this.increment);
  }
}