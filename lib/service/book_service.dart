import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:monis/model/book.dart';
import 'package:monis/repository/book_repository.dart';

class BookService {
  final BookRepository _repository = BookRepository();
  Future<List<Book>> getBooks({required int booksQuantity}) async =>
      _repository.getLastBooks(booksQuantity: booksQuantity);

  Future<List<Book>> getLibrary() async => _repository.getLibrary();
  Future<Book> getBook(String bookId) async =>
      _repository.getBook(bookId: bookId);

  Future<String> saveBook(Book book) async => _repository.saveBook(
        book.tittle,
        book.author,
        book.description,
      );

  Future<String> uploadBookCover(String imagePath, String newBookId) async =>
      _repository.uploadBookCover(imagePath, newBookId);

  Future<void> updateCoverBook(String newBookId, String imageUrl) async =>
      _repository.updateCoverBook(newBookId, imageUrl);
}
