import 'package:monis/model/book.dart';

class BookRepository {
  final List<Book> _books = const [
    Book(
        1,
        'Cuando no queden más estrellas que contar',
        'María Martínez',
        '''supone una historia narrada con mucha sensibilidad que no podrás parar de leer. Amor, superación y perdón son los ingredientes esenciales de esta emotiva historia.\n
        Maya ha dedicado su vida al ballet. Un día, un inesperado accidente termina con su carrera y el futuro que tenía por delante. De repente, siente que el mundo se ha venido abajo, además uno de sus grandes apoyos, su abuela, le reprocha lo sucedido. Entonces, deberá hacer frente a la frustración y a un gran secreto escondido en una caja de música.
''',
        'assets/images/book1.jpg'),
    Book(2, 'tittle2', 'author2', 'description2', 'assets/images/book2.jpeg'),
    Book(3, 'tittle3', 'author3', 'description3', 'assets/images/book2.jpeg'),
    Book(4, 'tittle4', 'author4', 'description4', 'assets/images/book2.jpeg'),
    Book(5, 'tittle5', 'author5', 'description5', 'assets/images/book2.jpeg'),
  ];

  Future<List<Book>> getBooks() async {
    return _books;
  }

  Future<Book> getBook({required int bookId}) async {
    return _books.firstWhere(
      (bookElement) => bookElement.id == bookId,
    );
  }
}
