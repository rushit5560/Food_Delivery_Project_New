import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/app_colors.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';
import 'package:food_delivery_driver/controllrs/signup_screen_controller/signup_screen_controller.dart';
import 'package:food_delivery_driver/screens/sign_up_screen/sign_up_screen_widgets.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
   SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  //var _SignUpformKey = GlobalKey<FormState>();
  final signUpScreenController = Get.put(SignUpScreenController());

  String ? _chosenValue;

  String ? areaValue;

  //File? file;

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: commonAppBarModule(title: 'Register', index: 2),
      //resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
          child: Form(
            key: signUpScreenController.signupFormKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                  padding: EdgeInsets.only(left: 10, right: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      new BoxShadow(
                        color: Colors.grey,
                        blurRadius: 20.0,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      // SignUpText(),
                      SizedBox(height: 20,),

                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                signUpScreenController.coverFile != null ?
                                ClipRRect(
                                    borderRadius: BorderRadius.circular(10.0),
                                    child: Image.file(signUpScreenController.coverFile!, height: 150 ,width: Get.width, fit: BoxFit.fill ))
                                    :
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: Container(
                                    color: AppColors.colorLightPink,
                                    height: 150 ,width: Get.width,
                                    //child: FlutterLogo(),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: (){
                                    coverImagePicker(context);
                                  },
                                  child: Container(
                                    height: 25, width: 25,
                                    margin: EdgeInsets.only(top: 5, left: 5),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        color: AppColors.colorDarkPink
                                    ),
                                    child: Icon(Icons.camera_alt, color: Colors.white,size: 15,),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Stack(
                            alignment: Alignment.bottomRight,
                            children: [
                              signUpScreenController.file != null ?
                              ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Image.file(signUpScreenController.file!, height: 100 ,width: 100, fit: BoxFit.fill ),
                              )
                                  :
                              ClipRRect(
                                borderRadius: BorderRadius.circular(80.0),
                                child: Container(
                                  color: Colors.white,
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

                          ),

                        ],
                      ),


                      SizedBox(height: 20,),
                      SellerNameTextField(
                        hintText: "Seller Name",),
                      SizedBox(height: 15,),
                      StoreNameTextField(
                        hintText: "Store Name",),
                      SizedBox(height: 15,),
                      StoreNumberTextField(
                        hintText: "Store Number",),
                      SizedBox(height: 15,),
                      EmailTextField(
                        hintText: "Email",
                      ),
                      SizedBox(height: 15,),
                      AdminShareTextField(
                        hintText: "Admin Share",
                      ),
                      SizedBox(height: 15,),
                      PasswordTextField(
                        hintText: "Password",),
                      SizedBox(height: 15,),
                      /*Obx(()=>
                        Container(
                          padding: const EdgeInsets.only(left: 10),
                          height: 45,  //gives the height of the dropdown button
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
                              child: DropdownButton<GetList>(
                                focusColor:Colors.white,
                                value: signUpScreenController.cityDropDownValue,
                                //elevation: 5,
                                style: TextStyle(color: Colors.white),
                                iconEnabledColor:Colors.black,
                                items:signUpScreenController.cityLists
                                      .map<DropdownMenuItem<GetList>>((GetList value) {
                                  return DropdownMenuItem<GetList>(
                                    value: value,
                                    child: Text(value.cityName!,style:TextStyle(color:Colors.black),),
                                  );
                                }).toList(),
                                hint:Text(
                                  "Select City",
                                ),
                                onChanged: (newValue) {
                                  signUpScreenController.cityDropDownValue!.cityName = newValue!.cityName;
                                  signUpScreenController.cityDropDownValue!.sId = newValue.sId;
                                  //authScreenController.areaLists.clear();
                                  print("cityDropDownValue : ${signUpScreenController.cityDropDownValue}");
                                  print('newValue.name : ${newValue.cityName}');
                                  print('city: ${newValue.sId!}');
                                  signUpScreenController.loading();
                                },
                              ),
                            ),
                          ),
                        ),
                      ),*/
                      SizedBox(height: 15,),
                      DeliveryRangeTextField(hintText: "Delivery Range",),
                      SizedBox(height: 15,),
                      StoreAddressTextField(hintText: "Store Address",),
                      SizedBox(height: 15,),

                    ],
                  ),
                ),
                SizedBox(height: 15,),
                ContinueButton(),
                SizedBox(height: 15,),
              ],
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
     final image = await imagePicker.getImage(source: ImageSource.gallery);
     if(image != null){
       setState(() {
         signUpScreenController.file = File(image.path);
       });
     } else{}
   }

   void camera() async {
     final image = await imagePicker.getImage(source: ImageSource.camera);
     if(image != null){
      setState(() {
        signUpScreenController.file = File(image.path);
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
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        signUpScreenController.coverFile = File(image.path);
      });
    } else{}
  }

  void coverCamera() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        signUpScreenController.coverFile = File(image.path);
      });
    } else{}
  }
}
