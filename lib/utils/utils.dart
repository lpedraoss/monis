import 'package:flutter/material.dart';
import 'package:monis/domain/model/book.dart';
import 'package:monis/presentation/view/book_details/book_details_screen.dart';
import 'package:monis/utils/status.dart';

Color hexToColor(String code) {
  return Color(int.parse(code.substring(1, 7), radix: 16) + 0x66000000);
}

///load Url from firebase or localStorage
Image coverUrl(String coverUrl) {
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

///login user

Future<void> loginUser(
  BuildContext context, {
  required String userName,
  required password,
}) async {
  
  // var loginUser = await service.loginUser(
  //   userName: userName,
  //   password: password,
  // );
  // if (loginUser == Status.success) {
  //   // ignore: use_build_context_synchronously
  //   Navigator.of(context).push(
  //     MaterialPageRoute(
  //       builder: (context) => const BottonNavigationWidget(),
  //     ),
  //   );
  // }
}

///return the status of login
Status statusLogin({Status? status}) {
  return status ?? Status.fail;
}

///load a message of login
Widget? messageLogin({Status? status}) {
  Widget? widget;
  if (status == Status.success) {
    widget = const Center(
      child: Text(
        'Credenciales incorrectas',
        style: TextStyle(
          color: Colors.red,
        ),
      ),
    );
  }

  return widget;
}
