part of 'book_shelf_bloc.dart';

abstract class BookshelfEvent {
  const BookshelfEvent();
}

class AddBookToBookshelf extends BookshelfEvent {
  final int bookId;
  const AddBookToBookshelf(this.bookId);
}

class RemoveBookFromBookshelf extends BookshelfEvent {
  final int bookId;
  const RemoveBookFromBookshelf(this.bookId);
}
