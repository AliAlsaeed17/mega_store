import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/core/controllers/checkout_controller.dart';
import 'package:mega_store/views/widgets/custom_text.dart';
import 'package:mega_store/views/widgets/custom_text_form_field.dart';

class AddAddress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: Get.find<CheckoutController>(),
      builder: (controller) => SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 25),
            CustomText(
              text: 'Billing address is the same as delivery address',
              fontSize: 18,
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'Street 1',
              hintText: '21,Alex Davidson Avenue',
              onSaved: (value) {
                controller.street1 = value;
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'Street 2',
              hintText: 'Opposite Omegatron, Vicent Quarters',
              onSaved: (value) {
                controller.street2 = value;
              },
            ),
            SizedBox(height: 20),
            CustomTextFormField(
              text: 'City',
              hintText: 'Victoria Island',
              onSaved: (value) {
                controller.city = value;
              },
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomTextFormField(
                    text: 'State',
                    hintText: 'Lagos State',
                    onSaved: (value) {
                      controller.state = value;
                    },
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  child: CustomTextFormField(
                    text: 'Country',
                    hintText: 'USA',
                    onSaved: (value) {
                      controller.country = value;
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
