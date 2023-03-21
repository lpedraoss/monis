part of 'book_shelf_bloc.dart';

abstract class BookshelfEvent {
  const BookshelfEvent();
}

class StartShelfEvent extends BookshelfEvent {
  const StartShelfEvent();
}

class AddBookToBookshelf extends BookshelfEvent {
  final String book;
  const AddBookToBookshelf(this.book);
}

class RemoveBookFromBookshelf extends BookshelfEvent {
  final String bookId;
  const RemoveBookFromBookshelf(this.bookId);
}
