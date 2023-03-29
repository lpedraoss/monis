import 'package:flutter/material.dart';
import 'package:monis/pages/book_screen/book_screen.dart';
import 'package:monis/model/book_category.dart';

import 'package:monis/utils/utils.dart';

class BookCategoryScreen extends StatelessWidget {
  const BookCategoryScreen({super.key, required this.category});
  final BookCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: hexToColor(category.colorBg),
      ),
      body: BookScreen(
        category: category.name,
      ),
    );
  }
}
