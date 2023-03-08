import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/bookshelf/bookshelf_screen.dart';
import 'package:monis/categories/categories_screen.dart';
import 'package:monis/home/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MonisApp());
}

class MonisApp extends StatelessWidget {
  const MonisApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BookshelfBloc(
        BookshelfState(),
      ),
      child: MaterialApp(
        title: 'Monis',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const BottonNavigationWidget(),
      ),
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
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booksy'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_library), label: 'Biblioteca'),
          BottomNavigationBarItem(
              icon: Icon(Icons.auto_stories), label: 'Mi estante'),
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
