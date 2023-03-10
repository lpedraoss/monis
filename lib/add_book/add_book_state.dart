part of 'add_book_screen.dart';

class AddBookFormState extends State<AddBookForm> {
  ///access the values ​​of [textFormfield] via controller
  final titleEditingController = TextEditingController(),
      authEditingController = TextEditingController(),
      summEditingController = TextEditingController(),
      _formKey = GlobalKey<FormState>(),
      _cameraLogo = 'assets/images/cameraLogo.png';
  String? _imagePath;

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
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return SingleChildScrollView(
          child: Padding(
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
                  Padding(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    child: GestureDetector(
                      onTap: () {
                        _navigateTakePictureScreen(context);
                      },
                      child: SizedBox(
                        width: 150,
                        child: _getImageWidget(context),
                      ),
                    ),
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
          ),
        );
      },
    );
  }

  void _saveBook(BuildContext context) {
    var title = titleEditingController.text,
        author = authEditingController.text,
        summary = summEditingController.text,
        coverUrl = _imagePath == null ? _cameraLogo : _cameraLogo;

    final book = Book(
        tittle: title,
        author: author,
        description: summary,
        coverUrl: coverUrl);

    var bookShelfBloc = context.read<BookshelfBloc>();
    bookShelfBloc.add(AddBookToBookshelf(book));
    Navigator.pop(context);
  }

  void _navigateTakePictureScreen(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TakePictureScreen()),
    );
    setState(() {
      _imagePath = result;
    });
  }

  Widget _getImageWidget(BuildContext context) {
    if (_imagePath == null) {
      return Image.asset(_cameraLogo);
    } else {
      return Image.file(File(_imagePath!));
    }
  }
}
