import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/profile_controller.dart';
import 'package:mega_store/views/auth/login_screen.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:mega_store/views/widgets/custom_listtile_button.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
      init: Get.find<ProfileController>(),
      builder: (controller) => controller.isSettingUserData
          ? CircularProgressIndicator()
          : Container(
              padding: EdgeInsets.only(top: 40),
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
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(100),
                              image: DecorationImage(
                                image: controller.userModel.pic == 'default'
                                    ? AssetImage('assets/images/Image.png')
                                        as ImageProvider
                                    : NetworkImage(
                                        controller.userModel.pic as String),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              CustomText(
                                text: controller.userModel.fullName!,
                                color: Colors.black,
                                fontSize: 18,
                              ),
                              CustomText(
                                text: controller.userModel.email!,
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 70),
                    CustomListTileButton(
                      text: 'Edit Profile',
                      leading: Icons.person,
                      onTap: () {},
                    ),
                    SizedBox(height: 15),
                    CustomListTileButton(
                      text: 'Shipping Address',
                      leading: Icons.location_on,
                      onTap: () {},
                    ),
                    SizedBox(height: 15),
                    CustomListTileButton(
                      text: 'Order History',
                      leading: Icons.history_rounded,
                      onTap: () {},
                    ),
                    SizedBox(height: 15),
                    CustomListTileButton(
                      text: 'Cards',
                      leading: Icons.payment,
                      onTap: () {},
                    ),
                    SizedBox(height: 15),
                    CustomListTileButton(
                      text: 'Notifications',
                      leading: Icons.notifications,
                      onTap: () {},
                    ),
                    SizedBox(height: 15),
                    CustomListTileButton(
                      text: 'Logout',
                      leading: Icons.logout,
                      onTap: () {
                        controller.signOut();
                        Get.to(LoginScreen());
                      },
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
