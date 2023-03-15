part of 'bookshelf_screen.dart';

class _BookCoverItemState extends State<BookCoverItem> {
  Book? _book;
  @override
  void initState() {
    super.initState();
    _getBook(widget._bookId);
  }

  void _getBook(String bookId) async {
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
        onTap: () {
          _openBooksDetails(_book!, context);
        },
        child: //coverUrl(_book!.coverUrl),
            Container(
          margin: const EdgeInsets.only(top: 20, bottom: 20),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 20)
          ]),
          alignment: Alignment.center,
          width: 230,
          child: coverUrl(_book!.coverUrl),
        ));
  }

  _openBooksDetails(Book book, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BookDetailsScreen(book),
      ),
    );
  }
}
