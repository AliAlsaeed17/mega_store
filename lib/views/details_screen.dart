import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/cart_controller.dart';
import 'package:mega_store/models/cart_product_model.dart';
import 'package:mega_store/models/product_model.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class DetailsScreen extends StatelessWidget {
  final ProductModel product;

  DetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 270,
              child: Image.network(
                product.image!,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.all(18),
                  child: Column(
                    children: [
                      CustomText(
                        text: product.name!,
                        fontSize: 18,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Size",
                                ),
                                CustomText(
                                  text: product.size!,
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16),
                            width: MediaQuery.of(context).size.width * .4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomText(
                                  text: "Color",
                                ),
                                Container(
                                  width: 25,
                                  height: 25,
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: product.color,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      CustomText(
                        text: "Details",
                        fontSize: 15,
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(height: 15),
                      CustomText(
                        text: product.description!,
                        lineSpace: 1.7,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: "PRICE",
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                      CustomText(
                        text: "\$" + product.price!,
                        fontSize: 18,
                        color: kPrimaryColor,
                      ),
                    ],
                  ),
                  GetBuilder<CartController>(
                    init: Get.find<CartController>(),
                    builder: (controller) => Container(
                      width: 150,
                      height: 60,
                      child: CustomButton(
                        text: "Add to Cart",
                        onPressed: () => controller.addProduct(CartProductModel(
                            name: product.name,
                            image: product.image,
                            quantity: 1,
                            price: product.price)),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
