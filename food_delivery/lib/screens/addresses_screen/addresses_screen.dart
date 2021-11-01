import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:get/get.dart';

import 'addresses_screen_widgets.dart';

class AddressesScreen extends StatelessWidget {
  const AddressesScreen({Key? key}) : super(key: key);

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
