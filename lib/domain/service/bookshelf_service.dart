import 'package:monis/data/storage/books_storage.dart';

abstract class BookShelfService {
  Future<void> addToShelf(String book);
  Future<void> removeFromShelf(String book);
  Future<List<String>> getBooks();
}

class BookShelfStorageService extends BookShelfService {
  final _storage = BooksSharedStorage();
  @override
  Future<void> addToShelf(String book) async {
    await _storage.addBook(book);
  }

  @override
  Future<List<String>> getBooks() {
    return _storage.getBooks();
  }

  @override
  Future<void> removeFromShelf(String book) async {
    await _storage.removeFromShelf(book);
    
  }
}
