part of 'theme_cubit.dart';

enum ThemeOption {
  pink(getUwuTheme),
  blue(getBlueTheme),
  dark(getDarkTheme),
  amber(getAmberTheme);

  const ThemeOption(
    this.getThemeData,
  );
  final ThemeData Function() getThemeData;
}
