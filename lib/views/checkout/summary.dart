import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/cart_controller.dart';
import 'package:mega_store/core/controllers/checkout_controller.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class Summary extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartController>(
      init: Get.find<CartController>(),
      builder: (controller) => Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 230,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Container(
                  width: 150,
                  child: Column(
                    children: [
                      Container(
                        width: 150,
                        height: 180,
                        child: Image.network(
                          controller.products[index].image as String,
                          fit: BoxFit.fill,
                        ),
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        text: controller.products[index].name.toString(),
                        maxLines: 1,
                      ),
                      SizedBox(height: 5),
                      CustomText(
                        color: kPrimaryColor,
                        //alignment: Alignment.bottomLeft,
                        text: controller.products[index].price.toString(),
                      ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: 15);
              },
              itemCount: controller.products.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14),
            child: CustomText(
              text: 'Shipping Address',
              fontSize: 20,
            ),
          ),
          GetBuilder<CheckoutController>(
            init: Get.find<CheckoutController>(),
            builder: (controller) => Padding(
              padding: const EdgeInsets.only(top: 10),
              child: CustomText(
                color: Colors.grey,
                text: '${controller.street1}' +
                    ' , ' +
                    '${controller.street2}' +
                    ' , ' +
                    '${controller.city}' +
                    ' , ' +
                    '${controller.state}' +
                    ' , ' +
                    '${controller.country}',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
