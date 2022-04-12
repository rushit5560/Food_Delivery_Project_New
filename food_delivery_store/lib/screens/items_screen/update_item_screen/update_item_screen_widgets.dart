import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/constants/app_colors.dart';
import '../../../common/constants/field_validation.dart';
import '../../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../../controllers/items_screen_controller/items_screen_controller.dart';
import '../../../models/category_models/get_restaurants_category.dart';
import '../../../models/sub_category_models/get_all_sub_category_model.dart';


/// Update Product Image
class UpdateProductImageModule extends StatelessWidget {
  UpdateProductImageModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        itemScreenController.updateFoodImage != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.file(itemScreenController.updateFoodImage!,
                    height: 100, width: 100, fit: BoxFit.fill),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.network("${itemScreenController.updatePhotoUrl}",
                    height: 100, width: 100, fit: BoxFit.fill),
              ),
        GestureDetector(
          onTap: () {
            _showImagePicker(context);
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
    );
  }

  void _showImagePicker(context) {
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
      itemScreenController.updateFoodImage = File(image.path);
      itemScreenController.loadUI();
    } else{}
  }
  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      itemScreenController.updateFoodImage = File(image.path);
      itemScreenController.loadUI();
    } else{}
  }

}

/// Update Product Name
class UpdateProductNameFieldModule extends StatelessWidget {
  UpdateProductNameFieldModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Food Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: itemScreenController.updateFoodNameFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Food name"),
          validator: (value) => FieldValidator().validateFullName(value!),
        ),
      ],
    );
  }
}

/// Update Product Description
class UpdateProductDescriptionFieldModule extends StatelessWidget {
  UpdateProductDescriptionFieldModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Food Description",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: itemScreenController.updateFoodDescriptionFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Food Description"),
          validator: (value) => FieldValidator().validateFullName(value!),
        ),
      ],
    );
  }
}

/// Update Product Price
class UpdateProductPriceFieldModule extends StatelessWidget {
  UpdateProductPriceFieldModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Food Price",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: itemScreenController.updateFoodPriceFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Food Price"),
          validator: (value) => FieldValidator().validatePrice(value!),
        ),
      ],
    );
  }
}

/// Update Product Discount
class UpdateProductDiscountFieldModule extends StatelessWidget {
  UpdateProductDiscountFieldModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Discount",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: itemScreenController.updateFoodDiscountFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Food Discount"),
          validator: (value) => FieldValidator().validatePrice(value!),
        ),
      ],
    );
  }
}

/// Update Product Qty
class UpdateProductQtyFieldModule extends StatelessWidget {
  UpdateProductQtyFieldModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Food Quantity",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: itemScreenController.updateFoodQtyFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Food Quantity"),
          validator: (value) => FieldValidator().validatePrice(value!),
        ),
      ],
    );
  }
}

/// Update Product MRP
class UpdateProductMrpFieldModule extends StatelessWidget {
  UpdateProductMrpFieldModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Food MRP",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: itemScreenController.updateFoodMrpFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Food MRP"),
          validator: (value) => FieldValidator().validatePrice(value!),
        ),
      ],
    );
  }
}

/// Update Product Start Time
class UpdateStartTimeModule extends StatelessWidget {
  UpdateStartTimeModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Start Time",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
                  ()=> Row(
                children: [
                  Expanded(
                    child: Text(
                        "${itemScreenController.updateStartTimeString.value}"
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await itemScreenController.selectStartTime(context);
                      itemScreenController.loadUI();
                    },
                    child: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Update Product End Time
class UpdateEndTimeModule extends StatelessWidget {
  UpdateEndTimeModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "End Time",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.grey.shade200,
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
                  ()=> Row(
                children: [
                  Expanded(
                    child: Text(
                        "${itemScreenController.updateEndTimeString.value}"
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      await itemScreenController.selectEndTime(context);
                      itemScreenController.loadUI();
                    },
                    child: Icon(
                      Icons.watch_later_outlined,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// Update Food Type DD
class FoodTypeDropDownModule extends StatelessWidget {
  FoodTypeDropDownModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Food Type",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),
        Obx(
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
                      alignedDropdown: true,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(

                      value: itemScreenController.updateFoodTypeValue.value,

                      items: <String>[
                        'Veg',
                        'Non-Veg',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),

                      onChanged: (value){
                        itemScreenController.isLoading(true);
                        itemScreenController.updateFoodTypeValue.value = value!;
                        itemScreenController.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}

/// Update Discount Type DD
class DiscountTypeDropDownModule extends StatelessWidget {
  DiscountTypeDropDownModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Discount Type",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),
        Obx(
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
                      alignedDropdown: true,
                    ),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(

                      value: itemScreenController.updateDiscountTypeValue.value,

                      items: <String>[
                        'Amount',
                        'Percentage',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(color: Colors.black),
                          ),
                        );
                      }).toList(),

                      onChanged: (value){
                        itemScreenController.isLoading(true);
                        itemScreenController.updateDiscountTypeValue.value = value!;
                        itemScreenController.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
        ),
      ],
    );
  }
}

/// Update Category DD
class UpdateCategoryDropDownModule extends StatelessWidget {
  UpdateCategoryDropDownModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),
        categoryDropDown(context),

      ],
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

                  value: itemScreenController.updateCategoryDropDownValue,

                  items: itemScreenController.getRestaurantCategoryList
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
                    itemScreenController.isLoading(true);
                    itemScreenController.updateCategoryDropDownValue = restaurantCategory!;
                    log("categoryDropDownValue : ${itemScreenController.updateCategoryDropDownValue.name}");
                    // itemScreenController.getRestaurantSubCategoryFunction(catId: "${addProductScreenController.categoryDropDownValue.id}");
                    itemScreenController.isLoading(false);
                  },

                ),
              ),
            ),
          ),
    );
  }
}

/// Update Sub Category DD
class UpdateSubCategoryDropDownModule extends StatelessWidget {
  UpdateSubCategoryDropDownModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sub Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),

        subCategoryDropDown(context),
      ],
    );
  }

  subCategoryDropDown(context){
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
                  alignedDropdown: true,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<AllSubcategory>(

                  value: itemScreenController.updateSubCategoryDropDownValue,

                  items: itemScreenController.getSubCategoryList
                      .map<DropdownMenuItem<AllSubcategory>>((AllSubcategory subCategory1) {
                    return DropdownMenuItem<AllSubcategory>(
                      value: subCategory1,
                      child: Text(
                        "${subCategory1.name}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (subCategory1){
                    itemScreenController.isLoading(true);
                    itemScreenController.updateSubCategoryDropDownValue = subCategory1!;
                    log("categoryDropDownValue : ${itemScreenController.updateSubCategoryDropDownValue!.name}");
                    itemScreenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }
}



/// Update Button Module
class UpdateProductButtonModule extends StatelessWidget {
  final String productId;
  UpdateProductButtonModule({Key? key, required this.productId}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        itemScreenController.updateProductByIdFunction(productId: productId);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Text("Update",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}
