import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/get_all_address_screen_controller/get_all_address_screen_controller.dart';
import 'package:get/get.dart';

import 'addresses_screen_widgets.dart';

class AddressesScreen extends StatelessWidget {
  AddressesScreen({Key? key}) : super(key: key);

  GetAllAddressScreenController getAllAddressScreenController = Get.put(GetAllAddressScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: commonAppBarModule(title: 'My Address'),

      body: SingleChildScrollView(
        child: Column(
          children: [
            AddressListModule(),
            SizedBox(height: Get.height * 0.01),
            AddAddressButton(),
            SizedBox(height: Get.height * 0.01),
          ],
        ),
      ),
    );
  }
}
