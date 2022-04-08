import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/sub_category_screen_controller/sub_category_screen_controller.dart';
import '../../models/category_models/get_restaurants_category.dart';

class AddSubCategoryModule extends StatelessWidget {
  AddSubCategoryModule({Key? key}) : super(key: key);
  final screenController = Get.find<SubCategoryScreenController>();
  final ImagePicker imagePicker = ImagePicker();

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

          Container(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                screenController.subCategoryImage != null
                    ? ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Image.file(screenController.subCategoryImage!,
                      height: 100, width: 100, fit: BoxFit.fill),
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Container(
                    color: AppColors.colorLightPink,
                    height: 100, width: 100,
                    //child: FlutterLogo(),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showPicker(context);
                  },
                  child: Container(
                    height: 25,
                    width: 25,
                    margin: EdgeInsets.only(bottom: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.colorDarkPink),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 15,
                    ),
                  ),
                ),
              ],
            ),
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
          if(screenController.subCategoryImage == null) {
            Fluttertoast.showToast(msg: "Please Select Image!");
          } else if(screenController.categoryDropDownValue.id == "0") {
            Fluttertoast.showToast(msg: "Please Select Category!");
          } else {
            await screenController.addSubCategoryFunction();
          }
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

  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        gallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }

  void gallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.subCategoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.subCategoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

}
