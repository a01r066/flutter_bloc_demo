import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cubit_theme_state.dart';

class ThemeCubit extends Cubit<CubitThemeState> {
  ThemeCubit() : super(CubitThemeState.initial());

  changeCubitTheme(int randInt){
    if(randInt % 2 == 0){
      emit(state.copyWith(appTheme: CubitAppTheme.light));
    } else {
      emit(state.copyWith(appTheme: CubitAppTheme.dark));
    }
  }
}
