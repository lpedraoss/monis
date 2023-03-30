import 'package:flutter/material.dart';

///load the header
class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.asset(
        'assets/images/anime1.jpg',
        //height: 300,
      ),
    );
  }
}
