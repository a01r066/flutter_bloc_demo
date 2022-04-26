part of 'banr_increment_bloc.dart';

abstract class BanrIncrementEvent extends Equatable {
  const BanrIncrementEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeBanrIncrementEvent extends BanrIncrementEvent {}
