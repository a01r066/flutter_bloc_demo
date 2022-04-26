part of 'baarc_increment_bloc.dart';

abstract class BaarcIncrementEvent extends Equatable {
  const BaarcIncrementEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeBaarcIncrementEvent extends BaarcIncrementEvent {}
