import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/model/book.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils/status.dart';

part 'book_shelf_state.dart';
part 'book_shelf_event.dart';

class BookshelfBloc extends Bloc<BookshelfEvent, BookshelfState> {
  BookshelfBloc(BookshelfState initialState) : super(initialState) {
    on<AddBookToBookshelf>((event, emit) async {
      emit(
        state.copyWith(status: Status.inProgress),
      );

      // var newBookId = await BookService().saveBook(event.book);

      final list = List.of(state.bookIds);
      list.add(event.book);
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
      final list = List.of(state.bookIds);
      list.remove(event.bookId);

      emit(
        state.copyWith(
          bookIds: list,
          status: Status.success,
        ),
      );
    });
  }
}
