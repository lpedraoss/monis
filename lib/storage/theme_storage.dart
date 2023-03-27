import 'package:shared_preferences/shared_preferences.dart';

abstract class ThemeStorage {
  Future<void> _addTheme(String themeName);
  Future<void> _removeTheme();
  Future<List<String>> getTheme();
  Future<void> changeTheme(String themeName);
}

class ThemeShareStorage extends ThemeStorage {
  static const _keyThemes = 'themes_shareds';
  Future<SharedPreferences> get _sharedPreferences =>
      SharedPreferences.getInstance();

  ///Devuelve una lista de Temas guardados con [_sharedPreferences], debe ser un solo tema
  @override
  Future<List<String>> getTheme() async {
    return (await _sharedPreferences).getStringList(_keyThemes) ?? [];
  }

  @override
  Future<void> _addTheme(String themeName) async {
    final list = await getTheme()
      ..add(themeName);
    (await _sharedPreferences).setStringList(_keyThemes, list);
  }

  @override
  Future<void> _removeTheme() async {
    final listTheme = await getTheme()
      ..removeLast();

    (await _sharedPreferences).setStringList(_keyThemes, listTheme);
  }

  ///Si está vacio [listTheme] se agrega el tema, si no se elimina y se agrega
  @override
  Future<void> changeTheme(String themeName) async {
    final listTheme = await getTheme();
    if (listTheme.isEmpty) {
      await _addTheme(themeName);
    } else {
      await _removeTheme();
      await _addTheme(themeName);
    }
  }
}
