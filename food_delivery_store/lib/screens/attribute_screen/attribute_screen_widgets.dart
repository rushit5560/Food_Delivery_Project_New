import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/attribute_screen_controller/attribute_screen_controller.dart';

class AddAttributeModule extends StatelessWidget {
  AddAttributeModule({Key? key}) : super(key: key);
  final screenController = Get.find<AttributeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.attributeFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Attribute',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: screenController.attributeNameFieldController,
            decoration: addProductTextFieldDecoration(hintText: "Attribute Name"),
            validator: (value) => FieldValidator().validateFullName(value!),
          ),

          const SizedBox(height: 20),
          _addAttributeButtonModule(),
        ],
      ),
    );
  }

  Widget _addAttributeButtonModule() {
    return GestureDetector(
      onTap: () async {
        if(screenController.attributeFormKey.currentState!.validate()) {
          await screenController.addNewAttributeFunction();
        }
      },
      child: Container(
        height: 40,
        // width: Get.width / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink),
        child: Center(
          child: Text(
            "Add",
            style: TextStyle(
                color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

}
