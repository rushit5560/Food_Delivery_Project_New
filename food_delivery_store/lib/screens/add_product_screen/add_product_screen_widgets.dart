import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/common/constants/app_images.dart';
import 'package:food_delivery_admin/common/constants/field_validation.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/add_product_screen_controller/add_product_screen_controller.dart';
import '../../models/add_product_model/all_attributes_model.dart';
import '../../models/add_product_model/get_restaurants_category.dart';
import '../../models/add_product_model/get_restaurant_sub_category_model.dart';
import '../../models/add_product_model/restaurants_all_addons_model.dart';


/// Add Product Image From Device Module
class ProductImage extends StatefulWidget {
  @override
  State<ProductImage> createState() => _ProductImageState();
}
class _ProductImageState extends State<ProductImage> {
  //const ProductImage({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        addProductScreenController.productImage != null ?
        ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.file(addProductScreenController.productImage!, height: 100 ,width: 100, fit: BoxFit.fill ),
        )
            :
        ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Container(
            color: AppColors.colorLightPink,
            height: 100 ,width: 100,
            //child: FlutterLogo(),
          ),
        ),

        GestureDetector(
          onTap: (){
            _showPicker(context);
          },
          child: Container(
            height: 25, width: 25,
            margin: EdgeInsets.only(bottom: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: AppColors.colorDarkPink
            ),
            child: Icon(Icons.camera_alt, color: Colors.white,size: 15,),
          ),
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
      setState(() {
        addProductScreenController.productImage = File(image.path);
      });
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        addProductScreenController.productImage = File(image.path);
      });
    } else{}
  }
}

/// Product Name(title) & Description Module
class ItemInfoTextField extends StatelessWidget {
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Item Info",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.productTitleEditingController,
          decoration: addProductTextFieldDecoration(hintText: "Product Title"),
          validator: (value) => FieldValidator().validateProduct(value!),
        ),
        SizedBox(height: 10),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.descriptionTextEditingController,
          decoration: addProductTextFieldDecoration(hintText: "Brief Your Product"),
          validator: (value) => FieldValidator().validateDescription(value!),
        ),
      ],
    );
  }
}

class ItemCategoryTextField extends StatelessWidget {
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Item Category & Sub Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10),

        categoryDropDown(context),
        SizedBox(height: 10),
        subCategoryDropDown(context),


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

                  value: addProductScreenController.categoryDropDownValue,

                  items: addProductScreenController.getRestaurantCategoryList
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
                    addProductScreenController.isLoading(true);
                    addProductScreenController.categoryDropDownValue = restaurantCategory!;
                    log("categoryDropDownValue : ${addProductScreenController.categoryDropDownValue.name}");
                    addProductScreenController.getRestaurantSubCategoryFunction(catId: "${addProductScreenController.categoryDropDownValue.id}");
                    addProductScreenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
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
                child: DropdownButton<SubCategory1>(

                  value: addProductScreenController.subCategoryDropDownValue,

                  items: addProductScreenController.getSubCategoryList
                      .map<DropdownMenuItem<SubCategory1>>((SubCategory1 subCategory1) {
                    return DropdownMenuItem<SubCategory1>(
                      value: subCategory1,
                      child: Text(
                        "${subCategory1.name}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (subCategory1){
                    addProductScreenController.isLoading(true);
                    addProductScreenController.subCategoryDropDownValue = subCategory1!;
                    log("categoryDropDownValue : ${addProductScreenController.subCategoryDropDownValue!.name}");
                    addProductScreenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }
}

class DiscountTypeDropDownModule extends StatelessWidget {
  DiscountTypeDropDownModule({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

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

                      value: addProductScreenController.discountTypeValue.value,

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
                        addProductScreenController.isLoading(true);
                        addProductScreenController.discountTypeValue.value = value!;
                        addProductScreenController.isLoading(false);
                      },
                    ),
                  ),
                ),
              ),
        ),

        SizedBox(height: 10),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: addProductScreenController.discountTextEditingController,
          decoration: addProductTextFieldDecoration(hintText: "Discount"),
          validator: (value) => FieldValidator().validatePrice(value!),
        ),
      ],
    );
  }
}

class FoodTypeDropDownModule extends StatelessWidget {
  FoodTypeDropDownModule({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

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

                      value: addProductScreenController.foodTypeValue.value,

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
                        addProductScreenController.isLoading(true);
                        addProductScreenController.foodTypeValue.value = value!;
                        addProductScreenController.isLoading(false);
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

class ItemDescriptionTextField extends StatelessWidget {
 // const ItemDescriptionTextField({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Description",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10,),


      ],
    );
  }
}

class ItemPriceTextField extends StatelessWidget {
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pricing & MRP",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.priceTextEditingController,
          decoration: InputDecoration(
            hintText: "Select Product Price",
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
          ),
          validator: (value) => FieldValidator().validatePrice(value!),
        ),

        SizedBox(height: 10),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.mrpTextEditingController,
          decoration: InputDecoration(
            hintText: "Select Product MRP",
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
          ),
          validator: (value) => FieldValidator().validatePrice(value!),
        )
      ],
    );
  }
}

class ItemQtyTextField extends StatelessWidget {
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Quantity",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.qtyTextEditingController,
          decoration: InputDecoration(
            hintText: "Enter Quantity",
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
          ),
          validator: (value) => FieldValidator().validateQty(value!),
        ),

        /*SizedBox(height: 10),

        TextFormField(
          keyboardType: TextInputType.text,
          //controller: nameTextEditingController,
          decoration: InputDecoration(
            hintText: "Enter Unit",
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
          ),
        )*/
      ],
    );
  }
}

class EANTextField extends StatelessWidget {
  const EANTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("EAN",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10,),

        TextFormField(
          keyboardType: TextInputType.text,
          //controller: nameTextEditingController,
          decoration: InputDecoration(
            hintText: "Enter Your Product EAN",
            suffixIcon: Image.asset(Images.ic_scanner, scale: 2, color: Colors.grey,),
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
          ),
        ),
      ],
    );
  }
}

class TagTextField extends StatelessWidget {
  const TagTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Tags",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10,),

        TextFormField(
          keyboardType: TextInputType.text,
          //controller: nameTextEditingController,
          decoration: InputDecoration(
            hintText: "Product Tag",
            suffixIcon: Icon(Icons.add),
            //prefixIcon: Icon(icon, color: Colors.black),
            // isDense: true,
            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            filled: true,
            fillColor: Colors.grey.shade200,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                borderSide: BorderSide(color: Colors.grey.shade200)
            ),
          ),
        ),

        SizedBox(height: 20,),
      ],
    );
  }
}

class AddProductButton extends StatelessWidget {
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
          if(addProductScreenController.productFormKey.currentState!.validate()) {
            if(addProductScreenController.productImage == null){
              Fluttertoast.showToast(msg: 'Product Image required...!');
            }else{
              addProductScreenController.addProductFunction();
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
          child: Text("Add Product",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}

class FoodAttributeModule extends StatelessWidget {
  FoodAttributeModule({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Attributes",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),
        attributeDropDown(context),
      ],
    );
  }

  attributeDropDown(context){
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: Get.width,
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
                child: DropdownButton<ListElement1>(

                  value: addProductScreenController.attributesDropDownValue,

                  items: addProductScreenController.allAttributesList
                      .map<DropdownMenuItem<ListElement1>>((ListElement1 listElement1) {
                    return DropdownMenuItem<ListElement1>(
                      value: listElement1,
                      child: Text(
                        "${listElement1.name}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (listElement1){
                    addProductScreenController.isLoading(true);
                    addProductScreenController.attributesDropDownValue = listElement1;
                    log("attributesDropDownValue : ${addProductScreenController.attributesDropDownValue!.name}");
                    addProductScreenController.addAttributesInSelectedList(listElement1!);
                    addProductScreenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

}

class FoodAddonModule extends StatelessWidget {
  FoodAddonModule({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Addon",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        SizedBox(height: 10),
        addonDropDown(context),
      ],
    );
  }

  addonDropDown(context){
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            width: Get.width,
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
                child: DropdownButton<Addon1>(

                  value: addProductScreenController.addonsDropDownValue,

                  items: addProductScreenController.allAddonsList
                      .map<DropdownMenuItem<Addon1>>((Addon1 addon1) {
                    return DropdownMenuItem<Addon1>(
                      value: addon1,
                      child: Text(
                        "${addon1.name}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (addon1){
                    addProductScreenController.isLoading(true);
                    addProductScreenController.addonsDropDownValue = addon1;
                    log("attributesDropDownValue : ${addProductScreenController.addonsDropDownValue!.name}");
                    addProductScreenController.addAddonsInSelectedList(addon1!);
                    addProductScreenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

}

class StartTimeAndEndTimeTextModule extends StatelessWidget {
  const StartTimeAndEndTimeTextModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text("Start Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: Text("End Time",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
        ),
      ],
    );
  }
}


class StartTimeModule extends StatelessWidget {
  StartTimeModule({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  "${addProductScreenController.startTimeString.value}"
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await addProductScreenController.selectStartTime(context);
                  addProductScreenController.loadUI();
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
    );
  }
}

class EndTimeModule extends StatelessWidget {
  EndTimeModule({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    "${addProductScreenController.endTimeString.value}"
                ),
              ),
              GestureDetector(
                onTap: () async {
                  await addProductScreenController.selectEndTime(context);
                  addProductScreenController.loadUI();
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
    );
  }
}



