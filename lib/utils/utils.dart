import 'package:flutter/material.dart';
import 'package:monis/model/book.dart';
import 'package:monis/pages/book_details/book_details_screen.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0x66000000);
}

///load Url from firebase or localStorage
dynamic coverUrl(String coverUrl) {
  return coverUrl.startsWith('http')
      ? Image.network(
          coverUrl,
        )
      : Image.asset(
          coverUrl,
        );
}

/// Open details at book selected
void openBookDetails(BuildContext context, Book book) {
  Navigator.push(context,
      MaterialPageRoute(builder: (context) => BookDetailsScreen(book)));
}
