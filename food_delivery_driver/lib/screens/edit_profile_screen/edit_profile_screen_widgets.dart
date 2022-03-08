import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';

class HeaderText extends StatelessWidget {
  const HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Profile Info',
      textScaleFactor: 1.4,
      style: TextStyle(
        color: AppColors.colorDarkPink,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class FullNameFieldModule extends StatelessWidget {
  TextEditingController fullNameFieldController;
  FullNameFieldModule({required this.fullNameFieldController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Full Name',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 7,
          child: TextFormField(
            controller: fullNameFieldController,
            readOnly: true,
            decoration: inputDecoration(),
          ),
        ),
      ],
    );
  }
}

class EmailFieldModule extends StatelessWidget {
  TextEditingController emailFieldController;
  EmailFieldModule({required this.emailFieldController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Email',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 7,
          child: TextFormField(
            controller: emailFieldController,
            readOnly: true,
            decoration: inputDecoration(),
          ),
        ),
      ],
    );
  }
}

class PhoneNoFieldModule extends StatelessWidget {
  TextEditingController phoneNoFieldController;
  PhoneNoFieldModule({required this.phoneNoFieldController});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: Text(
            'Phone No',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 7,
          child: TextFormField(
            controller: phoneNoFieldController,
            readOnly: true,
            decoration: inputDecoration(),
          ),
        ),
      ],
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkPink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: Text(
            'Update',
            textScaleFactor: 1.2,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}


InputDecoration inputDecoration() {
  return InputDecoration(
    fillColor: Colors.grey.shade200,
    filled: true,
    isDense: true,
    contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 12),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(color: Colors.grey.shade200),
    ),
  );
}
