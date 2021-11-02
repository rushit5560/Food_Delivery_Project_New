import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:image_picker/image_picker.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}
class _ProfileState extends State<Profile> {
  File? file;

  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        file != null
            ? ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Image.file(file!,
                    height: 120, width: 120, fit: BoxFit.fill),
              )
            : ClipRRect(
                borderRadius: BorderRadius.circular(80.0),
                child: Container(
                  color: AppColors.colorLightPink,
                  height: 120, width: 120,
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
            margin: EdgeInsets.only(bottom: 10),
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
        });
  }

  void gallery() async {
    final image = await imagePicker.getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    } else {}
  }

  void camera() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        file = File(image.path);
      });
    } else {}
  }
}

class FullNameTextField extends StatelessWidget {
  TextEditingController nameTextEditingController;

  FullNameTextField({required this.nameTextEditingController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Text(
              "Full Name -",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 8,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: nameTextEditingController,
            readOnly: true,
            decoration: _inputDecoration(/*icon: icon*/),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({hintText, icon}) {
    return InputDecoration(
      //hintText: "$hintText",
      //prefixIcon: Icon(icon, color: Colors.black),
      //isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey.shade200,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
    );
  }
}

class EmailTextField extends StatelessWidget {
  TextEditingController emailTextEditingController;
  String hintText;

  EmailTextField({
    required this.emailTextEditingController,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Text(
              "Email -",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 8,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: emailTextEditingController,
            readOnly: true,
            decoration: _inputDecoration(
              hintText: hintText, /*icon: icon*/
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({hintText, icon}) {
    return InputDecoration(
      hintText: "$hintText",
      //prefixIcon: Icon(icon, color: Colors.black),
      //isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey.shade200,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
    );
  }
}

class PhoneNumberTextField extends StatelessWidget {
  TextEditingController phoneNumberTextEditingController;

  //IconData icon;

  String hintText;

  PhoneNumberTextField({
    required this.phoneNumberTextEditingController,
    //required this.icon,

    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Container(
            child: Text(
              "Phone No -",
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
        ),
        SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 8,
          child: TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: phoneNumberTextEditingController,
            readOnly: true,
            decoration: _inputDecoration(
              hintText: hintText, /*icon: icon*/
            ),
          ),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration({hintText, icon}) {
    return InputDecoration(
      hintText: "$hintText",
      //prefixIcon: Icon(icon, color: Colors.black),
      //isDense: true,
      contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      // border: InputBorder.none,
      filled: true,
      fillColor: Colors.grey.shade200,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey.shade200)),
    );
  }
}

class UpdateProfileButton extends StatelessWidget {
  const UpdateProfileButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: () => Get.to(()=> MyProfileScreen()),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkPink,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Text(
            'Update',
            textScaleFactor: 1.1,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
