import 'package:flutter/material.dart';

void showSnackBar(
    BuildContext context, String content, Color bgColor, Color textColor) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Text(
          content,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: bgColor,
      ),
    );
}
