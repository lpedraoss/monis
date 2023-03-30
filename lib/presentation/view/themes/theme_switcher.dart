import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/presentation/bloc/theme/theme_cubit.dart';

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
          ...ThemeOption.values.map<Widget>(
            (e) => ElevatedButton(
              onPressed: () {
                themeCubit.changeTheme(e);
              },
              child: Text(e.title),
            ),
          ),
        ],
      ),
    );
  }
}
