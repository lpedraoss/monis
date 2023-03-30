import 'package:monis/domain/service/category_service.dart';

///load the existent categories
final itemsCategory =
    CategoryListService().getAllCategories().map((e) => e.name);

///item selected from dropdown
String? selectedItem = itemsCategory.first;
