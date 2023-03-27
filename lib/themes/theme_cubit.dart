import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/service/theme_service.dart';

part 'theme_mode.dart';
part 'themes.dart';

class ThemeCubit extends Cubit<ThemeOption> {
  var service = ThemeStorageService();
  late ThemeOption themeOption;
  //final initTheme = getTheme().getThemeData;
  ThemeCubit() : super(ThemeOption.pink) {
    getTheme();
  }
  void changeTheme(ThemeOption option) async {
    // void changeTheme(String option) async {
    final themeName = option.title;

    await service.changeTheme(themeName);
    themeOption = await service.getTheme();
    emit(themeOption);
  }

  void getTheme() async {
    themeOption = await service.getTheme();
    emit(themeOption);
  }

  // void changeTouwuTheme() => emit(ThemeOption.pink);
  // void changeToBlueTheme() => emit(ThemeOption.blue);
  // void changeToAmberTheme() => emit(ThemeOption.amber);
  // void changeToDarkTheme() => emit(ThemeOption.dark);
}
