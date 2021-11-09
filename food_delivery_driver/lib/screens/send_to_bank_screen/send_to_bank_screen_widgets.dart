import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/app_colors.dart';

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
  GlobalKey<FormState> formKey;
  TextEditingController holderNameFieldController;
  TextEditingController bankNameFieldController;
  TextEditingController branchCodeFieldController;
  TextEditingController accountNumberFieldController;
  TextEditingController upiFieldController;

  BankDetailsForm({
    required this.formKey,
    required this.holderNameFieldController,
    required this.bankNameFieldController,
    required this.branchCodeFieldController,
    required this.accountNumberFieldController,
    required this.upiFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Form(
        key: formKey,
        child: Column(
          children: [
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
          controller: holderNameFieldController,
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
          controller: bankNameFieldController,
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
          controller: branchCodeFieldController,
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
          controller: accountNumberFieldController,
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
          controller: upiFieldController,
          cursorColor: Colors.grey,
          keyboardType: TextInputType.text,
          decoration: inputDecoration(),
        ),
      ],
    );
  }

}

class SendToBankButton extends StatelessWidget {
  GlobalKey<FormState> formKey;
  TextEditingController holderNameFieldController;
  TextEditingController bankNameFieldController;
  TextEditingController branchCodeFieldController;
  TextEditingController accountNumberFieldController;
  TextEditingController upiFieldController;


  SendToBankButton({
    required this.formKey,
    required this.holderNameFieldController,
    required this.bankNameFieldController,
    required this.branchCodeFieldController,
    required this.accountNumberFieldController,
    required this.upiFieldController,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if(formKey.currentState!.validate()){
          holderNameFieldController.clear();
          bankNameFieldController.clear();
          branchCodeFieldController.clear();
          accountNumberFieldController.clear();
          upiFieldController.clear();
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