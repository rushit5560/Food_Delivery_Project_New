import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:food_delivery/screens/index_screen/index_screen.dart';
import 'package:food_delivery/screens/sign_in_screen/sign_in_screen.dart';
import 'package:food_delivery/screens/sign_up_screen/sign_up_view_widgets.dart';
import 'package:get/get.dart';
//import 'package:food_delivery/views/sign_in_screen/sign_in_screen.dart';
//import 'package:food_delivery/views/sign_up_screen/sign_up_view_widgets.dart';
//import 'package:food_delivery/screens/sign_in_view/sign_in_screen.dart';
//import 'package:food_delivery/widgets/sign_up_view_widgets/sign_up_view_widgets.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatefulWidget {
  //const SignUpScreen({Key? key}) : super(key: key);
   GlobalKey<FormState> signUpFormKey;
   TextEditingController fullNameFieldController;
   TextEditingController emailFieldController;
   TextEditingController phoneFieldController;
   File ? file;

   SignUpScreen({required this.signUpFormKey,
     required this.fullNameFieldController,
   required this.emailFieldController,
   required this.phoneFieldController,
   this.file});

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  //var _SignUpformKey = GlobalKey<FormState>();
  // TextEditingController nameTextEditingController = TextEditingController();
  //TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  TextEditingController referalCodeTextEditingController = TextEditingController();
  String ? _chosenValue;
  String ? areaValue;
  //File? file;
  final ImagePicker imagePicker = ImagePicker();
  var _logInformKey = GlobalKey<FormState>();
  //var signUpformKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        backgroundColor: Colors.white,
        //resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Form(
            key: widget.signUpFormKey,
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                //mainAxisSize: MainAxisSize.min,
                children: [
                 // SignUpText(),
                  SizedBox(height: 10,),
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      /*_image != null ?
                      Container(
                        height: 100, width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.colorLightPink
                        ),
                        child: Image.file(_image!, height: 100 ,width: 100, fit: BoxFit.fill ),
                      ):
                      Container(
                        height: 100, width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColors.colorLightPink
                        ),
                      ),*/

                      widget.file != null ?
                      ClipRRect(
                        borderRadius: BorderRadius.circular(80.0),
                        child: Image.file(widget.file!, height: 100 ,width: 100, fit: BoxFit.fill ),
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

                  ),
                  SizedBox(height: 20,),
                  NameTextField(
                    fullNameFieldController: widget.fullNameFieldController,
                    //icon: Icons.person,
                    hintText: "Enter Full Name",
                  ),
                  SizedBox(height: 15,),
                  EmailTextField(
                    emailFieldController: widget.emailFieldController,
                    //icon: Icons.email,
                    hintText: "Enter Email",
                  ),
                  SizedBox(height: 15,),
                  PhoneTextField(
                    phoneFieldController: widget.phoneFieldController,
                      //icon: Icons.password,
                      hintText: "Enter Phone Number",),
                  SizedBox(height: 15,),


                  ReferalCodeTextField(
                    referalCodeTextEditingController: referalCodeTextEditingController,
                    //icon: Icons.password,
                    hintText: "Enter Referral Code",),
                  SizedBox(height: 15,),
                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 45,  //gives the height of the dropdown button
                    width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade300
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
                          value: _chosenValue,
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
                            "Select City",
                            /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
                          ),
                          onChanged: (String ? value) {
                            setState(() {
                              _chosenValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 15,),

                  Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 45,  //gives the height of the dropdown button
                    width: MediaQuery.of(context).size.width, //gives the width of the dropdown button
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey.shade300
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
                          value: areaValue,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor:Colors.black,
                          items: <String>[
                            'Katargam',
                            'Varachha',
                            'Adajan',
                            'Sabarmati',
                            'Majura gate',
                            'Sachin',
                            'Kapodra',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value,style:TextStyle(color:Colors.black),),
                            );
                          }).toList(),
                          hint:Text(
                            "Select Area",
                            /*style: TextStyle(
                                //color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),*/
                          ),
                          onChanged: (String ? value) {
                            setState(() {
                              areaValue = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),

              /*GestureDetector(
                onTap: (){
                  if(validateInputs()){
                    Get.offAll(() => IndexScreen());
                  }
                  //
                },
                child: Container(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.colorDarkPink),
                  child: Center(
                    child: Text(
                      "Continue",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )*/

                  /*SizedBox(height: 30,),
                  SignUpButton(),
                  SizedBox(height: 20,),
                  SignInText()*/

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool validateInputs() {
    if (widget.signUpFormKey.currentState!.validate()) {
      widget.signUpFormKey.currentState!.save();
      return true;
    } else {
      return false;
    }
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

  // _imgFromCamera() async {
  //   final ImagePicker _picker = ImagePicker();
  //   var image = await _picker.getImage(
  //       source: ImageSource.camera, imageQuality: 50
  //   );
  //
  //   setState(() {
  //     _image = File(image!.path);
  //   });
  // }

  // _imgFromGallery() async {
  //   final ImagePicker _picker = ImagePicker();
  //   var image = await  _picker.pickImage(
  //       source: ImageSource.gallery, imageQuality: 50
  //   );
  //
  //   setState(() {
  //     _image = File(image!.path);
  //   });
  // }
  void gallery() async {
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        widget.file = File(image.path);
      });
    } else{}
  }

  void camera() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if(image != null){
      setState(() {
        widget.file = File(image.path);
      });
    } else{}
  }

  SignUpText(){
    return Container(
      child: Text("Sign Up",
        style: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),),
    );
  }

  nameTextField(){
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Name",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.person, color: Colors.black,)
          ),
        ),
      ),
    );
  }

  loginTextField(){
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
              hintText: "Email",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.email, color: Colors.black,)
          ),
        ),
      ),
    );
  }

  passwordTextField(){
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: TextFormField(
          keyboardType: TextInputType.visiblePassword,
          decoration: InputDecoration(
              hintText: "Password",
              border: InputBorder.none,
              prefixIcon: Icon(Icons.password_outlined, color: Colors.black,)
          ),
        ),
      ),
    );
  }

  signUpButton(){
    return Container(
      height: 40,
      margin: EdgeInsets.only(left: 25, right: 25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
        //border: Border.all(color: Colors.black)
      ),
      child: Center(
        child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 18),),
      ),
    );
  }

  /*signInText(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Already have an account?"),

        SizedBox(width: 5,),

        GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignInScreen()),
            );
          },
          child: Text("Sign In",
            style: TextStyle(color: Colors.blue),),
        )
      ],
    );
  }*/
}