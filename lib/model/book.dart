import 'package:flutter/widgets.dart';

class Book {
  final int id;
  final String tittle;
  final String author;
  final String description;
  final String coverUrl;

  const Book(
      this.id, this.tittle, this.author, this.description, this.coverUrl);
}
