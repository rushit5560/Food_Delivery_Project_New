import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/addon_screen_controller/addon_screen_controller.dart';
import '../../models/addon_models/get_all_addons_model.dart';


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
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink,
        ),
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


class AllAddonListModule extends StatelessWidget {
  AllAddonListModule({Key? key}) : super(key: key);
  final screenController = Get.find<AddonScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.addonList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        AddonAll singleAddonItem = screenController.addonList[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${singleAddonItem.name}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          "Price : ${singleAddonItem.price}",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                            onTap: () {
                              screenController.isLoading(true);
                              screenController.updateAddonNameFieldController.text = "${singleAddonItem.name}";
                              screenController.updateAddonPriceFieldController.text = "${singleAddonItem.price}";


                              editAddonAlertDialog(context, singleAddonItem.id);

                              screenController.isLoading(false);
                            },
                            child: Icon(
                              Icons.edit_rounded,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(width: 20),

                          GestureDetector(
                            onTap: () => screenController.deleteAddonFunction(
                              addonId: "${singleAddonItem.id}",
                            ),
                            child: Icon(
                              Icons.delete_rounded,
                              color: Colors.red,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  editAddonAlertDialog(BuildContext context, String addonId) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(
                ()=> screenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : StatefulBuilder(builder: (context, setState2) {
              return AlertDialog(
                content: Form(
                  key: screenController.updateAddonFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _headingNameModule(name: "Addon Name"),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: screenController.updateAddonNameFieldController,
                          decoration: addProductTextFieldDecoration(hintText: "Addon Name"),
                          validator: (value) => FieldValidator().validateFullName(value!),
                        ),

                        const SizedBox(height: 8),
                        _headingNameModule(name: "Addon Price"),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: screenController.updateAddonPriceFieldController,
                          decoration: addProductTextFieldDecoration(hintText: "Addon Price"),
                          validator: (value) => FieldValidator().validateFullName(value!),
                        ),


                        const SizedBox(height: 15),
                        _updateButton(addonId : addonId),

                      ],
                    ),
                  ),
                ),
              );
            }),
          );
        }
    );
  }

  Widget _headingNameModule({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _updateButton({required String addonId}) {
    return GestureDetector(
      onTap: () async {
        if(screenController.updateAddonFormKey.currentState!.validate()) {
          await screenController.updateAddonFunction(addonId: addonId);
        }
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Update',
              style: TextStyle(
                color: AppColors.colorLightPink,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

}
