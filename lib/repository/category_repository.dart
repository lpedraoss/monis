import 'package:monis/model/book_category.dart';

abstract class CategoryRepository {
  List<BookCategory> getAllCategories();
}

class CategoryListRepository extends CategoryRepository {
  final List<BookCategory> _listCategory = [
    const BookCategory('1', 'Ciencia Ficcion', '#A9CCE3'),
    const BookCategory('2', 'Fantasia', '#C5F023'),
    const BookCategory('3', 'Drama', '#F0B3E1'),
    const BookCategory('4', 'Suspenso', '#efb810'),
  ];
  @override
  List<BookCategory> getAllCategories() {
    return _listCategory;
  }
}
