import 'package:flutter/material.dart';

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
