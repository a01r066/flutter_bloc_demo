part of 'banr_increment_bloc.dart';

class BanrIncrementState extends Equatable {
  const BanrIncrementState({ required this.increment });

  final int increment;

  @override
  List<Object> get props => [increment];

  factory BanrIncrementState.initial(){
    return const BanrIncrementState(increment: 0);
  }

  BanrIncrementState copyWith({ int? increment }){
    return BanrIncrementState(increment: increment ?? this.increment);
  }
}