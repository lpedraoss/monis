import 'package:flutter/material.dart';
import 'package:monis/model/book_category.dart';
import 'package:monis/utils.dart';

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
    );
  }
}
