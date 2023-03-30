import 'package:flutter/material.dart';
import 'package:monis/domain/model/book.dart';
import 'package:monis/utils/utils.dart';

class ListItemBook extends StatelessWidget {
  final Book _book;

  const ListItemBook(this._book, {super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.background.withOpacity(0.7),
      child: SizedBox(
        height: 170,
        child: InkWell(
          borderRadius: BorderRadius.circular(4.0),
          onTap: () {
            openBookDetails(context, _book);
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    margin: const EdgeInsets.only(top: 2, bottom: 2),
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                          color: Theme.of(context)
                              .colorScheme
                              .background
                              .withOpacity(
                                  0.7), //Colors.white.withOpacity(0.7),
                          spreadRadius: 5,
                          blurRadius: 20)
                    ]),
                    alignment: Alignment.center,
                    width: 120,
                    child: coverUrl(_book.coverUrl),
                  ),
                ),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          _book.tittle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                fontSize: 18,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Author: ${_book.author}',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                fontSize: 10,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Category: ${_book.category}',
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                fontSize: 10,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          _book.description,
                          style: Theme.of(context)
                              .textTheme
                              .titleSmall!
                              .copyWith(
                                fontSize: 10,
                                color:
                                    Theme.of(context).colorScheme.onBackground,
                              ),
                          maxLines: 4,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 5),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
