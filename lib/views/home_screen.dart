import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/home_controller.dart';
import 'package:mega_store/views/details_screen.dart';
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
    return GetBuilder<HomeController>(
      init: Get.find<HomeController>(),
      builder: (controller) => controller.isLoading
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
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
                          itemCount: controller.categories.length,
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
                                    child: Image.network(
                                        controller.categories[index].image!),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                CustomText(
                                  text: controller.categories[index].name!,
                                ),
                              ],
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
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
                          itemCount: controller.bestSellingProducts.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Get.to(DetailsScreen(
                                    product:
                                        controller.bestSellingProducts[index]));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width * .4,
                                child: Column(
                                  children: [
                                    Container(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8),
                                        child: Container(
                                          height: 220,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              .4,
                                          child: Image.network(
                                            controller
                                                .bestSellingProducts[index]
                                                .image!,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                      ),
                                    ),
                                    CustomText(
                                      text: controller
                                          .bestSellingProducts[index].name!,
                                      alignment: Alignment.bottomCenter,
                                    ),
                                    CustomText(
                                      text: controller
                                          .bestSellingProducts[index]
                                          .description!,
                                      alignment: Alignment.bottomCenter,
                                      color: Colors.grey,
                                      maxLines: 1,
                                    ),
                                    const SizedBox(height: 7),
                                    CustomText(
                                      text: controller
                                              .bestSellingProducts[index]
                                              .price! +
                                          "\$",
                                      alignment: Alignment.bottomCenter,
                                      color: kPrimaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(width: 20),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
