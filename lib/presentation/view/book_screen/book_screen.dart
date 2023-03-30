/*-----------------------------------------------------------------------------*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:monis/presentation/bloc/pruebas_future/pruebas_future_cubit.dart';
import 'package:monis/presentation/view/common/widget/header/header.dart';
import 'package:monis/presentation/view/common/widget/item_books/item_books.dart';
import 'package:monis/domain/model/book.dart';
import 'package:monis/domain/service/book_service.dart';
import 'package:monis/presentation/view/common/widget/gobal_widget.dart';

class BookScreen extends StatefulWidget {
  const BookScreen({
    super.key,
    this.category,
  });

  final String? category;
  @override
  State<BookScreen> createState() =>
      // ignore: no_logic_in_create_state
      _BookScreenState();
}

class _BookScreenState extends State<BookScreen> {
  List<Book> _books = [];

  // late Future<String> something;

  @override
  void initState() {
    // something = funcionesa();
    context.read<PruebasFutureCubit>().hola();

    super.initState();
    _getLibrary();
  }

  // Future<String> funcionesa() async {
  //   await Future.delayed(
  //     const Duration(seconds: 10),
  //   );
  //   return 'hola';
  // }

  String? get category {
    return widget.category;
  }

  void _getLibrary() async {
    var library = category != null
        ? await BookService().getBookForCategory(category: category ?? '')
        : await BookService().getBooks(booksQuantity: 15);
    setState(() {
      _books = library;
    });
  }

  @override
  Widget build(BuildContext context) {
    var showProgress = _books.isEmpty;
    var listLength = showProgress ? 3 : _books.length + 2;
    return Container(
      decoration: backgroundImage,
      margin: const EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: listLength,
          itemBuilder: (context, index) {
            if (index == 0) {
              return const HeaderWidget();
            }

            if (index == 1) {
              return Column(
                children: [
                  BlocBuilder<PruebasFutureCubit, PruebasFutureState>(
                    builder: (context, state) {
                      if ((state.data ?? '').isEmpty) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      return Text(state.data ?? '');
                    },
                  ),
                  // FutureBuilder(
                  //   future: something,
                  //   builder: (context, snapshot) {
                  //     if (snapshot.hasData) {
                  //       return Text(snapshot.data ?? '');
                  //     }
                  //     return Center(
                  //       child: CircularProgressIndicator(),
                  //     );
                  //   },
                  // ),
                  Text(
                    category != null
                        ? 'Libros que son de $category'
                        : 'Ultimos libros de la biblioteca',
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontSize: 25,
                        color: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .decorationColor),
                  ),
                ],
              );
            }
            if (showProgress) {
              return Column(
                children: const [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Cargando biblioteca...',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                ],
              );
            }
            return ListItemBook(_books[index - 2]);
            //
          }),
    );
  }
}
