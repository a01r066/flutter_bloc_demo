part of 'theme_cubit.dart';

enum CubitAppTheme {
  light,
  dark
}

class CubitThemeState extends Equatable {
  final CubitAppTheme appTheme;
  const CubitThemeState({ required this.appTheme});

  @override
  List<Object?> get props => [appTheme];

  @override
  String toString() {
    return "Theme: $appTheme";
  }

  factory CubitThemeState.initial(){
    return const CubitThemeState(appTheme: CubitAppTheme.light);
  }

  CubitThemeState copyWith({ CubitAppTheme? appTheme }){
    return CubitThemeState(appTheme: appTheme ?? this.appTheme);
  }
}
