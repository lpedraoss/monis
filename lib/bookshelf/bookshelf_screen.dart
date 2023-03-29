import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/add_book/add_book_screen.dart';
import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/book_details/book_details_screen.dart';
import 'package:monis/model/book.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils/golbal_variable.dart';
part 'bookshelf_screen_state.dart';

class BookshelfScreen extends StatelessWidget {
  const BookshelfScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BookshelfBloc, BookshelfState>(
        // ignore: non_constant_identifier_names
        builder: (context, bookshefState) {
      var emptyListWidget = Center(
        child: Text(
          'Este estante está vacío.',
          style: Theme.of(context).textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
      );
      var mainWidget = bookshefState.bookIds.isEmpty
          ? emptyListWidget
          : MyBooksGrid(bookshefState.bookIds);

      return Column(
        children: [
          Expanded(child: mainWidget),
          ElevatedButton(
              onPressed: () {
                _navidateToAddNewBookScreen(context);
              },
              child: const Text('Agregar nuevo libro')),
        ],
      );
    });
  }

  void _navidateToAddNewBookScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddBookScreen(),
      ),
    );
  }
}

class MyBooksGrid extends StatelessWidget {
  const MyBooksGrid(this.bookIds, {super.key});
  final List<String> bookIds;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.7,
          ),
          itemCount: bookIds.length,
          itemBuilder: (context, index) {
            return BookCoverItem(bookIds[index]);
          }),
    );
  }
}

class BookCoverItem extends StatefulWidget {
  const BookCoverItem(
    this._bookId, {
    super.key,
  });

  final String _bookId;

  @override
  State<BookCoverItem> createState() => _BookCoverItemState();
}
