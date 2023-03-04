import 'package:flutter/material.dart';
import 'package:monis/repository/book_repository.dart';
import 'package:monis/service/book_service.dart';
part 'add_book_state.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar nuevo libro')),
      body: const AddBookForm(),
    );
  }
}

class AddBookForm extends StatefulWidget {
  const AddBookForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return AddBookFormState();
  }
}
