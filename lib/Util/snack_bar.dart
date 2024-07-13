import 'package:flutter/material.dart';

import 'package:myapp/Style/colors.dart';

void ShowMessage({String? message, BuildContext? context}) {
  ScaffoldMessenger.of(context!).showSnackBar(
    SnackBar(
      content: Text(
        message!,
        style: TextStyle(color: white),
      ),
      backgroundColor: primaryColor,
    ),
  );
  
}
