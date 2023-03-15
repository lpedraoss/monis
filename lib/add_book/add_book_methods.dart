part of 'add_book_screen.dart';

void _saveBook(BuildContext context) {
  var title = _titleEditingController.text,
      author = _authEditingController.text,
      summary = _summEditingController.text,
      coverUrl = _imagePath == null ? _cameraLogo : _cameraLogo;

  final book = Book(
      tittle: title, author: author, description: summary, coverUrl: coverUrl);

  var bookShelfBloc = context.read<BookshelfBloc>();
  bookShelfBloc.add(AddBookToBookshelf(book));
  Navigator.pop(context);
}

Widget _getImageWidget(BuildContext context) => (_imagePath == null)
    ? Image.asset(_cameraLogo)
    : Image.file(File(_imagePath!));
