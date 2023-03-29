import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:monis/bloc/book_shelf/book_shelf_bloc.dart';
import 'package:monis/model/book.dart';
import 'package:monis/pages/add_book/take_picture_screen.dart';
import 'package:monis/service/book_service.dart';
import 'package:monis/utils/golbal_variable.dart';
import 'package:monis/utils/status.dart';
import 'package:monis/utils/widget/dropdown_category/dropdown_category.dart';

part 'add_book_state.dart';

class AddBookScreen extends StatelessWidget {
  const AddBookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Nuevo Libro')),
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
