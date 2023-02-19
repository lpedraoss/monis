import 'package:flutter_bloc/flutter_bloc.dart';

part 'book_shelf_state.dart';
part 'book_shelf_event.dart';



class BookshelfBloc extends Bloc<BookshelfEvent, BookshelfState> {
  BookshelfBloc(BookshelfState initialState) : super(initialState) {
    on<AddBookToBookshelf>((event, emit) {
      state.bookIds.add(event.bookId);
      emit(BookshelfState(state.bookIds));
    });
    on<RemoveBookFromBookshelf>((event, emit) {
      state.bookIds.remove(event.bookId);
      emit(BookshelfState(state.bookIds));
    });
  }
}
