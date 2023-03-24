import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/themes/theme_cubit.dart';

class SwitcherTheme extends StatelessWidget {
  const SwitcherTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = BlocProvider.of<ThemeCubit>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Temas a elegir',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeTheme(
                ThemeOption.pink,
              );
            },
            child: const Text('UwU Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeTheme(
                ThemeOption.blue,
              );
            },
            child: const Text('Blue Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeTheme(
                ThemeOption.amber,
              );
            },
            child: const Text('Amber Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeTheme(
                ThemeOption.dark,
              );
            },
            child: const Text('Dark Theme'),
          ),
        ],
      ),
    );
  }
}
