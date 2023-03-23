import 'package:flutter/material.dart';
import 'package:monis/item_books/item_books.dart';
import 'package:monis/model/book.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils/widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Book> _books = [];
  @override
  void initState() {
    super.initState();
    _getLastBooks();
  }

  void _getLastBooks() async {
    var lastBooks = await BookService().getBooks(booksQuantity: 6);
    setState(() {
      _books = lastBooks;
    });
  }

  @override
  Widget build(BuildContext context) {
    var showProgress = _books.isEmpty;
    var listLength = showProgress ? 3 : _books.length + 2;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/anime3.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: listLength,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const HeaderWidget();
            }

            if (index == 1) {
              return Text(
                'Ultimos libros de la biblioteca',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    fontSize: 25,
                    color: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .decorationColor),
              );
            }
            if (showProgress) {
              return const Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(child: CircularProgressIndicator()),
              );
            }
            return ListItemBook(_books[index - 2]);
            //
          }),
    );
  }
}
