import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/home_controller.dart';
import 'package:mega_store/views/widgets/custom_text.dart';
import 'auth/login_screen.dart';

class HomeScreen extends StatelessWidget {
  List<String> names = [
    "ali",
    "farah",
    "ali",
    "farah",
    "ali",
    "farah",
    "ali",
    "farah"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 55, left: 20, right: 20),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade200,
              ),
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            const CustomText(
              text: 'Categories',
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(height: 15),
            Container(
              height: 120,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 50,
                        width: 60,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.grey.shade100,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child:
                              Image.asset("assets/images/Icon_Mens Shoe.png"),
                        ),
                      ),
                      const SizedBox(height: 20),
                      CustomText(
                        text: names[index],
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomText(
                  text: "Best Selling",
                  fontSize: 18,
                ),
                CustomText(
                  text: "See All",
                  fontSize: 16,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Container(
              height: 300,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: names.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * .4,
                    child: Column(
                      children: [
                        Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Container(
                              height: 220,
                              width: MediaQuery.of(context).size.width * .4,
                              child: Image.asset(
                                "assets/images/Image.png",
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                        const CustomText(
                          text: "BeoPlay Speaker",
                          alignment: Alignment.bottomCenter,
                        ),
                        const CustomText(
                          text: "Bang and Olison",
                          alignment: Alignment.bottomCenter,
                          color: Colors.grey,
                        ),
                        const SizedBox(height: 7),
                        const CustomText(
                          text: "755\$",
                          alignment: Alignment.bottomCenter,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(width: 20),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GetBuilder<HomeController>(
        init: Get.find<HomeController>(),
        builder: (controller) => BottomNavigationBar(
          elevation: 0,
          selectedItemColor: Colors.black,
          backgroundColor: Colors.grey.shade100,
          items: [
            BottomNavigationBarItem(
              label: "",
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Text("Explore"),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  "assets/images/Icon_Explore.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text("Cart"),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Image.asset(
                  "assets/images/Icon_Cart.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
            BottomNavigationBarItem(
              label: "",
              activeIcon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text("Account"),
              ),
              icon: Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Image.asset(
                  "assets/images/Icon_User.png",
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
          currentIndex: controller.navigatorBottomIndex,
          onTap: (index) {
            controller.updateNavigatorBottomIndex(index);
          },
        ),
      ),
    );
  }
}
