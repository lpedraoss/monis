import 'package:monis/storage/theme_storage.dart';
import 'package:monis/themes/theme_cubit.dart';

abstract class ThemeService {
  Future<ThemeOption> getTheme();

  Future<void> changeTheme(ThemeOption option);
}

class ThemeStorageService extends ThemeService {
  final _storage = ThemeShareStorage();
  @override
  Future<void> changeTheme(ThemeOption option) async {
    await _storage.changeTheme(option);
  }

  @override
  Future<ThemeOption> getTheme() {
    return _storage.getTheme();
  }
}
