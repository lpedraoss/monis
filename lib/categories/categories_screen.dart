import 'package:flutter/material.dart';
import 'package:monis/categories/book_category_screen.dart';
import 'package:monis/model/book_category.dart';
import 'package:monis/service/category_service.dart';
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
  final List<BookCategory> _categories =
      CategoryListService().getAllCategories();
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
      // ignore: prefer_const_constructors
      builder: (context) => BookCategoryScreen(category: category),
    ),
  );
}
