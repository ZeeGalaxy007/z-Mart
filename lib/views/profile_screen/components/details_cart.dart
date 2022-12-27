import 'package:emart_app/consts/consts.dart';
import 'package:flutter/cupertino.dart';

Widget detailsCard({width, String? count, String? title}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const SizedBox(
        height: 5,
      ),
      count!.text.fontFamily(bold).color(darkFontGrey).size(16).make(),
      5.heightBox,
      title!.text.color(darkFontGrey).make(),
    ],
  )
      .box
      .white
      .rounded
      .width(width)
      .padding(const EdgeInsets.all(4))
      .height(60)
      .make();
}
