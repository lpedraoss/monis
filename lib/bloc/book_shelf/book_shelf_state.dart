// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'book_shelf_bloc.dart';

class BookshelfState {
  List<String> bookIds;
  Status status;
  BookshelfState({
    this.bookIds = const [],
    this.status = Status.notSubmitted,
  });


  BookshelfState copyWith({
    List<String>? bookIds,
    Status? status,
  }) {
    return BookshelfState(
      bookIds: bookIds ?? this.bookIds,
      status: status ?? this.status,
    );
  }
}
