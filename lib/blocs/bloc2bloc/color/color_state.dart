part of 'color_bloc.dart';

class BlocColorState extends Equatable {
  const BlocColorState({ required this.color});

  final Color color;

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    return "Color(color: $color)";
  }

  factory BlocColorState.initial(){
    return const BlocColorState(color: Colors.red);
  }

  BlocColorState copyWith({ Color? color }){
    return BlocColorState(color: color ?? this.color);
  }
}