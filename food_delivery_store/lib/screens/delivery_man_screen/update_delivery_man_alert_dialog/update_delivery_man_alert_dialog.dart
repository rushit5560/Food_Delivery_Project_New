import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../../common/constants/app_colors.dart';
import '../../../common/constants/field_validation.dart';
import '../../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../../controllers/delivery_man_screen_controller/delivery_man_screen_controller.dart';
import '../../../models/delivery_man_models/get_all_area_model.dart';
import '../../../models/delivery_man_models/get_all_delivery_man_model.dart';


class UpdateDeliveryManAlertDialog extends StatelessWidget {
  final DeliveryManGetList singleDeliveryBoy;
  UpdateDeliveryManAlertDialog({Key? key, required this.singleDeliveryBoy}) : super(key: key);

  final screenController = Get.find<DeliveryManScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: screenController.updateDeliveryBoyFormKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _updateProfilePicModule(context, singleDeliveryBoy),
            const SizedBox(height: 10),

            Row(
              children: [
                Expanded(child: _updateFNameFieldModule()),
                const SizedBox(width: 10),
                Expanded(child: _updateLNameFieldModule()),
              ],
            ),
            const SizedBox(height: 10),

            _updatePhoneFieldModule(),
            const SizedBox(height: 10),

            _updateAddressFieldModule(),
            const SizedBox(height: 10),

            _identityDropdownModule(context),
            const SizedBox(height: 10),

            _updateIdentityNumberFieldModule(),
            const SizedBox(height: 10),

            _deliveryBoyIdentityImageModule(context),
            const SizedBox(height: 10),

            _updateEmailFieldModule(),
            const SizedBox(height: 10),

            _deliveryManTypeDropdownModule(context),
            const SizedBox(height: 10),

            _genderDropdownModule(context),
            const SizedBox(height: 10),

            _zoneDropdownModule(context),
            const SizedBox(height: 10),

            _updateButton(),
          ],
        ),
      ),
    );
  }

  Widget _updateProfilePicModule(BuildContext context, DeliveryManGetList singleDeliveryBoy) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        screenController.updateDeliveryBoyImgFile != null
            ? ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.file(screenController.updateDeliveryBoyImgFile!,
              height: 80, width: 80, fit: BoxFit.fill),
        )
            : ClipRRect(
          borderRadius: BorderRadius.circular(80.0),
          child: Image.network("${ApiUrl.ApiMainPath}${singleDeliveryBoy.image}",
              height: 80, width: 80, fit: BoxFit.fill),
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
    );
  }

  Widget _updateFNameFieldModule() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.updateFNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "First Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }

  Widget _updateLNameFieldModule() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.updateLNameFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Last Name"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }

  Widget _updatePhoneFieldModule() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      maxLength: 10,
      controller: screenController.updatePhoneFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Phone"),
      validator: (value) => FieldValidator().validateMobile(value!),
    );
  }

  Widget _updateAddressFieldModule() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.updateAddressFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Address"),
      validator: (value) => FieldValidator().validateAddress(value!),
    );
  }

  Widget _identityDropdownModule(BuildContext context) {
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
                child: DropdownButton<String>(

                  value: screenController.deliveryManIdentity.value,

                  items: <String>[
                    'passport',
                    'Drivinglicense',
                    'NID',
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
                    screenController.isLoading(true);
                    screenController.deliveryManIdentity.value = value!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }
  Widget _updateIdentityNumberFieldModule() {
    return TextFormField(
      keyboardType: TextInputType.text,
      controller: screenController.updateIdentityNumberFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Identity Number"),
      validator: (value) => FieldValidator().validateFullName(value!),
    );
  }

  Widget _updateEmailFieldModule() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: screenController.updateEmailFieldController,
      decoration: addProductTextFieldDecoration(hintText: "Email"),
      validator: (value) => FieldValidator().validateEmail(value!),
    );
  }

  Widget _deliveryManTypeDropdownModule(BuildContext context) {
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
                child: DropdownButton<String>(

                  value: screenController.deliveryManType.value,

                  items: <String>[
                    'Freelancer',
                    'Salarybased',
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
                    screenController.isLoading(true);
                    screenController.deliveryManType.value = value!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

  Widget _genderDropdownModule(BuildContext context) {
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
                child: DropdownButton<String>(

                  value: screenController.deliveryManGender.value,

                  items: <String>[
                    'Male',
                    'Female',
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
                    screenController.isLoading(true);
                    screenController.deliveryManGender.value = value!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

  Widget _zoneDropdownModule(BuildContext context) {
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
                child: DropdownButton<GetZoneList>(

                  value: screenController.updateZoneDropDownValue,

                  items: screenController.allZoneList
                      .map<DropdownMenuItem<GetZoneList>>((GetZoneList getZoneList) {
                    return DropdownMenuItem<GetZoneList>(
                      value: getZoneList,
                      child: Text(
                        "${getZoneList.areaName}",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),

                  onChanged: (getZoneList){
                    screenController.isLoading(true);
                    screenController.updateZoneDropDownValue = getZoneList!;
                    screenController.isLoading(false);
                  },
                ),
              ),
            ),
          ),
    );
  }

  Widget _deliveryBoyIdentityImageModule(BuildContext context) {
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
                screenController.updateIdentityImgFile == null
                    ? 'Identity Image'
                    : "${screenController.updateIdentityImgFile!.path}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.grey.shade700,
                  fontSize: 15.5,
                ),
              ),
            ),
            GestureDetector(
              onTap: () => _showPicker1(context),
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

  Widget _updateButton() {
    return GestureDetector(
      onTap: () async {
        if(screenController.updateDeliveryBoyFormKey.currentState!.validate()) {
          //screenController.updateDeliveryBoyByIdFunction(deliveryBoyId: singleDeliveryBoy.id);
         if(screenController.updateZoneDropDownValue.id == "0") {
          Fluttertoast.showToast(msg: "Please Select Zone!");
        } else {
           screenController.updateDeliveryBoyByIdFunction(deliveryBoyId: singleDeliveryBoy.id);
         }

        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Text(
            'Update',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
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
      screenController.updateDeliveryBoyImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }
  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.updateDeliveryBoyImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void _showPicker1(context) {
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
                        gallery1();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      camera1();
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
  void gallery1() async {
    final image = await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      screenController.updateIdentityImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }
  void camera1() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.updateIdentityImgFile = File(image.path);
      screenController.loadUI();
    } else{}
  }

}
