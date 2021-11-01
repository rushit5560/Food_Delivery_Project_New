import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';

import 'add_address_screen_widgets.dart';

class AddAddressScreen extends StatelessWidget {
  const AddAddressScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Add Address'),

      body: AddAddressModule(),
    );
  }
}
