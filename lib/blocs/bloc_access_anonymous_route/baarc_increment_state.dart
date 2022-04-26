part of 'baarc_increment_bloc.dart';

class BaarcIncrementState extends Equatable {
  const BaarcIncrementState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [increment];

  factory BaarcIncrementState.initial(){
    return const BaarcIncrementState(increment: 0);
  }

  BaarcIncrementState copyWith({ int? increment }){
    return BaarcIncrementState(increment: increment ?? this.increment);
  }
}