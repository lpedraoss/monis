import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/model/book.dart';
import 'package:monis/service/book_service.dart';


class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
        // ignore: non_constant_identifier_names
        builder: (context, BookshefState) {
      if (BookshefState.bookIds.isEmpty) {
        return Center(
          child: Text(
            'Este estante está vacío.',
            style: Theme.of(context).textTheme.headline4,
            textAlign: TextAlign.center,
          ),
        );
      }

      return Container(
        margin: const EdgeInsets.all(16),
        child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              childAspectRatio: 0.7,
            ),
            itemCount: BookshefState.bookIds.length,
            itemBuilder: (context, index) {
              return BookCoverItem(BookshefState.bookIds[index]);
            }),
      );
    });
  }
}

class BookCoverItem extends StatefulWidget {
  const BookCoverItem(
    this._bookId, {
    super.key,
  });
  //final Book _book;
  final int _bookId;

  @override
  State<BookCoverItem> createState() => _BookCoverItemState();
}

class _BookCoverItemState extends State<BookCoverItem> {
  Book? _book;
  @override
  void initState() {
    super.initState();
    _getBook(widget._bookId);
  }

  void _getBook(int bookId) async {
    var book = await BookService().getBook(bookId);
    setState(() {
      _book = book;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_book == null) {
      return const Center(child: CircularProgressIndicator());
    }
    return InkWell(
      onTap: () {},
      child: Ink.image(
        image: AssetImage(_book!.coverUrl),
        fit: BoxFit.cover,
      ),
    );
  }
}
