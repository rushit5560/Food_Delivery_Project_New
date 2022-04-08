import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../common/common_widgets.dart';
import '../../common/constants/api_url.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/sub_category_screen_controller/sub_category_screen_controller.dart';
import '../../models/category_models/get_restaurants_category.dart';
import '../../models/sub_category_models/get_all_sub_category_model.dart';

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

class SubCategoryListModule extends StatelessWidget {
  SubCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<SubCategoryScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.allSubCategoryList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        AllSubcategory subCategorySingleItem = screenController.allSubCategoryList[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.black54),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(80.0),
                      child: Image.network("${ApiUrl.ApiMainPath}${screenController.allSubCategoryList[i].image}", height: 75 ,width: 75, fit: BoxFit.fill),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    flex: 75,
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            '${screenController.allSubCategoryList[i].name}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        GestureDetector(
                          onTap: () async {
                            screenController.isLoading(true);
                            screenController.updateSubCategoryFieldController.text = subCategorySingleItem.name;
                            for(int i = 0; i < screenController.getRestaurantCategoryList.length; i++) {
                              if(screenController.getRestaurantCategoryList[i].id == subCategorySingleItem.category.id){
                                screenController.updateCategoryDropDownValue = screenController.getRestaurantCategoryList[i];
                              }
                            }

                            editCategoryAlertDialog(context, subCategorySingleItem);
                            screenController.isLoading(false);
                          },
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(width: 20),
                        GestureDetector(
                          onTap: () async {
                            screenController.isLoading(true);
                            await screenController.deleteRestaurantSubCategoryFunction(subCatId: "${subCategorySingleItem.id}");
                            screenController.isLoading(false);
                          },
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: Colors.red,
                          ),
                        ),

                      ],
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

  editCategoryAlertDialog(BuildContext context, AllSubcategory subCategorySingleItem) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(
                ()=> screenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : StatefulBuilder(builder: (context, setState2) {
              return AlertDialog(
                content: Form(
                  key: screenController.updateSubCategoryFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Update Sub Category",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            screenController.updateSubCategoryImage != null
                                ? ClipRRect(
                              borderRadius:
                              BorderRadius.circular(80.0),
                              child: Image.file(
                                  screenController
                                      .updateSubCategoryImage!,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill),
                            )
                                : ClipRRect(
                              borderRadius:
                              BorderRadius.circular(80.0),
                              child: Image.network(
                                  "${ApiUrl.ApiMainPath}${subCategorySingleItem.image}",
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.fill),
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

                        const SizedBox(height: 8),
                        updateCategoryDropDown(context),

                        const SizedBox(height: 8),
                        _headingNameModule(name: "Sub Category Name"),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          controller: screenController.updateSubCategoryFieldController,
                          decoration: addProductTextFieldDecoration(hintText: "Sub Category Name"),
                          validator: (value) => FieldValidator().validateFullName(value!),
                        ),


                        const SizedBox(height: 15),
                        _updateButton(subCategorySingleItem : subCategorySingleItem),

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

  updateCategoryDropDown(context){
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

                  value: screenController.updateCategoryDropDownValue,

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
                    screenController.updateCategoryDropDownValue = restaurantCategory!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

  Widget _updateButton({required AllSubcategory subCategorySingleItem}) {
    return GestureDetector(
      onTap: () async {
        if(screenController.updateSubCategoryFormKey.currentState!.validate()) {
          if(screenController.updateSubCategoryImage == null) {
            Fluttertoast.showToast(msg: "Please Select Sub Category Image!");
          } else {
            await screenController.updateSubCategoryFunction();
          }
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
      screenController.updateSubCategoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.updateSubCategoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

}

