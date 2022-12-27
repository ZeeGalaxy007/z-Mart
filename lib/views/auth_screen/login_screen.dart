import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../home_screen/home.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var controller = Get.put((AuthController));
    AuthController authController = AuthController();

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            20.heightBox,
            "Login in to $appname".text.white.fontFamily(bold).size(17).make(),
            20.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextField(
                      hint: emailHint,
                      title: email,
                      isPass: false,
                      controller: authController.emailController),
                  30.heightBox,
                  customTextField(
                      hint: passwordHint,
                      title: password,
                      isPass: true,
                      controller: authController.passwordController),
                  10.heightBox,
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {},
                      child: forgetPass.text.make(),
                    ),
                  ),
                  5.heightBox,
                  authController.isloading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onPress: () async {
                            authController.isloading(true);
                            await authController
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => const Home());
                              } else {
                                authController.isloading(false);
                              }
                            });
                          }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  10.heightBox,
                  ourButton(
                      color: lightGolden,
                      title: signup,
                      textColor: redColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  20.heightBox,
                  Row(
                    children: [
                      70.widthBox,
                      buildSocialIcon(FontAwesomeIcons.facebook),
                      const SizedBox(width: 12),
                      buildSocialIcon(FontAwesomeIcons.google),
                      const SizedBox(width: 12),
                      buildSocialIcon(FontAwesomeIcons.twitter),
                      const SizedBox(width: 12),
                    ],
                  ),
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 70)
                  .shadowSm
                  .make(),
            ),
          ],
        ),
      ),
    ));
  }

  Widget buildSocialIcon(IconData icon) => CircleAvatar(
        radius: 22,
        child: Material(
          shape: const CircleBorder(),
          clipBehavior: Clip.hardEdge,
          color: redColor,
          child: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Icon(icon, size: 23),
              ),
            ),
          ),
        ),
      );
}
