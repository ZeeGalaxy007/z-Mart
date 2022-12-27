import 'dart:io';

import 'package:emart_app/consts/colors.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.profileImgPath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImgPath.value),
                        width: 100,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: redColor,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textColor: whiteColor,
                    title: "Change"),
                const Divider(),
                20.heightBox,
                customTextField(hint: nameHint, title: name, isPass: false)
                    .box
                    .rounded
                    .border(color: const Color.fromARGB(255, 203, 198, 198))
                    .padding(const EdgeInsets.all(8))
                    .make(),
                10.heightBox,
                customTextField(hint: password, title: password, isPass: true)
                    .box
                    .rounded
                    .border(color: const Color.fromARGB(255, 203, 198, 198))
                    .padding(const EdgeInsets.all(8))
                    .make(),
                20.heightBox,
                SizedBox(
                  width: context.screenWidth - 60,
                  child: ourButton(
                      color: redColor,
                      onPress: () {},
                      textColor: whiteColor,
                      title: "Save"),
                ),
                const Divider(),
              ],
            )
                .box
                .shadowLg
                .white
                .padding(const EdgeInsets.all(16))
                .margin(const EdgeInsets.only(top: 50, left: 20, right: 20))
                .rounded
                .make(),
          ),
        ),
      ),
    );
  }
}
