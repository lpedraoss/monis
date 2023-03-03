import 'package:monis/model/book.dart';
import 'package:monis/repository/book_repository.dart';

class BookService {
  final BookRepository _repository = BookRepository();
  Future<List<Book>> getBooks({required int booksQuantity}) async =>
      _repository.getLastBooks(booksQuantity: booksQuantity);
  Future<List<Book>> getLibrary() async => _repository.getLibrary();
  Future<Book> getBook(String bookId) async =>
      _repository.getBook(bookId: bookId);
}
