import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/common/field_validation.dart';
import 'package:food_delivery_driver/controllers/signup_screen_controller/signup_screen_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/common_widgets.dart';
import '../../models/all_restaurants_model/all_restaurants_model.dart';
import '../../models/all_zone_model/get_all_zone_model.dart';



class DriverImageModuleAndCoverImageModule extends StatefulWidget {
  DriverImageModuleAndCoverImageModule({Key? key}) : super(key: key);
  @override
  State<DriverImageModuleAndCoverImageModule> createState() => _DriverImageModuleAndCoverImageModuleState();
}
class _DriverImageModuleAndCoverImageModuleState extends State<DriverImageModuleAndCoverImageModule> {

  final signupScreenController = Get.find<SignUpScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          signupScreenController.file != null
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Image.file(signupScreenController.file!,
                      height: 100, width: 100, fit: BoxFit.fill,
                  ),
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(80.0),
                  child: Container(
                    color: AppColors.colorLightPink,
                    height: 100, width: 100,
                  ),
                ),
          GestureDetector(
            onTap: () {
              showPicker(context);
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
    );
  }

  void showPicker(context) {
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
        signupScreenController.file = File(image.path);
      });
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        signupScreenController.file = File(image.path);
      });
    } else{}
  }

  void coverImagePicker(context) {
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
                        coverGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      coverCamera();
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

  void coverGallery() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        signupScreenController.coverFile = File(image.path);
      });
    } else{}
  }

  void coverCamera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        signupScreenController.coverFile = File(image.path);
      });
    } else{}
  }
}

class SignUpText extends StatelessWidget {
  const SignUpText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Sign Up",
        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
    );
  }
}

class FirstNameTextField extends StatelessWidget {
  final String hintText;
  FirstNameTextField({required this.hintText});

  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.firstNameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateFirstName(value!),
    );
  }
}

class LastNameTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  final String hintText;

  LastNameTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.lastNameTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateLastName(value!),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {

  final signupScreenController = Get.find<SignUpScreenController>();
  final String hintText;

  PhoneNumberTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: signupScreenController.phoneNumberTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class EmailTextField extends StatelessWidget {
  //const EmailTextField({Key? key}) : super(key: key);
  final signupScreenController = Get.find<SignUpScreenController>();
  final String hintText;

  EmailTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: signupScreenController.emailTextEditingController,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();
  final String hintText;

  PasswordTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.passwordTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

class IdentityTypeTextField extends StatelessWidget {
  final String hintText;
  IdentityTypeTextField({required this.hintText});

  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.identityTypeTextEditingController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateFirstName(value!),
    );
  }
}

class IdentityNumberTextField extends StatelessWidget {
  final String hintText;
  IdentityNumberTextField({required this.hintText});

  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.identityNumberTextEditingController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateFirstName(value!),
    );
  }
}

class AddressTextField extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();
  final String hintText;

  AddressTextField({
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: signupScreenController.addressTextEditingController,
      //  obscureText: true,
      decoration: _inputDecoration(hintText: hintText, /*icon: icon*/),
      validator: (value) => FieldValidator().validateAddress(value!),
    );
  }
}

/*class CityListDropDownModule extends StatelessWidget {
  CityListDropDownModule({Key? key}) : super(key: key);
  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 45,  //gives the height of the dropdown button
          width: Get.width, //gives the width of the dropdown button
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
              child: DropdownButton<GetList>(
                focusColor:Colors.white,
                value: signupScreenController.cityDropDownValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor:Colors.black,
                items:signupScreenController.cityLists
                    .map<DropdownMenuItem<GetList>>((GetList value) {
                  return DropdownMenuItem<GetList>(
                    value: value,
                    child: Text(value.cityName!,style:TextStyle(color:Colors.black),),
                  );
                }).toList(),
                hint:Text("Select City"),
                onChanged: (newValue) {
                  signupScreenController.cityDropDownValue!.cityName = newValue!.cityName;
                  signupScreenController.cityDropDownValue!.sId = newValue.sId;
                  //authScreenController.areaLists.clear();
                  print("cityDropDownValue : ${signupScreenController.cityDropDownValue}");
                  print('newValue.name : ${newValue.cityName}');
                  print('city: ${newValue.sId!}');
                  signupScreenController.loading();
                },
              ),
            ),
          ),
        ),
    );
  }
}*/

class ZoneListDropDownModule extends StatelessWidget {
  ZoneListDropDownModule({Key? key}) : super(key: key);
  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
        Container(
          padding: const EdgeInsets.only(left: 10),
          height: 45,  //gives the height of the dropdown button
          width: Get.width, //gives the width of the dropdown button
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
              child: DropdownButton<AllZone>(
                focusColor:Colors.white,
                value: signupScreenController.zoneDropDownValue,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor:Colors.black,
                items:signupScreenController.zoneLists
                    .map<DropdownMenuItem<AllZone>>((AllZone value) {
                  return DropdownMenuItem<AllZone>(
                    value: value,
                    child: Text(value.name!,style:TextStyle(color:Colors.black),),
                  );
                }).toList(),
                hint:Text("Select City"),
                onChanged: (newValue) {
                  signupScreenController.zoneDropDownValue.name = newValue!.name;
                  signupScreenController.zoneDropDownValue.id = newValue.id;
                  //authScreenController.areaLists.clear();
                  print("cityDropDownValue : ${signupScreenController.cityDropDownValue}");
                  print('newValue.name : ${newValue.name}');
                  print('city: ${newValue.id}');
                  signupScreenController.loading();
                },
              ),
            ),
          ),
        ),
    );
  }
}

class AllRestaurantsDropDownMenuModule extends StatelessWidget {
  AllRestaurantsDropDownMenuModule({Key? key}) : super(key: key);
  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
          ()=> signupScreenController.isLoading.value
          ? CustomCircularProgressIndicator()
          : Container(
        height: 45,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade200),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey.shade100,
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<AllStore>(
              focusColor: Colors.white,
              value: signupScreenController.restaurantsDropDownValue,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: signupScreenController.getAllRestaurantsList
                  .map<DropdownMenuItem<AllStore>>((AllStore value) {
                return DropdownMenuItem<AllStore>(
                  value: value,
                  child: Text(
                    "${value.storeName}",
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                signupScreenController.isLoading(true);
                signupScreenController.restaurantsDropDownValue.storeName =
                    newValue!.storeName;
                signupScreenController.restaurantsDropDownValue.id = newValue.id;
                signupScreenController.isLoading(false);
              },
              hint: Text("Select Restaurants"),
            ),
          ),
        ),
      ),
    );
  }
}

class ContinueButton extends StatelessWidget {
  final signupScreenController = Get.find<SignUpScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){

        if(signupScreenController.signupFormKey.currentState!.validate()){
          if(signupScreenController.file == null){
            Fluttertoast.showToast(msg: 'Profile Image required...!');
          } else if(signupScreenController.identityFile == null){
            Fluttertoast.showToast(msg: 'Cover Image required...!');
          } else{
            signupScreenController.deliverySignUpFunction();
          }

        }
      },
      child: Container(
        height: 45, width: Get.width /3,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink
        ),
        child: Center(
          child: Text("Continue",
            style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
        ),
      ),
    );
  }
}

class IdentityImageModule extends StatefulWidget {
  IdentityImageModule({Key? key}) : super(key: key);
  @override
  State<IdentityImageModule> createState() => _IdentityImageModuleState();
}
class _IdentityImageModuleState extends State<IdentityImageModule> {

  final signupScreenController = Get.find<SignUpScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                signupScreenController.identityFile == null
                    ? 'Identity Image'
                : "${signupScreenController.identityFile!.path}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15.5,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => showPicker(context),
              child: Container(
                child: Text('Select',
                  style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 15.5,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void showPicker(context) {
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
        signupScreenController.identityFile = File(image.path);
      });
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        signupScreenController.identityFile = File(image.path);
      });
    } else{}
  }
}



InputDecoration _inputDecoration({hintText}) {
  return InputDecoration(
    hintText: "$hintText",
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
  );
}