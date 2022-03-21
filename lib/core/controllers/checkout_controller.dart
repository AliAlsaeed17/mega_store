import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mega_store/constants.dart';
import 'package:mega_store/views/control_view.dart';

class CheckoutController extends GetxController {
  int _index = 0;
  int get index => _index;

  CheckoutPages _currentPage = CheckoutPages.DeliveryTime;
  CheckoutPages get currentPage => _currentPage;

  DeliveryModes? _currentDeliveryMode = DeliveryModes.StandardDelivey;
  DeliveryModes? get currentDeliveyMode => _currentDeliveryMode;

  String? street1;
  String? street2;
  String? city;
  String? state;
  String? country;

  void changeIndex(int index) {
    if (index == 0) {
      _currentPage = CheckoutPages.DeliveryTime;
      _index = index;
      update();
    } else if (index == 1) {
      _currentPage = CheckoutPages.AddAddress;
      _index = index;
      update();
    } else if (index == 2) {
      _currentPage = CheckoutPages.Summary;
      _index = index;
      update();
    } else if (index < 0 || index > 2) {
      _currentPage = CheckoutPages.DeliveryTime;
      Get.to(ControlView());
      _index = 0;
      update();
    }
  }

  Color getColor(int index) {
    if (index == _index) {
      return Colors.green;
    }
    return Colors.grey;
  }

  void changeDeliveryMode(DeliveryModes? deliveryMode) {
    _currentDeliveryMode = deliveryMode;
    update();
  }
}
