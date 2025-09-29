part of 'theme_cubit.dart';

class ThemeState extends Equatable {
  const ThemeState(this.isDarkMode);

  final bool isDarkMode;

  @override
  List<Object> get props => [isDarkMode];
}
