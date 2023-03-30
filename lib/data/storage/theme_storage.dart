import 'package:monis/presentation/bloc/theme/theme_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeStorage {
  Future<ThemeOption> getTheme();
  Future<void> changeTheme(ThemeOption theme);
}

class ThemeShareStorage extends ThemeStorage {
  static const _keyThemes = 'themes_shareds';
  Future<SharedPreferences> get _sharedPreferences =>
      SharedPreferences.getInstance();

  ///Devuelve una lista de Temas guardados con [_sharedPreferences], debe ser un solo tema
  @override
  Future<ThemeOption> getTheme() async {
    return ((await _sharedPreferences).getString(_keyThemes) ?? '')
        .toThemeOption;
  }

  ///Si está vacio [listTheme] se agrega el tema, si no se elimina y se agrega
  @override
  Future<void> changeTheme(ThemeOption theme) async {
    (await _sharedPreferences).setString(_keyThemes, theme.title);
  }
}
