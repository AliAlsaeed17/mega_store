import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/core/controllers/checkout_controller.dart';
import 'package:mega_store/views/checkout/add_address.dart';
import 'package:mega_store/views/checkout/delevery_time.dart';
import 'package:mega_store/views/checkout/summary.dart';
import 'package:mega_store/views/widgets/custom_button.dart';
import 'package:timelines/timelines.dart';

GlobalKey<FormState> formKey = GlobalKey<FormState>();

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<CheckoutController>(
          init: CheckoutController(),
          builder: (controller) => Container(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: controller
                                .getColor(checkoutProcess[0]['order'] as int),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "${checkoutProcess[0]['step']}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: controller
                                .getColor(checkoutProcess[1]['order'] as int),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "${checkoutProcess[1]['step']}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: controller
                                .getColor(checkoutProcess[2]['order'] as int),
                            borderRadius: BorderRadius.circular(7),
                          ),
                          child: Text(
                            "${checkoutProcess[2]['step']}",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        controller.currentPage == CheckoutPages.DeliveryTime
                            ? Container(
                                height: 450,
                                child: DeliveryTime(),
                              )
                            : controller.currentPage == CheckoutPages.AddAddress
                                ? Container(
                                    height: 450,
                                    child: AddAddress(),
                                  )
                                : Container(
                                    height: 450,
                                    child: Summary(),
                                  ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomButton(
                              text: 'Back',
                              onPressed: () {
                                controller.changeIndex(controller.index - 1);
                              },
                            ),
                            CustomButton(
                              text: 'Next',
                              onPressed: () {
                                if (!formKey.currentState!.validate()) return;
                                controller.changeIndex(controller.index + 1);
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
