import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/common_widgets.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/category_screen_controller/category_screen_controller.dart';
import '../../models/category_models/get_restaurants_category.dart';

class AddCategoryModule extends StatelessWidget {
  AddCategoryModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Add Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              flex: 35,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  screenController.categoryImage != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(80.0),
                          child: Image.file(screenController.categoryImage!,
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
            const SizedBox(width: 20),
            Expanded(
              flex: 65,
              child: Form(
                key: screenController.categoryFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.text,
                      controller: screenController.categoryFieldController,
                      decoration: addProductTextFieldDecoration(hintText: "Category Name"),
                      validator: (value) => FieldValidator().validateCategoryName(value!),
                    ),
                    SizedBox(height: 15),
                    _addCategoryButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
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
        screenController.categoryImage = File(image.path);
        screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.categoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }


  Widget _addCategoryButton() {
    return GestureDetector(
      onTap: () async {
        if(screenController.categoryFormKey.currentState!.validate()) {
          if(screenController.categoryImage == null) {
            Fluttertoast.showToast(msg: "Please Select Image!");
          } else {
            await screenController.addNewCategoryFunction();
          }
        }
      },
      child: Container(
        height: 40, width: Get.width/3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink
        ),
        child: Center(
          child: Text("Add Category",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }

}

class AllCategoryListModule extends StatelessWidget {
  AllCategoryListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CategoryScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("All Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),

        Expanded(
          child: ListView.builder(
            itemCount: screenController.getRestaurantCategoryList.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i){
              RestaurantCategory restaurantCategory = screenController.getRestaurantCategoryList[i];
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
                            child: Image.network("${ApiUrl.ApiMainPath}${screenController.getRestaurantCategoryList[i].image!}", height: 75 ,width: 75, fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          flex: 75,
                          child: Row(
                            children: [
                              Expanded(
                                child: Text(
                                  '${screenController.getRestaurantCategoryList[i].name}',
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
                                  screenController.updateCategoryFieldController.text = restaurantCategory.name ?? "";
                                  // String imageFilePath = await GallerySaver.saveImage("${ApiUrl.ApiMainPath}${restaurantCategory.image}",
                                  //     albumName: "OTWFoodDemo");
                                  editCategoryAlertDialog(context, restaurantCategory);
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
                                  await screenController.deleteRestaurantCategoryFunction(catId: "${restaurantCategory.id}");
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
          ),
        ),
      ],
    );
  }

  editCategoryAlertDialog(BuildContext context, RestaurantCategory restaurantCategory) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(
                ()=> screenController.isLoading.value
                ? CustomCircularProgressIndicator()
                : StatefulBuilder(builder: (context, setState2) {
              return AlertDialog(
                content: Form(
                  key: screenController.updateCategoryFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        Text(
                          "Update Category",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        const SizedBox(height: 8),

                        Stack(
                          alignment: Alignment.bottomRight,
                          children: [
                            screenController.updateCategoryImage != null
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                          child: Image.file(
                                              screenController
                                                  .updateCategoryImage!,
                                              height: 100,
                                              width: 100,
                                              fit: BoxFit.fill),
                                        )
                                      : ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(80.0),
                                          child: Image.network(
                                              "${ApiUrl.ApiMainPath}${restaurantCategory.image}",
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
                        _headingNameModule(name: "Category Name"),
                        const SizedBox(height: 5),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          controller: screenController.updateCategoryFieldController,
                          decoration: addProductTextFieldDecoration(hintText: "Category Name"),
                          validator: (value) => FieldValidator().validateFullName(value!),
                        ),


                        const SizedBox(height: 15),
                        _updateButton(category : restaurantCategory),

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

  Widget _updateButton({required RestaurantCategory category, String? oldImageFilePath}) {
    return GestureDetector(
      onTap: () async {
        if(screenController.updateCategoryFormKey.currentState!.validate()) {
          await screenController.updateRestaurantCategoryFunction(
              category: category, oldImageFilePath: oldImageFilePath);
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
      screenController.updateCategoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.updateCategoryImage = File(image.path);
      screenController.loadUI();
    } else{}
  }

}

