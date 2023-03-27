import 'package:monis/storage/theme_storage.dart';
import 'package:monis/themes/theme_cubit.dart';

abstract class ThemeService {
  Future<ThemeOption> getTheme();

  Future<void> changeTheme(String themeName);
}

class ThemeStorageService extends ThemeService {
  final _storage = ThemeShareStorage();
  @override
  Future<void> changeTheme(String themeName) async =>
      await _storage.changeTheme(themeName);

  @override
  Future<ThemeOption> getTheme() async {
    String? option = await _getValue();

    switch (option) {
      case ('UwU Theme'):
        return ThemeOption.pink;
      case 'Amber Theme':
        return ThemeOption.amber;
      case 'Dark Theme':
        return ThemeOption.dark;
      case 'Blue Theme':
        return ThemeOption.blue;

      default:
        return ThemeOption.dark;
    }
  }

  Future<String?> _getValue() async {
    String? value;
    final theme = await _storage.getTheme();
    for (var element in theme) {
      value = element;
    }
    return value;
  }
}
