import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/service/bookshelf_service.dart';
import 'package:monis/utils/status.dart';

part 'book_shelf_state.dart';
part 'book_shelf_event.dart';

class BookshelfBloc extends Bloc<BookshelfEvent, BookshelfState> {
  final BookShelfService service;
  BookshelfBloc({required this.service}) : super(BookshelfState()) {
    on<StartShelfEvent>(
      (event, emit) async {
        emit(
          state.copyWith(status: Status.inProgress),
        );
        final list = await service.getBooks();

        emit(
          state.copyWith(
            bookIds: list,
            status: Status.success,
          ),
        );
      },
    );
    on<AddBookToBookshelf>((event, emit) async {
      emit(
        state.copyWith(status: Status.inProgress),
      );

      // var newBookId = await BookService().saveBook(event.book);

      await service.addToShelf(event.book);
      final list = await service.getBooks();
      emit(
        state.copyWith(
          bookIds: list,
          status: Status.success,
        ),
      );
    });
    on<RemoveBookFromBookshelf>((event, emit) async {
      emit(
        state.copyWith(status: Status.inProgress),
      );
      await service.removeFromShelf(event.bookId);
      final list = await service.getBooks();

      emit(
        state.copyWith(
          bookIds: list,
          status: Status.success,
        ),
      );
    });
  }
}
