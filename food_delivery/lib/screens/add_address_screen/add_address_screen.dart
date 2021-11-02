import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/add_address_screen_controller/add_address_screen_controller.dart';
import 'package:get/get.dart';

import 'add_address_screen_widgets.dart';

class AddAddressScreen extends StatelessWidget {
  //const AddAddressScreen({Key? key}) : super(key: key);
  AddAddressScreenController addAddressScreenController = Get.put(AddAddressScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Add Address', index: 2),

      body: SingleChildScrollView(
          child: Column(
            children: [
              AddAddressModule(),
              SizedBox(height: 10,),
              ContinueButton(),
              SizedBox(height: 10,),
            ],
          )),
    );
  }
}
