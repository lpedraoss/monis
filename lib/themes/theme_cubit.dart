import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_mode.dart';
part 'themes.dart';

class ThemeCubit extends Cubit<ThemeOption> {
  ThemeCubit() : super(ThemeOption.pink);
  void changeTheme(ThemeOption option) {
    emit(option);
  }

  // void changeTouwuTheme() => emit(ThemeOption.pink);
  // void changeToBlueTheme() => emit(ThemeOption.blue);
  // void changeToAmberTheme() => emit(ThemeOption.amber);
  // void changeToDarkTheme() => emit(ThemeOption.dark);
}
