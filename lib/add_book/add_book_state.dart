part of 'add_book_screen.dart';

class AddBookFormState extends State<AddBookForm> {
  ///access the values ​​of [textFormfield] via controller
  final titleEditingController = TextEditingController(),
      authEditingController = TextEditingController(),
      summEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Titulo',
              ),
              controller: titleEditingController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Autor',
              ),
              controller: authEditingController,
            ),
            TextFormField(
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Resumen',
              ),
              controller: summEditingController,
            ),
            ElevatedButton(
              onPressed: () {
                _saveBook();
              },
              child: const Text('Guardar'),
            ),
          ],
        ),
      ),
    );
  }

  void _saveBook() {
    var title = titleEditingController.text,
        author = authEditingController.text,
        summary = summEditingController.text;
    BookService().saveBook(title, author, summary);
  }
}
