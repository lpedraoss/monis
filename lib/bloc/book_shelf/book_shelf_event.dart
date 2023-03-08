part of 'book_shelf_bloc.dart';

abstract class BookshelfEvent {
  const BookshelfEvent();
}

class AddBookToBookshelf extends BookshelfEvent {
  final Book book;
  const AddBookToBookshelf(this.book);
}

class RemoveBookFromBookshelf extends BookshelfEvent {
  final String bookId;
  const RemoveBookFromBookshelf(this.bookId);
}
