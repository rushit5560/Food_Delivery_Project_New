import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/store_profile_screen_controller/store_profile_screen_controller.dart';
import '../change_password_screen/change_password_screen.dart';


class StoreProfileModule extends StatelessWidget {
  StoreProfileModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();
  final ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        screenController.storeProfilePic != null
            ? ClipRRect(
          borderRadius:
          BorderRadius.circular(80.0),
          child: Image.file(
              screenController
                  .storeProfilePic!,
              height: 100,
              width: 100,
              fit: BoxFit.fill),
        )
            : ClipRRect(
          borderRadius:
          BorderRadius.circular(80.0),
          child: Image.network(
              "${screenController.storeProfile}",
              height: 100,
              width: 100,
              fit: BoxFit.fill),
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
      screenController.storeProfilePic = File(image.path);
      screenController.loadUI();
    } else{}
  }

  void camera() async {
    final image = await imagePicker.pickImage(source: ImageSource.camera);
    if(image != null){
      screenController.storeProfilePic = File(image.path);
      screenController.loadUI();
    } else{}
  }

}

class StoreNameFieldModule extends StatelessWidget {
  StoreNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Store Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: screenController.storeNameFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Store Name"),
          validator: (value) => FieldValidator().validateFullName(value!),
        ),
      ],
    );
  }
}

class FirstNameFieldModule extends StatelessWidget {
  FirstNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "First Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: screenController.firstNameFieldController,
          decoration: addProductTextFieldDecoration(hintText: "First Name"),
          validator: (value) => FieldValidator().validateFullName(value!),
        ),
      ],
    );
  }
}

class LastNameFieldModule extends StatelessWidget {
  LastNameFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Last Name",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: screenController.lastNameFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Last Name"),
          validator: (value) => FieldValidator().validateFullName(value!),
        ),
      ],
    );
  }
}

class AddressFieldModule extends StatelessWidget {
  AddressFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Address",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.text,
          controller: screenController.addressFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Address"),
          validator: (value) => FieldValidator().validateFullName(value!),
        ),
      ],
    );
  }
}

class PhoneFieldModule extends StatelessWidget {
  PhoneFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Phone",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 5),
        TextFormField(
          keyboardType: TextInputType.number,
          controller: screenController.phoneFieldController,
          decoration: addProductTextFieldDecoration(hintText: "Phone"),
          validator: (value) => FieldValidator().validateMobile(value!),
        ),
      ],
    );
  }
}

// class StoreGenderDropDownModule extends StatelessWidget {
//   StoreGenderDropDownModule({Key? key}) : super(key: key);
//   final screenController = Get.find<StoreProfileScreenController>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           "Gender",
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 18,
//           ),
//         ),
//         const SizedBox(height: 5),
//         Obx(
//           () => Container(
//             padding: const EdgeInsets.only(left: 10),
//             width: Get.width,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.all(Radius.circular(10)),
//               color: Colors.grey.shade200,
//             ),
//             child: Theme(
//               data: Theme.of(context).copyWith(
//                 canvasColor: Colors.grey.shade100,
//                 buttonTheme: ButtonTheme.of(context).copyWith(
//                   alignedDropdown: true,
//                 ),
//               ),
//               child: DropdownButtonHideUnderline(
//                 child: DropdownButton<String>(
//                   value: screenController.genderTypeValue.value,
//                   items: <String>[
//                     'Male',
//                     'Female',
//                   ].map<DropdownMenuItem<String>>((String value) {
//                     return DropdownMenuItem<String>(
//                       value: value,
//                       child: Text(
//                         value,
//                         style: TextStyle(color: Colors.black),
//                       ),
//                     );
//                   }).toList(),
//                   onChanged: (value) {
//                     screenController.isLoading(true);
//                     screenController.genderTypeValue.value = value!;
//                     screenController.isLoading(false);
//                   },
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }


class SubmitButtonModule extends StatelessWidget {
  SubmitButtonModule({Key? key}) : super(key: key);
  final screenController = Get.find<StoreProfileScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await screenController.updateStoreProfileByIdFunction();
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.colorDarkPink
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "Update",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

class ChangePassTextModule extends StatelessWidget {
  ChangePassTextModule({Key? key}) : super(key: key);
  // final accountScreenController = Get.find<AccountScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () => Get.to(
                  () => ChangePasswordScreen(),
              transition: Transition.rightToLeft,
              // arguments: "${accountScreenController.userEmail}",
            ),
            child: Text(
              "Change Password?",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.colorDarkPink,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

