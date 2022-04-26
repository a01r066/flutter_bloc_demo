part of 'cb_color_cubit.dart';

class CbColorState extends Equatable {
  const CbColorState({ required this.color });

  final Color color;

  @override
  List<Object> get props => [color];

  @override
  String toString() {
    return "CbColorState(color: $color)";
  }

  factory CbColorState.initial(){
    return const CbColorState(color: Colors.red);
  }

  CbColorState copyWith({ Color? color }){
    return CbColorState(color: color ?? this.color);
  }
}
