part of 'add_book_screen.dart';

class AddBookFormState extends State<AddBookForm> {
  ///access the values ​​of [textFormfield] via controller
  final _titleEditingController = TextEditingController(),
      _authEditingController = TextEditingController(),
      _summEditingController = TextEditingController();

  ///key to detect the [Form]
  final _formKey = GlobalKey<FormState>();
  final _cameraLogo = 'assets/images/cameraLogo.png';

  ///update [_imagePath] of null to String defined
  String? _imagePath;

  bool _activeWidget = false;
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
            child: AbsorbPointer(
              absorbing: _activeWidget,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Titulo',
                      ),
                      controller: _titleEditingController,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "por favor ingrese el titulo"
                          : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Autor',
                      ),
                      controller: _authEditingController,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "por favor ingrese el Autor"
                          : null,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        border: UnderlineInputBorder(),
                        labelText: 'Resumen',
                      ),
                      controller: _summEditingController,
                      validator: (value) => (value == null || value.isEmpty)
                          ? "por favor ingrese el resumen del libro"
                          : (null),
                    ),

                    // se crea una lista desplegable para seleccionar varias opciones
                    Center(
                      child: InputDecorator(
                        // ignore: prefer_const_constructors
                        decoration: InputDecoration(
                          labelText: 'Seleccionar una opción',
                          border: InputBorder.none,
                        ),

                        child: Container(
                          padding: const EdgeInsets.only(right: 200),
                          child: const DropDownCategory(),
                        ),
                      ),
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
                        setState(() {
                          _activeWidget = true;
                        });

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
          ),
        );
      },
    );
  }

  void _navigateTakePictureScreen(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TakePictureScreen(),
      ),
    );

    setState(() {
      _imagePath = result;
    });
  }

  void _saveBook(BuildContext context) async {
    var title = _titleEditingController.text,
        author = _authEditingController.text,
        summary = _summEditingController.text;

    // ignore: await_only_futures
    var book = Book(
      tittle: title,
      author: author,
      description: summary,
    );
    final service = BookService();
    var newBookId = await service.saveBook(book);
    if (_imagePath != null) {
      final imageUrl = await service.uploadBookCover(_imagePath!, newBookId);
      await service.updateCoverBook(newBookId, imageUrl);
    }
    // ignore: use_build_context_synchronously
    var bookShelfBloc = context.read<BookshelfBloc>();
    bookShelfBloc.add(AddBookToBookshelf(newBookId));
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  Widget _getImageWidget(BuildContext context) => (_imagePath == null)
      ? Image.asset(_cameraLogo)
      : Image.file(File(_imagePath!));
}
