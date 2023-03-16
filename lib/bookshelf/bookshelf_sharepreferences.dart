import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/model/book.dart';
import 'package:shared_preferences/shared_preferences.dart';

var bookSave = 'book';
void bookShelfSave(BuildContext context, String bookId) {
  SharedPreferences.getInstance().then((books) {
    var book = books.getStringList(bookSave) ?? [];
    book.add(bookId);
    books.setStringList(bookSave, [bookId]);
    var bookShelfBloc = context.read<BookshelfBloc>();
    bookShelfBloc.add(AddBookToBookshelf(bookId));
  });
}
/*
Future<List<String>> getBookShelf(BuildContext context) async {
  var books = await SharedPreferences.getInstance();
  var bookId = books.getStringList(bookSave) ?? [];
  return BookshelfState().bookIds;
}
*/