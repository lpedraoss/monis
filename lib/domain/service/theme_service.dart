
import 'package:monis/presentation/bloc/theme/theme_cubit.dart';
import 'package:monis/data/storage/theme_storage.dart';

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
