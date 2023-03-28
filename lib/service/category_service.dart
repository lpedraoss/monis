import 'package:monis/model/book_category.dart';
import 'package:monis/repository/category_repository.dart';

abstract class CategoryService {
  List<BookCategory> getAllCategories();
}

class CategoryListService extends CategoryService {
  final repository = CategoryListRepository();
  @override
  List<BookCategory> getAllCategories() => repository.getAllCategories();
}
