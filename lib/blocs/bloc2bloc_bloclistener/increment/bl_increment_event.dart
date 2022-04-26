part of 'bl_increment_bloc.dart';

abstract class BlIncrementEvent extends Equatable {
  const BlIncrementEvent();

  @override
  List<Object?> get props => [];
}

class ChangeBlIncrementEvent extends BlIncrementEvent {
  final int incrementSize;
  const ChangeBlIncrementEvent({ required this.incrementSize });
}
