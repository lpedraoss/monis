import 'package:monis/model/book.dart';
import 'package:monis/repository/book_repository.dart';

class BookService {
  final _repository = BookRepository();
  Future<List<Book>> getLastBook() async {
    final books = await _repository.getBooks();
    return Future.delayed(const Duration(seconds: 2))
        .then((value) => Future.value(books.sublist(0, 3)));
  }

  Future<Book> getBook(int bookId) async {
    return Future.delayed(const Duration(seconds: 2)).then(
      (value) => Future.value(
        _repository.getBook(bookId: bookId)
      ),
    );
  }
}
