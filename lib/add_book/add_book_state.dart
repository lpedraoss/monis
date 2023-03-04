part of 'add_book_screen.dart';

class AddBookFormState extends State<AddBookForm> {
  ///access the values ​​of [textFormfield] via controller
  final titleEditingController = TextEditingController(),
      authEditingController = TextEditingController(),
      summEditingController = TextEditingController(),
      _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BookshelfBloc, BookshelfState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.of(context).pop;
        }
      },
      builder: (context, state) {
        if (state.status == Status.inProgress) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Titulo',
                  ),
                  controller: titleEditingController,
                  validator: (value) => (value == null || value.isEmpty)
                      ? "por favor ingrese el titulo"
                      : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Autor',
                  ),
                  controller: authEditingController,
                  validator: (value) => (value == null || value.isEmpty)
                      ? "por favor ingrese el Autor"
                      : null,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Resumen',
                  ),
                  controller: summEditingController,
                  validator: (value) => (value == null || value.isEmpty)
                      ? "por favor ingrese el resumen del libro"
                      : (null),
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _saveBook(context);
                    }
                  },
                  child: const Text('Guardar'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _saveBook(BuildContext context) {
    var title = titleEditingController.text,
        author = authEditingController.text,
        summary = summEditingController.text;

    final book = Book(
      tittle: title,
      author: author,
      description: summary,
    );

    var bookShelfBloc = context.read<BookshelfBloc>();
    bookShelfBloc.add(AddBookToBookshelf(book));
  }
}
