import 'package:flutter/material.dart';
import 'package:myapp/Style/colors.dart';

Widget customTextfield(
    {String? title,
    String? hint,
    TextEditingController? controller,
    int? maxline = 1}) {
  return Column(
    children: [
      Container(
        alignment: Alignment.centerLeft,
        child: Text(
          title!,
          style: TextStyle(fontWeight: FontWeight.bold, color: black),
        ),
      ),
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
        child: TextFormField(
          controller: controller,
          maxLines: maxline,
          decoration: InputDecoration(hintText: hint, border: InputBorder.none),
        ),
      )
    ],
  );
}
