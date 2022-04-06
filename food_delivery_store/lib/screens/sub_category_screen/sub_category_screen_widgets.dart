import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/sub_category_screen_controller/sub_category_screen_controller.dart';
import '../../models/add_product_model/get_restaurants_category.dart';

class AddSubCategoryModule extends StatelessWidget {
  AddSubCategoryModule({Key? key}) : super(key: key);
  final screenController = Get.find<SubCategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: screenController.subCategoryFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Add Sub Category",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          SizedBox(height: 10),

          categoryDropDown(context),
          SizedBox(height: 10),

          TextFormField(
            keyboardType: TextInputType.text,
            controller: screenController.subCategoryFieldController,
            decoration: addProductTextFieldDecoration(hintText: "Sub Category Name"),
            validator: (value) => FieldValidator().validateFullName(value!),
          ),
          SizedBox(height: 20),
          _addSubCategoryButtonModule(),

        ],
      ),
    );
  }

  categoryDropDown(context){
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.grey.shade200,
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade100,
                buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<RestaurantCategory>(

                  value: screenController.categoryDropDownValue,

                  items: screenController.getRestaurantCategoryList
                      .map<DropdownMenuItem<RestaurantCategory>>((RestaurantCategory restaurantCategory) {
                    return DropdownMenuItem<RestaurantCategory>(
                      value: restaurantCategory,
                      child: Text(
                        "${restaurantCategory.name}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (restaurantCategory){
                    screenController.isLoading(true);
                    screenController.categoryDropDownValue = restaurantCategory!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

  Widget _addSubCategoryButtonModule() {
    return GestureDetector(
      onTap: () async {
        if(screenController.subCategoryFormKey.currentState!.validate()) {
          await screenController.addSubCategoryFunction();
        }
      },
      child: Container(
        height: 40,
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
