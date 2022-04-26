part of 'bl_color_bloc.dart';

abstract class BlColorEvent extends Equatable {
  const BlColorEvent();

  @override
  List<Object?> get props => [];
}

class ChangeBlColorEvent extends BlColorEvent {}