part of 'bl_color_bloc.dart';

class BlColorState extends Equatable {
  const BlColorState({required this.color});

  final Color color;

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    return "BlColorState(color: $color)";
  }

  factory BlColorState.initial(){
    return const BlColorState(color: Colors.red);
  }

  BlColorState copyWith({ Color? color }){
    return BlColorState(color: color ?? this.color);
  }
}
