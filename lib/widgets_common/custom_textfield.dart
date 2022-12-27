// ignore_for_file: unnecessary_import

import 'package:emart_app/consts/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../consts/consts.dart';

Widget customTextField({String? title, String? hint, controller, isPass}) {
  return Column(
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        obscureText: isPass,
        controller:  controller,
        decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: hint,
            isDense: true,
            fillColor: lightGrey,
            border: InputBorder.none,
            focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: redColor))),
      ),
    ],
  );
}
