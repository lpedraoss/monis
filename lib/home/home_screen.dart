import 'package:flutter/material.dart';
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
    var lastBooks = await BookService().getBooks(booksQuantity: 3);
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
          /*image: DecorationImage(
          image: AssetImage('assets/images/anime1.jpg'),
          fit: BoxFit.cover,
        ),*/
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

class ListItemBook extends StatelessWidget {
  final Book _book;

  const ListItemBook(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white.withOpacity(0.7),
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {
            openBookDetails(context, _book);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Colors.white.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 20)
                    ]),
                    alignment: Alignment.center,
                    width: 120,
                    child: coverUrl(_book.coverUrl),
                  ),
                ),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _book.tittle,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 18),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _book.author,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 10),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        _book.description,
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(fontSize: 10),
                        maxLines: 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
