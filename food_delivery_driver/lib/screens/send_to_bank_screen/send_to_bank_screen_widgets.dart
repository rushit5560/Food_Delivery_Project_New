import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:get/get.dart';

import '../../common/common_widgets.dart';
import '../../controllers/send_to_bank_screen_controller/send_to_bank_screen_controller.dart';
import '../../models/all_restaurants_model/all_restaurants_model.dart';

class AvailableBalanceModule extends StatelessWidget {
  const AvailableBalanceModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Available Balance',
            textScaleFactor: 1.1,
          ),
          Text(
            '\$00.00',
            textScaleFactor: 1.1,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class BankInfo extends StatelessWidget {
  const BankInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'Bank Info',
      textScaleFactor: 1.5,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.colorDarkPink,
      ),
    );
  }
}

class BankDetailsForm extends StatelessWidget {
  final sendToBankScreenController = Get.find<SendToBankScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: sendToBankScreenController.formKey,
        child: Column(
          children: [
            AllRestaurantsDropDownMenuModule(),
            const SizedBox(height: 10),
            _accountHolderNameField(),
            const SizedBox(height: 10),
            _bankNameField(),
            const SizedBox(height: 10),
            _branchCodeField(),
            const SizedBox(height: 10),
            _accountNumberField(),
            const SizedBox(height: 10),
            _upiField(),
          ],
        ),
      ),
    );
  }

  Widget _accountHolderNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Holder Name',
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: sendToBankScreenController.holderNameFieldController,
          cursorColor: Colors.grey,
          keyboardType: TextInputType.text,
          validator: (value) {
            if(value!.isEmpty){
              return 'Account Holder Name is Required!';
            }
          },
          decoration: inputDecoration(),
        ),
      ],
    );
  }

  Widget _bankNameField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Bank Name',
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: sendToBankScreenController.bankNameFieldController,
          cursorColor: Colors.grey,
          keyboardType: TextInputType.text,
          validator: (value) {
            if(value!.isEmpty){
              return 'Bank Name is Required!';
            }
          },
          decoration: inputDecoration(),
        ),
      ],
    );
  }

  Widget _branchCodeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Branch Code',
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: sendToBankScreenController.branchCodeFieldController,
          cursorColor: Colors.grey,
          keyboardType: TextInputType.text,
          validator: (value) {
            if(value!.isEmpty){
              return 'Branch Code is Required!';
            }
          },
          decoration: inputDecoration(),
        ),
      ],
    );
  }

  Widget _accountNumberField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Number',
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: sendToBankScreenController.accountNumberFieldController,
          cursorColor: Colors.grey,
          keyboardType: TextInputType.number,
          validator: (value) {
            if(value!.isEmpty){
              return 'Account Number is Required!';
            }
          },
          decoration: inputDecoration(),
        ),
      ],
    );
  }

  Widget _upiField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UPI (Optional)',
        ),
        SizedBox(height: 8),
        TextFormField(
          controller: sendToBankScreenController.upiFieldController,
          cursorColor: Colors.grey,
          keyboardType: TextInputType.text,
          decoration: inputDecoration(),
        ),
      ],
    );
  }

}

class SendToBankButton extends StatelessWidget {
  final sendToBankScreenController = Get.find<SendToBankScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if(sendToBankScreenController.formKey.currentState!.validate()){
          await sendToBankScreenController.updateDriverBankInfoFunction();
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Send To Bank',
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


class AllRestaurantsDropDownMenuModule extends StatelessWidget {
  AllRestaurantsDropDownMenuModule({Key? key}) : super(key: key);
  final screenController = Get.find<SendToBankScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> screenController.isLoading.value
      ? CustomCircularProgressIndicator()
      : Container(
        height: 45,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: Colors.grey.shade300),
        child: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Colors.grey.shade100,
              buttonTheme: ButtonTheme.of(context).copyWith(
                alignedDropdown: true,
              )),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<AllStore>(
              focusColor: Colors.white,
              value: screenController.restaurantsDropDownValue,
              style: TextStyle(color: Colors.white),
              iconEnabledColor: Colors.black,
              items: screenController.getAllRestaurantsList
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
                screenController.isLoading(true);
                screenController.restaurantsDropDownValue.storeName =
                    newValue!.storeName;
                screenController.restaurantsDropDownValue.id = newValue.id;
                screenController.isLoading(false);
              },
              hint: Text("Select Restaurants"),
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
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.grey.shade200,
      ),
    ),
  );
}