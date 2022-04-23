import 'package:equatable/equatable.dart';

class BlocCounterEvent extends Equatable {
  const BlocCounterEvent();

  @override
  List<Object?> get props => [];
}

class IncrementCounterEvent extends BlocCounterEvent {}

class DecrementCounterEvent extends BlocCounterEvent {}