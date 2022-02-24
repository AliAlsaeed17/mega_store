import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/cart_controller.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GetBuilder<CartController>(
              init: Get.find<CartController>(),
              builder: (controller) => Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    itemCount: controller.products.length,
                    itemBuilder: (context, index) {
                      return Container(
                        child: Row(
                          children: [
                            Image.network(controller.products[index].image!),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomText(
                                    text: controller.products[index].name!,
                                    fontSize: 24,
                                  ),
                                  const SizedBox(height: 7),
                                  CustomText(
                                    text:
                                        "\$${controller.products[index].price.toString()}",
                                    color: kPrimaryColor,
                                  ),
                                  const SizedBox(height: 20),
                                  Container(
                                    width: 120,
                                    height: 40,
                                    color: Colors.grey.shade200,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.add,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(width: 20),
                                        const CustomText(
                                          text: "1",
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                        const SizedBox(width: 20),
                                        Container(
                                          padding:
                                              const EdgeInsets.only(bottom: 20),
                                          child: const Icon(
                                            Icons.minimize,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const CustomText(
                      text: "TOTAL",
                      fontSize: 22,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 10),
                    const CustomText(
                      text: "\$2000",
                      color: kPrimaryColor,
                      fontSize: 18,
                    ),
                  ],
                ),
                Container(
                  height: 80,
                  width: 120,
                  padding: const EdgeInsets.all(3),
                  child: CustomButton(
                    text: "CHECHOUT",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
