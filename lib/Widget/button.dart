import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:myapp/Style/colors.dart';

Widget customButton({
  VoidCallback? tap,
  bool? status = false,
  String? text = 'Save',
  bool? isValid = false,
  BuildContext? context,
}) {
  return GestureDetector(
    onTap: isValid==false?null:tap,
    child: Container(
      height: 48,
      margin: const EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isValid==false?grey:status==false?primaryColor:grey,
        borderRadius: BorderRadius.circular(8),
      
        

      ),
      width: MediaQuery.of(context!).size.width,
      child: Text(status==false ?text!:'pleasewait',style: TextStyle(color: white,fontSize: 18),),
    ),
  );
}
