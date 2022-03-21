import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/checkout_controller.dart';
import 'package:mega_store/views/widgets/custom_text.dart';

class DeliveryTime extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CheckoutController>(
      init: Get.find<CheckoutController>(),
      builder: (controller) => Column(
        children: [
          SizedBox(height: 25),
          RadioListTile<DeliveryModes>(
            value: DeliveryModes.StandardDelivey,
            groupValue: controller.currentDeliveyMode,
            activeColor: kPrimaryColor,
            onChanged: (value) {
              controller.changeDeliveryMode(value);
            },
            title: CustomText(
              text: 'Standard Delivery',
              alignment: Alignment.centerLeft,
              fontSize: 22,
            ),
            subtitle: CustomText(
              text: '\nOrder will be delivered between 3 - 5 business days',
            ),
          ),
          SizedBox(height: 20),
          RadioListTile<DeliveryModes>(
            value: DeliveryModes.NextDayDelivey,
            groupValue: controller.currentDeliveyMode,
            activeColor: kPrimaryColor,
            onChanged: (value) {
              controller.changeDeliveryMode(value);
            },
            title: CustomText(
              text: 'Next Day Delivery',
              alignment: Alignment.centerLeft,
              fontSize: 22,
            ),
            subtitle: CustomText(
              text:
                  '\nPlease order before 5 pm and your items will be delivered in the next day',
            ),
          ),
          SizedBox(height: 20),
          RadioListTile<DeliveryModes>(
            value: DeliveryModes.NominatedDelivey,
            groupValue: controller.currentDeliveyMode,
            activeColor: kPrimaryColor,
            onChanged: (value) {
              controller.changeDeliveryMode(value);
            },
            title: CustomText(
              text: 'Nominated Delivery',
              alignment: Alignment.centerLeft,
              fontSize: 22,
            ),
            subtitle: CustomText(
              text:
                  '\nPick a particular date from the calender and order will be delivered on selected day',
            ),
          ),
        ],
      ),
    );
  }
}
