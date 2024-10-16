import 'package:bloc_clean_architecture/core/constants/constants.dart';
import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        kLoadingImage,
        width: 100,
        height: 100,
      ),
    );
  }
}
