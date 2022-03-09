import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/common/app_images.dart';
import 'package:food_delivery_admin/common/field_validation.dart';
import 'package:food_delivery_admin/controllrs/add_product_screen_controller/add_product_screen_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
        addProductScreenController.file != null ?
        ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.file(addProductScreenController.file!, height: 100 ,width: 100, fit: BoxFit.fill ),
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
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        addProductScreenController.file = File(image.path);
      });
    } else{}
  }

  void camera() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        addProductScreenController.file = File(image.path);
      });
    } else{}
  }
}

class ItemInfoTextField extends StatelessWidget {
 // const ItemInfoTextField({Key? key}) : super(key: key);
  final addProductScreenController = Get.find<AddProductScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Item Info",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10,),

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.productTitleEditingController,
          decoration: InputDecoration(
            hintText: "Product Title",
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
          validator: (value) => FieldValidator().validateProduct(value!),
        )
      ],
    );
  }
}

class ItemCategoryTextField extends StatelessWidget {
  //ItemCategoryTextField({Key? key}) : super(key: key);
  AddProductScreenController addProductScreenController = Get.find<AddProductScreenController>();
  //AddProductScreenController addProductScreenController;
  //ItemCategoryTextField({required this.addProductScreenController});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Item Category",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10,),

        categoryDropDown(context)


      ],
    );
  }

  categoryDropDown(context){
    return Obx(
          () =>
          Container(
            padding: const EdgeInsets.only(left: 10),
            //height: 45,  //gives the height of the dropdown button
            width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.grey.shade200
              //border: Border.all(color: Colors.grey),
            ),
            child: Theme(
              data: Theme.of(context).copyWith(
                  canvasColor: Colors.grey.shade100, // background color for the dropdown items
                  buttonTheme: ButtonTheme.of(context).copyWith(
                    alignedDropdown: true,  //If false (the default), then the dropdown's menu will be wider than its button.
                  )
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  focusColor:Colors.white,
                  value: addProductScreenController.addressType.value,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor:Colors.black,
                  items: <String>[
                    'Surat',
                    'Ahmedabad',
                    'Baroda',
                    'Rajkot',
                    'Gandhinagar',
                    'Bhavanagar',
                    'Junagagh',
                  ].map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value,style:TextStyle(color:Colors.black),),
                    );
                  }).toList(),
                  hint:Text(
                    "Select Address Type",
                    /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
                  ),
                  onChanged: (String ? value) {
                    //setState(() {
                    addProductScreenController.addressType.value = value!;
                    //});
                  },
                ),
              ),
            ),
          ),
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

        TextFormField(
          keyboardType: TextInputType.text,
          controller: addProductScreenController.descriptionTextEditingController,
          decoration: InputDecoration(
            hintText: "Brief Your Product",
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
          validator: (value) => FieldValidator().validateDescription(value!),
        )
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

        SizedBox(height: 10,),

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

        SizedBox(height: 10,),

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
        Text("Quantity & Unit",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),

        SizedBox(height: 10,),

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

        SizedBox(height: 10,),

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
        )
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
            if(addProductScreenController.file == null){
              Fluttertoast.showToast(msg: 'Product Image required...!');
            }else{
              addProductScreenController.addProduct();
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



