import 'package:flutter/material.dart';
import 'package:monis/book_details/book_details_screen.dart';
import 'package:monis/model/book.dart';
import 'package:monis/service/category_service.dart';

coverUrl(String coverUrl) {
  return coverUrl.startsWith('http')
      ? Image.network(
          coverUrl,
        )
      : Image.asset(
          coverUrl,
        );
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/anime1.jpg',
        //height: 300,
      ),
    );
  }
}

void openBookDetails(BuildContext context, Book book) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => BookDetailsScreen(book)));
}

final categories = CategoryListService();
final itemsCategory = categories.getAllCategories().map((e) => e.name);

String? selectedItem = itemsCategory.first;

class DropDownCategory extends StatefulWidget {
  const DropDownCategory(BuildContext context, {super.key});

  @override
  State<StatefulWidget> createState() {
    return DropDownCategoryState();
  }
}

class DropDownCategoryState extends State<DropDownCategory> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.arrow_drop_down_circle),
      dropdownColor: Colors.amber,
      iconDisabledColor: Colors.grey,
      iconEnabledColor: Colors.amber,
      value: selectedItem,
      items: itemsCategory.map((opcion) {
        return DropdownMenuItem(
          value: opcion,
          child: Text(opcion),
        );
      }).toList(),
      onChanged: (valorSeleccionado) {
        setState(() {
          selectedItem = valorSeleccionado;
        });
      },
    );
  }
}
