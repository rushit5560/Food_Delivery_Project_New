import 'package:flutter/material.dart';
import 'package:food_delivery/common/field_validation.dart';
import 'package:get/get.dart';

import '../../controllers/auth_screen_controller/auth_screen_conroller.dart';
import '../../models/all_city_model/city_model.dart';

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

class UserNameTextFieldModule extends StatelessWidget {
  final String hintText;
  UserNameTextFieldModule({Key? key, required this.hintText}) : super(key: key);

  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: authScreenController.userNameTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class FullNameTextFieldModule extends StatelessWidget {
  final String hintText;
  FullNameTextFieldModule({Key? key, required this.hintText}) : super(key: key);
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: authScreenController.fullNameTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }
}

class PhoneNoTextFieldModule extends StatelessWidget {
  final String hintText;
  PhoneNoTextFieldModule({Key? key, required this.hintText}) : super(key: key);
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 10,
      controller: authScreenController.phoneNoTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }
}

class PasswordTextFieldModule extends StatelessWidget {
  final String hintText;

  PasswordTextFieldModule({Key? key, required this.hintText}) : super(key: key);
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      obscureText: true,
      controller: authScreenController.passwordTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validatePassword(value!),
    );
  }
}

class AddressTextFieldModule extends StatelessWidget {
  final String hintText;
  AddressTextFieldModule({Key? key, required this.hintText}) : super(key: key);
  final authScreenController = Get.find<AuthScreenController>();


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: authScreenController.addressTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateAddress(value!),
    );
  }
}

class EmailTextFieldModule extends StatelessWidget {
  final String hintText;
  EmailTextFieldModule({Key? key, required this.hintText}) : super(key: key);
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
        controller: authScreenController.emailTextFieldController,
      decoration: _inputDecoration(hintText: hintText),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }
}

class SelectCityDropDownModule extends StatefulWidget {
  SelectCityDropDownModule({Key? key}) : super(key: key);
  @override
  State<SelectCityDropDownModule> createState() => _SelectCityDropDownModuleState();
}
class _SelectCityDropDownModuleState extends State<SelectCityDropDownModule> {
  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(()=>
       Container(
        padding: const EdgeInsets.only(left: 10),
        height: 45,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade300
        ),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey.shade100,
              // background color for the dropdown items
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true, //If false (the default), then the dropdown's menu will be wider than its button.
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<GetList>(
              focusColor: Colors.white,
              value: authScreenController.cityDropDownValue,
              //elevation: 5,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: authScreenController.cityLists.
              map<DropdownMenuItem<GetList>>((GetList value) {
                return DropdownMenuItem<GetList>(
                  value: value,
                  child: Text(
                    value.cityName!,
                    style: TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              hint: Text(
                "Select City",
              ),
              onChanged: (newValue) {
                authScreenController.cityDropDownValue!.cityName = newValue!.cityName;
                authScreenController.cityDropDownValue!.sId = newValue.sId;
                print(
                    "cityDropDownValue : ${authScreenController.cityDropDownValue}");
                print('newValue.name : ${newValue.cityName}');
                //authScreenController.getStateData(newValue.id);
                //authScreenController.isLoading();
              },
            ),
          ),
        ),
      ),
    );
  }
}


class SelectAreaDropDownModule extends StatefulWidget {
  const SelectAreaDropDownModule({Key? key}) : super(key: key);
  @override
  _SelectAreaDropDownModuleState createState() => _SelectAreaDropDownModuleState();
}
class _SelectAreaDropDownModuleState extends State<SelectAreaDropDownModule> {

  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade300),
      child: Theme(
        data: Theme.of(context).copyWith(
            canvasColor: Colors.grey.shade100,
            // background color for the dropdown items
            buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown:
              true, //If false (the default), then the dropdown's menu will be wider than its button.
            )),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            focusColor: Colors.white,
            value: authScreenController.selectedAreaValue,
            //elevation: 5,
            style: TextStyle(color: Colors.white),
            iconEnabledColor: Colors.black,
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
                child: Text(
                  value,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            hint: Text("Select Area"),
            onChanged: (String? value) {
              setState(() {
                authScreenController.selectedAreaValue = value;
              });
            },
          ),
        ),
      ),
    );
  }
}


class SelectGenderDropDownModule extends StatefulWidget {
  const SelectGenderDropDownModule({Key? key}) : super(key: key);
  @override
  _SelectGenderDropDownModuleState createState() => _SelectGenderDropDownModuleState();
}
class _SelectGenderDropDownModuleState extends State<SelectGenderDropDownModule> {

  final authScreenController = Get.find<AuthScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10),
      height: 45,
      width: Get.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.grey.shade300
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          focusColor: Colors.white,
          value: authScreenController.selectedGenderValue,
          //elevation: 5,
          style: TextStyle(
              color: Colors.white,
              decorationColor: Colors.grey.shade100
          ),

          iconEnabledColor: Colors.black,
          items: <String>[
            'Male',
            'Female',
            'Other',
          ].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: Colors.black),
              ),
            );
          }).toList(),
          hint: Text("${authScreenController.selectedGenderValue}"),
          onChanged: (String? value) {
            setState(() {
              authScreenController.selectedGenderValue = value!;
              print('selectedGenderValue : ${authScreenController.selectedGenderValue}');
            });
          },
        ),
      ),
    );
  }
}




InputDecoration _inputDecoration({hintText}) {
  return InputDecoration(
    hintText: "$hintText",
   isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    filled: true,
    fillColor: Colors.grey.shade200,
    counterText: '',
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