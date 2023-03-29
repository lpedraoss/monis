import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/model/book.dart';
import 'package:monis/utils/utils.dart';

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
              imageUrl: _book.coverUrl,
            ),
            BookInfoWidget(
              tittle: _book.tittle,
              author: _book.author,
              description: _book.description,
            ),
            BookActionsWidget(_book),
          ],
        ),
      ),
    );
  }
}

class BookActionsWidget extends StatelessWidget {
  const BookActionsWidget(this.book, {super.key});
  final Book book;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
      builder: (context, bookshefState) {
        var action = () => _addToBookshelf(context, book.id!);
        var label = "Agregar a mi estante";
        var color = Colors.green;

        if (bookshefState.bookIds.contains(book.id)) {
          action = () => _removeFromBookshelf(context, book.id ?? '');
          label = "Quitar de mi estante";
          color = Colors.amber;
        }
        return ElevatedButton(
          onPressed: action,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
          ),
          child: Text(label),
        );
      },
    );
  }

  void _addToBookshelf(BuildContext context, String book) {
    final bookshelfBloc = context.read<BookshelfBloc>();
    bookshelfBloc.add(AddBookToBookshelf(book));
  }

  void _removeFromBookshelf(BuildContext context, String bookId) {
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
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.w500),
          ),
          Text(
            author,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 5),
          Text(
            description,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  fontSize: 16,
                ),
          ),
        ],
      ),
    );
  }
}

class BookCoverWidget extends StatelessWidget {
  const BookCoverWidget({super.key, required this.imageUrl});
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 20, bottom: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 20)
        ]),
        alignment: Alignment.center,
        width: 230,
        child: coverUrl(imageUrl),
      ),
    );
  }
}
