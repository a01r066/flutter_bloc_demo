part of 'color_cubit.dart';

class ColorState extends Equatable {
  final Color color;

  const ColorState({ required this.color });

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    return "Color(color: $color)";
  }

  factory ColorState.initial(){
    return const ColorState(color: Colors.red);
  }

  ColorState copyWith({ Color? color }){
    return ColorState(color: color ?? this.color);
  }
}
