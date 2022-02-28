import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/cart_controller.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: Get.find<CartController>(),
      builder: (controller) => controller.products.length == 0
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  child: SvgPicture.asset('assets/images/cart_empty.svg'),
                ),
                SizedBox(height: 20),
                CustomText(
                  text: "Empty Cart",
                  color: Colors.grey,
                  fontSize: 22,
                ),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Container(
                      child: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 15);
                        },
                        itemCount: controller.products.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * .4,
                                    height:
                                        MediaQuery.of(context).size.width * .3,
                                    child: Image.network(
                                      controller.products[index].image!,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CustomText(
                                          text:
                                              controller.products[index].name!,
                                          fontSize: 22,
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
                                              GestureDetector(
                                                onTap: () {
                                                  controller
                                                      .increaseQuantity(index);
                                                },
                                                child: const Icon(
                                                  Icons.add,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              CustomText(
                                                text: controller
                                                    .products[index].quantity
                                                    .toString(),
                                                fontSize: 20,
                                                color: Colors.black,
                                              ),
                                              const SizedBox(width: 20),
                                              Container(
                                                padding: const EdgeInsets.only(
                                                    bottom: 20),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    controller.decreaseQuantity(
                                                        index);
                                                  },
                                                  child: const Icon(
                                                    Icons.minimize,
                                                    color: Colors.black,
                                                  ),
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
                            ),
                          );
                        },
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
                          GetBuilder<CartController>(
                            init: Get.find<CartController>(),
                            builder: (controller) => CustomText(
                              text: "\$${controller.totalPrice}",
                              color: kPrimaryColor,
                              fontSize: 18,
                            ),
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
