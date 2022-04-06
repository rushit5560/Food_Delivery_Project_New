import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'package:get/get.dart';

import '../../controllers/attribute_screen_controller/attribute_screen_controller.dart';
import 'attribute_screen_widgets.dart';

class AttributeScreen extends StatelessWidget {
  AttributeScreen({Key? key}) : super(key: key);
  final attributeScreenController = Get.put(AttributeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: commonAppBarModule(title: "Attribute"),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: AddAttributeModule(),
          ),
        ],
      ),
    );
  }
}
