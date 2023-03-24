import 'package:flutter/material.dart';
import 'package:monis/item_books/item_books.dart';
import 'package:monis/model/book.dart';
import 'package:monis/model/book_category.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils.dart';
import 'package:monis/utils/widget.dart';

class BookCategoryScreen extends StatelessWidget {
  const BookCategoryScreen({super.key, required this.category});
  final BookCategory category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
        backgroundColor: hexToColor(category.colorBg),
      ),
      body: CategoryScreenBook(
        category: category.name,
      ),
    );
  }
}

/*-----------------------------------------------------------------------------*/

class CategoryScreenBook extends StatefulWidget {
  const CategoryScreenBook({
    super.key,
    required this.category,
  });
  // ignore: prefer_typing_uninitialized_variables
  final category;
  @override
  State<CategoryScreenBook> createState() =>
      // ignore: no_logic_in_create_state
      CategoryScreenBookState(category: category);
}

class CategoryScreenBookState extends State<CategoryScreenBook> {
  List<Book> _books = [];

  CategoryScreenBookState({
    required this.category,
  });
  // ignore: prefer_typing_uninitialized_variables
  final category;
  @override
  void initState() {
    super.initState();
    _getLibrary();
  }

  void _getLibrary() async {
    var library = await BookService().getBookForCategory(category: category);
    setState(() {
      _books = library;
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
                'Libros que son de $category',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      fontSize: 25,
                      color: Colors.black,
                      //backgroundColor: Colors.pink.shade50.withOpacity(0.5),
                    ),
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
