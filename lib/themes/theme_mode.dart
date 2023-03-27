part of 'theme_cubit.dart';

enum ThemeOption {
  pink(getUwuTheme, 'UwU Theme'),
  blue(getBlueTheme, 'Blue Theme'),
  dark(getDarkTheme, 'Dark Theme'),
  amber(getAmberTheme, 'Amber Theme');

  const ThemeOption(
    this.getThemeData,
    this.title,
  );
  final ThemeData Function() getThemeData;

  final String title;
}
