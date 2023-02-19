import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/model/book.dart';

class BookDetailsScreen extends StatelessWidget {
  const BookDetailsScreen(this._book, {super.key});
  final Book _book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del libro'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BookCoverWidget(
              coverUrl: _book.coverUrl,
            ),
            BookInfoWidget(
              tittle: _book.tittle,
              author: _book.author,
              description: _book.description,
            ),
            BookActionsWidget(_book.id),
          ],
        ),
      ),
    );
  }
}

class BookActionsWidget extends StatelessWidget {
  const BookActionsWidget(this.bookId, {super.key});
  final int bookId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
        builder: (context, bookshefState) {
      var action = () => _addToBookshelf(context, bookId);
      var label = "Agregar a mi estante";
      var color = Colors.green;

      if (bookshefState.bookIds.contains(bookId)) {
        action = () => _removeFromBookshelf(context, bookId);
        label = "Quitar de mi estante";
        color = Colors.amber;
      }
      return ElevatedButton(
        onPressed: action,
        style: ElevatedButton.styleFrom(backgroundColor: color,),
        child: Text(label),
      );
    });
  }

  void _addToBookshelf(BuildContext context, int bookId) {
    final bookshelfBloc = context.read<BookshelfBloc>();
    bookshelfBloc.add(AddBookToBookshelf(bookId));
  }

  void _removeFromBookshelf(BuildContext context, int bookId) {
    var bookshelfBloc = context.read<BookshelfBloc>();
    bookshelfBloc.add(RemoveBookFromBookshelf(bookId));
  }
}

class BookInfoWidget extends StatelessWidget {
  final String tittle;
  final String author;
  final String description;
  const BookInfoWidget(
      {super.key,
      required this.tittle,
      required this.author,
      required this.description});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        children: [
          Text(
            tittle,
            style: Theme.of(context)
                .textTheme
                .headline5!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            author,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context).textTheme.headline5!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  const BookCoverWidget({super.key, required this.coverUrl});
  final String coverUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20)
        ]),
        alignment: Alignment.center,
        width: 230,
        child: Image.asset(coverUrl));
  }
}
