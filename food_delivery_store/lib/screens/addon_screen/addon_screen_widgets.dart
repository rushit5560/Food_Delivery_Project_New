import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/addon_screen_controller/addon_screen_controller.dart';


class AddAddonsModule extends StatelessWidget {
  AddAddonsModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddonScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.addonFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Add Addon',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 10),
          TextFormField(
            keyboardType: TextInputType.text,
            controller: screenController.addonNameFieldController,
            decoration: addProductTextFieldDecoration(hintText: "Addon Name"),
            validator: (value) => FieldValidator().validateFullName(value!),
          ),

          const SizedBox(height: 10),

          TextFormField(
            keyboardType: TextInputType.number,
            controller: screenController.addonPriceFieldController,
            decoration: addProductTextFieldDecoration(hintText: "Addon Price"),
            validator: (value) => FieldValidator().validatePrice(value!),
          ),

          const SizedBox(height: 20),

          _addAddonButtonModule(),
        ],
      ),
    );
  }

  Widget _addAddonButtonModule() {
    return GestureDetector(
      onTap: () async {
        if(screenController.addonFormKey.currentState!.validate()) {
          await screenController.addNewAddonFunction();
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
