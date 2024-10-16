import 'package:flutter/material.dart';

void bottomSheet(
    {required BuildContext context,
    required Widget widget,
    bool? isScrollControlled}) {
  showModalBottomSheet(
    context: context,
    builder: (context) => widget,
    isScrollControlled: isScrollControlled ?? false,
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
  );
}
