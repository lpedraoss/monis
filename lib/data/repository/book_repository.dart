import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:monis/domain/model/book.dart';

///Show [books] from firebase
class BookRepository {
  static const _bookCollection = 'books';

  /// reference [_bookCollection] from firebase
  static final bookInstanceFirebase =
      FirebaseFirestore.instance.collection(_bookCollection);

  ///conect the DB to flutter app with reference [booksRef]
  final _booksRef = bookInstanceFirebase.withConverter(
    fromFirestore: (snapshot, _) => Book.fromMap(
      {...snapshot.data()!, "id": snapshot.id},
    ),
    toFirestore: (book, _) => book.toMap(),
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

  ///find the book for [category]
  Future<List<Book>> getBookForCategory({required String category}) async {
    var result = await _booksRef.get().then((value) => value);
    List<Book> books = [];
    bool comparison;
    for (var doc in result.docs) {
      doc.data().category;
      comparison = (doc.data().category.toString() == (category));

      if (comparison) {
        books.add(doc.data());
      }
    }
    return Future.value(books);
  }

  ///Save [newBook] at firebase
  Future<String> saveBook(
      String title, String author, String summary, String category) async {
    var newBook = await bookInstanceFirebase.add({
      'name': title,
      'author': author,
      'summary': summary,
      'category': category,
    });
    return Future.value(newBook.id);
  }

  ///save [image] on firebase storage
  Future<String> uploadBookCover(String imagePath, String newBookId) async {
    try {
      var newRef = 'books/${imagePath.substring(37, 59)}.png';
      File image = File(imagePath);
      var task = await FirebaseStorage.instance.ref(newRef).putFile(image);
      debugPrint('Upload Finalizado, path: ${task.ref}');
      return await FirebaseStorage.instance.ref(newRef).getDownloadURL();
    } on FirebaseException catch (e) {
      debugPrint(e.message);
      rethrow;
    }
  }

  ///load the image of [bookId] using the [reference]
  Future<void> updateCoverBook(String newBookId, String imageUrl) async {
    return bookInstanceFirebase.doc(newBookId).update({
      'coverUrl': imageUrl,
    });
  }
}
