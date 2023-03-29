import 'package:flutter/material.dart';
import 'package:monis/book_screen/book_screen.dart';
import 'package:monis/item_books/item_books.dart';
import 'package:monis/model/book.dart';
import 'package:monis/model/book_category.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils.dart';
import 'package:monis/utils/golbal_widget.dart';

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
