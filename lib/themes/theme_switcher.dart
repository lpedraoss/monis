import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/themes/theme.dart';

class SwitcherTheme extends StatelessWidget {
  const SwitcherTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final themeCubit = context.watch<ThemeCubit>();
    final themeProvider = context.read<ThemeProvider>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Temas a elegir',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeTouwuTheme();
              themeProvider.setTheme(themeProvider.uwuTheme);
            },
            child: const Text('UwU Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeToBlueTheme();
              themeProvider.setTheme(themeProvider.blueTheme);
            },
            child: const Text('Blue Theme'),
          ),
          ElevatedButton(
            onPressed: () {
              themeCubit.changeToAmberTheme();
              themeProvider.setTheme(themeProvider.amberTheme);
            },
            child: const Text('Amber Theme'),
          ),
        ],
      ),
    );
  }
}
