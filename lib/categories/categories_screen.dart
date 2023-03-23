import 'package:flutter/material.dart';
import 'package:monis/categories/book_category_screen.dart';
import 'package:monis/model/book_category.dart';
import 'package:monis/utils.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BookCategoriesGrid();
  }
}

class BookCategoriesGrid extends StatelessWidget {
  BookCategoriesGrid({super.key});
  final List<BookCategory> _categories = [
    const BookCategory('1', 'Ciencia Ficcion', '#A9CCE3'),
    const BookCategory('2', 'Fantasia', '#C5F023'),
    const BookCategory('3', 'Drama', '#F0B3E1'),
    const BookCategory('4', 'Suspenso', '#efb810'),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
        itemCount: _categories.length,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return TileCategory(_categories[index]);
        },
      ),
    );
  }
}

//tile = baldosas
class TileCategory extends StatelessWidget {
  final BookCategory _category;
  const TileCategory(this._category, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
      borderRadius: BorderRadius.circular(4.0),
      onTap: () {
        _openPageCategory(context, _category);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.0),
          color: hexToColor(_category.colorBg),
        ),
        alignment: AlignmentDirectional.center,
        child: Text(
          _category.name,
          style: Theme.of(context).textTheme.titleLarge,
          textAlign: TextAlign.center,
        ),
      ),
    ));
  }
}

void _openPageCategory(BuildContext context, BookCategory category) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => BookCategoryScreen(
        category: category,
      ),
    ),
  );
}
/*
 const SizedBox(height: 20),
          Text(
            'Theme: ${themeCubit.state ? 'Dark' : 'Light'}',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            child: const Text('Toggle Theme'),
            onPressed: () => themeCubit.toggle(),
          ),*/