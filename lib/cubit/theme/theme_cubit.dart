import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/service/theme_service.dart';

part 'theme_mode.dart';
part 'themes.dart';

class ThemeCubit extends Cubit<ThemeOption> {
  final ThemeStorageService _service;
  late ThemeOption themeOption;
  ThemeCubit(this._service) : super(ThemeOption.pink);
  void changeTheme(ThemeOption option) async {
    await _service.changeTheme(option);
    emit(option);
  }

  void getTheme() async {
    emit((await _service.getTheme()));
  }
}
