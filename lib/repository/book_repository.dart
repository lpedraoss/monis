import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:monis/model/book.dart';

///Show [books] from firebase
class BookRepository {
  ///conect the DB to flutter app with reference [booksRef]
  final _booksRef =
      FirebaseFirestore.instance.collection('books').withConverter(
            fromFirestore: (snapshot, _) =>
                Book.fromJson(snapshot.id, snapshot.data()!),
            toFirestore: (book, _) => book.toJson(),
          );

  ///find the last [booksQuantity] books from [_booksRef]
  Future<List<Book>> getLastBooks({required int booksQuantity}) async {
    var result =
        await _booksRef.limit(booksQuantity).get().then((value) => value);
    List<Book> books = [];
    for (var doc in result.docs) {
      books.add(doc.data());
    }
    return Future.value(books);
  }

  Future<List<Book>> getLibrary() async {
    var result = await _booksRef.get().then((value) => value);
    List<Book> books = [];
    for (var doc in result.docs) {
      books.add(doc.data());
    }
    return Future.value(books);
  }

  Future<Book> getBook({required String bookId}) async {
    var result = await _booksRef.doc(bookId).get().then((value) => value);
    if (result.exists) {
      return Future.value(result.data());
    }
    throw const HttpException("Book not found");
  }

  ///Save [newBook] at firebase
  Future<String> saveBook(String title, String author, String summary) async {
    var reference = FirebaseFirestore.instance.collection('books');
    var newBook = await reference.add({
      'name': title,
      'author': author,
      'summary': summary,
    });
    return Future.value(newBook.id);
  }
}
