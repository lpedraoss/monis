part of 'add_book_screen.dart';

///access the values ​​of [textFormfield] via controller
final _titleEditingController = TextEditingController(),
    _authEditingController = TextEditingController(),
    _summEditingController = TextEditingController();

///key to detect the [Form]
final _formKey = GlobalKey<FormState>();
final _cameraLogo = 'assets/images/cameraLogo.png';
String? _imagePath;

class AddBookFormState extends State<AddBookForm> {
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

  void _navigateTakePictureScreen(BuildContext context) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const TakePictureScreen()),
    );
    setState(() {
      _imagePath = result;
    });
  }
}
