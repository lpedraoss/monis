import 'package:shared_preferences/shared_preferences.dart';

abstract class BooksStorage {
  Future<void> addBook(String id);
  Future<void> removeFromShelf(String book);
  Future<List<String>> getBooks();
}

class BooksSharedStorage extends BooksStorage {
  static const _keyBooks = 'books_shareds';

  @override
  Future<void> addBook(String id) async {
    final list = await getBooks()
      ..add(id);
    (await _sharedPreferences).setStringList(_keyBooks, list);
  }

  @override
  Future<List<String>> getBooks() async {
    return (await _sharedPreferences).getStringList(_keyBooks) ?? [];
  }

  Future<SharedPreferences> get _sharedPreferences {
    return SharedPreferences.getInstance();
  }

  @override
  Future<void> removeFromShelf(String book) async {
    final list = await getBooks()
      ..remove(book);

    (await _sharedPreferences).setStringList(_keyBooks, list);
  }
}
