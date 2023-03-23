import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/utils/theme_mode.dart' as theme;

class ThemeCubit extends Cubit<theme.ThemeMode> {
  ThemeCubit() : super(theme.ThemeMode.pink);
  void changeTouwuTheme() => emit(theme.ThemeMode.pink);
  void changeToBlueTheme() => emit(theme.ThemeMode.blue);
  void changeToAmberTheme() => emit(theme.ThemeMode.amber);
}

class ThemeProvider with ChangeNotifier {
  final uwuTheme = ThemeData(
    primarySwatch: Colors.pink,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.pinkAccent),
          bodyMedium: const TextStyle(color: Colors.pinkAccent),
          titleLarge: const TextStyle(color: Colors.pinkAccent),
          titleMedium: const TextStyle(color: Colors.pinkAccent),
          titleSmall: const TextStyle(color: Colors.pinkAccent),
        ),
  );

  final blueTheme = ThemeData(
    primarySwatch: Colors.lightBlue,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.blue),
          bodyMedium: const TextStyle(color: Colors.blue),
          titleLarge: const TextStyle(color: Colors.blue),
          titleMedium: const TextStyle(color: Colors.blue),
          titleSmall: const TextStyle(color: Colors.blue),
        ),
  );

  final amberTheme = ThemeData(
    primarySwatch: Colors.amber,
  );
  var currentTheme = ThemeData(
    primarySwatch: Colors.pink,
  );

  ThemeData get current => currentTheme;

  void setTheme(ThemeData theme) {
    currentTheme = theme;
    notifyListeners();
  }
}
