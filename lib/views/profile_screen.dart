import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/profile_controller.dart';
import 'package:mega_store/views/auth/login_screen.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: Get.find<ProfileController>(),
        builder: (controller) => Container(
              padding: EdgeInsets.only(top: 50),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(100),
                              // image: DecorationImage(
                              //   image: controller.userModel!.pic == 'default'
                              //       ? AssetImage('assets/images/Image.png')
                              //           as ImageProvider
                              //       : NetworkImage(
                              //           controller.userModel!.pic as String),
                              //   fit: BoxFit.fill,
                              // ),
                            ),
                            child: CustomButton(
                              onPressed: () {
                                controller.signOut();
                              },
                              text: "ssss",
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel.fullName!,
                                color: Colors.black,
                                fontSize: 32,
                              ),
                              CustomText(
                                text: controller.userModel.email!,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
