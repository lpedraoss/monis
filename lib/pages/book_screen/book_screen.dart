/*-----------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:monis/utils/widget/header/header.dart';
import 'package:monis/utils/widget/item_books/item_books.dart';
import 'package:monis/model/book.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils/widget/gobal_widget.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({
    super.key,
    this.category,
  });
  // ignore: prefer_typing_uninitialized_variables
  final category;
  @override
  State<BookScreen> createState() =>
      // ignore: no_logic_in_create_state
      BookScreenState(category: category);
}

class BookScreenState extends State<BookScreen> {
  List<Book> _books = [];

  BookScreenState({
    this.category,
  });
  // ignore: prefer_typing_uninitialized_variables
  final category;
  @override
  void initState() {
    super.initState();
    _getLibrary();
  }

  void _getLibrary() async {
    var library = category != null
        ? await BookService().getBookForCategory(category: category)
        : await BookService().getBooks(booksQuantity: 15);
    setState(() {
      _books = library;
    });
  }

  @override
  Widget build(BuildContext context) {
    var showProgress = _books.isEmpty;
    var listLength = showProgress ? 3 : _books.length + 2;
    return Container(
      decoration: backgroundImage,
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: listLength,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const HeaderWidget();
            }

            if (index == 1) {
              return Text(
                category != null
                    ? 'Libros que son de $category'
                    : 'Ultimos libros de la biblioteca',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 25,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .decorationColor),
              );
            }
            if (showProgress) {
              return Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Cargando biblioteca...',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              );
            }
            return ListItemBook(_books[index - 2]);
            //
          }),
    );
  }
}
