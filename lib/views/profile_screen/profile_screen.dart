import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
import 'package:emart_app/views/profile_screen/components/details_cart.dart';
import 'package:emart_app/views/profile_screen/edit_profile_screen.dart';
import 'package:emart_app/widgets_common/bg_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
      child: Scaffold(
        body: StreamBuilder(
          stream: FireStoreServices.getUser(currentUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(redColor),
                ),
              );
            } else {
              var data = snapshot.data!.docs[0];

              return SafeArea(
                child: Column(
                  children: [
                    //edit button
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            color: whiteColor,
                          )).onTap(() {
                        Get.to(() => const EditProfileScreen());
                      }),
                    ),
                    //user details
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        children: [
                          Image.asset(
                            imgProfile2,
                            width: 100,
                            fit: BoxFit.cover,
                          ).box.roundedFull.clip(Clip.antiAlias).make(),
                          10.widthBox,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                                5.heightBox,
                                "${data['email']}".text.white.make(),
                              ],
                            ),
                          ),
                          OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: whiteColor),
                            ),
                            onPressed: () async {
                              await Get.put(AuthController())
                                  .signoutMethod(context);
                              Get.offAll(() => const LoginScreen());
                            },
                            child:
                                logout.text.white.fontFamily(semibold).make(),
                          ),
                        ],
                      ),
                    ),
                    20.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        detailsCard(
                            count: "00",
                            title: "in your cart",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: "55",
                            title: "in your wishlist",
                            width: context.screenWidth / 3.4),
                        detailsCard(
                            count: "98",
                            title: "your orders",
                            width: context.screenWidth / 3.4),
                      ],
                    ),

                    //button section
                    ListView.separated(
                      shrinkWrap: true,
                      itemCount: profileButtonList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          leading: Image.asset(
                            profileButtonIcon[index],
                            width: 22,
                          ),
                          // ignore: unnecessary_string_interpolations
                          title: "${profileButtonList[index]}"
                              .text
                              .fontFamily(bold)
                              .make(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          color: lightGrey,
                        );
                      },
                    )
                        .box
                        .white
                        .margin(const EdgeInsets.all(12))
                        .rounded
                        .shadowSm
                        .padding(const EdgeInsets.symmetric(horizontal: 16))
                        .make()
                        .box
                        .color(red)
                        .make(),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
