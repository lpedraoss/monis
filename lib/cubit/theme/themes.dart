part of 'theme_cubit.dart';

ThemeData getBlueTheme() {
  return ThemeData(
    primarySwatch: Colors.lightBlue,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.blue),
          bodyMedium: const TextStyle(color: Colors.blue),
          titleLarge: const TextStyle(color: Colors.blue),
          titleMedium: const TextStyle(color: Colors.blue),
          titleSmall: const TextStyle(color: Colors.blue),
        ),
  );
}

ThemeData getUwuTheme() {
  return ThemeData(
    primarySwatch: Colors.pink,
    textTheme: ThemeData.light().textTheme.copyWith(
          bodyLarge: const TextStyle(color: Colors.pinkAccent),
          bodyMedium: const TextStyle(color: Colors.pinkAccent),
          titleLarge: const TextStyle(color: Colors.pinkAccent),
          titleMedium: const TextStyle(color: Colors.pinkAccent),
          titleSmall: const TextStyle(color: Colors.pinkAccent),
        ),
  );
}

ThemeData getAmberTheme() => ThemeData(
      primarySwatch: Colors.amber,
    );

ThemeData getDarkTheme() => ThemeData.dark();
