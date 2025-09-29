import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({bool darkMode = false}) : super(ThemeState(darkMode));

  void toggleTheme() {
    emit(ThemeState(!state.isDarkMode));
  }

  void setDarkTheme() {
    emit(const ThemeState(false));
  }

  void setLightTheme() {
    emit(const ThemeState(true));
  }
}
