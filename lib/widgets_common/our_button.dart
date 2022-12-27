// ignore_for_file: unnecessary_import

import 'package:emart_app/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget ourButton({onPress, color, textColor, String? title}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
        backgroundColor: color, padding: const EdgeInsets.all(12)),
    onPressed: onPress,
    child: title!.text.color(textColor).fontFamily(bold).make(),
  );
}
