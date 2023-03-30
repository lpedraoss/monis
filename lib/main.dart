
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/domain/service/bookshelf_service.dart';
import 'package:monis/domain/service/theme_service.dart';
import 'package:monis/presentation/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/presentation/bloc/pruebas_future/pruebas_future_cubit.dart';
import 'package:monis/presentation/bloc/theme/theme_cubit.dart';
import 'package:monis/presentation/view/bookshelf/bookshelf_screen.dart';
import 'package:monis/presentation/view/categories/categories_screen.dart';
import 'package:monis/presentation/view/home/home_screen.dart';
import 'package:monis/presentation/view/themes/theme_switcher.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MonisApp());
}

class MonisApp extends StatelessWidget {
  const MonisApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => BookShelfStorageService(),
        ),
        BlocProvider<ThemeCubit>(
          create: (context) => ThemeCubit(
            ThemeStorageService(),
          )..getTheme(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) {
              return BookshelfBloc(
                service: BookShelfStorageService(),
              )..add(const StartShelfEvent());
            },
          ),
          BlocProvider(
            create: (context) => ThemeCubit(
              ThemeStorageService(),
            )..getTheme(),
          ),
          BlocProvider(
            create: (context) => PruebasFutureCubit(
            ),
          ),
        ],
        child: const MyApp(),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeOption>(
      builder: (context, state) {
        return MaterialApp(
          theme: state.getThemeData(),
          home: const BottonNavigationWidget(),
        );
      },
    );
  }
}

class BottonNavigationWidget extends StatefulWidget {
  const BottonNavigationWidget({super.key});

  @override
  State<BottonNavigationWidget> createState() => _BottonNavigationWidgetState();
}

class _BottonNavigationWidgetState extends State<BottonNavigationWidget> {
  int _selectedIndex = 0;
  static const List<Widget> _sections = [
    HomeScreen(),
    CategoriesScreen(),
    BookshelfScreen(),
    SwitcherTheme(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Monis App Library',
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        unselectedItemColor:
            Theme.of(context).colorScheme.onSurface.withOpacity(0.6),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library), label: 'Biblioteca'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories), label: 'Mi estante'),
          BottomNavigationBarItem(
              icon: Icon(Icons.switch_access_shortcut), label: 'Themes'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      body: _sections[_selectedIndex],
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
