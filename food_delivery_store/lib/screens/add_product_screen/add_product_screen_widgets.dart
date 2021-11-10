import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/common/app_images.dart';
import 'package:food_delivery_admin/controllrs/add_product_screen_controller/add_product_screen_controller.dart';
import 'package:get/get.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(80.0),
      child: Container(
        color: AppColors.colorLightPink,
        height: 100 ,width: 100,
        //child: FlutterLogo(),
        child: Icon(Icons.camera_alt, color: AppColors.colorDarkPink,size: 40,),
      ),
    );
  }
}

class ItemInfoTextField extends StatelessWidget {
  const ItemInfoTextField({Key? key}) : super(key: key);

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
          //controller: nameTextEditingController,
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
  const ItemDescriptionTextField({Key? key}) : super(key: key);

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
          //controller: nameTextEditingController,
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
        )
      ],
    );
  }
}

class ItemPriceTextField extends StatelessWidget {
  const ItemPriceTextField({Key? key}) : super(key: key);

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
          //controller: nameTextEditingController,
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
        ),

        SizedBox(height: 10,),

        TextFormField(
          keyboardType: TextInputType.text,
          //controller: nameTextEditingController,
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
        )
      ],
    );
  }
}

class ItemQtyTextField extends StatelessWidget {
  const ItemQtyTextField({Key? key}) : super(key: key);

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
          //controller: nameTextEditingController,
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
  const AddProductButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40, width: Get.width/3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.colorDarkPink
      ),
      child: Center(
        child: Text("Add Product",
          style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
      ),
    );
  }
}



