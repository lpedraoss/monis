part of 'theme_cubit.dart';

enum ThemeOption {
  pink(getUwuTheme, 'UwU Theme'),
  blue(getBlueTheme, 'Blue Theme'),
  dark(getDarkTheme, 'Amber Theme'),
  amber(getAmberTheme, 'Dark Theme');

  const ThemeOption(
    this.getThemeData,
    this.title,
  );
  final ThemeData Function() getThemeData;
  final String title;
}
