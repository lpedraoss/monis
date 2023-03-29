import 'package:flutter/material.dart';
import 'package:monis/book_details/book_details_screen.dart';
import 'package:monis/model/book.dart';
import 'package:monis/utils/golbal_variable.dart';

///load the background
BoxDecoration backgroundImage = const BoxDecoration(
  image: DecorationImage(
    image: AssetImage('assets/images/anime3.jpg'),
    fit: BoxFit.cover,
  ),
);

///load the header
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

/// Open details at book selected
void openBookDetails(BuildContext context, Book book) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => BookDetailsScreen(book)));
}

/// Create a Dropdown with list of categories
class DropDownCategory extends StatefulWidget {
  const DropDownCategory(BuildContext context, {super.key});

  @override
  State<StatefulWidget> createState() {
    return DropDownCategoryState();
  }
}

/// state of dropdown category
class DropDownCategoryState extends State<DropDownCategory> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      icon: const Icon(Icons.arrow_drop_down_circle),
      dropdownColor: Theme.of(context).colorScheme.background.withOpacity(0.7),
      iconDisabledColor: Colors.grey,
      iconEnabledColor:
          Theme.of(context).colorScheme.background.withOpacity(0.7),
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
