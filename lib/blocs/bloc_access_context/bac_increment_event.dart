part of 'bac_increment_bloc.dart';

abstract class BacIncrementEvent extends Equatable {
  const BacIncrementEvent();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ChangeBacIncrementEvent extends BacIncrementEvent {}
