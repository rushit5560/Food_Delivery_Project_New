import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/common_functions.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';

import 'send_to_bank_screen_widgets.dart';

class SendToBankScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController holderNameFieldController = TextEditingController();
  TextEditingController bankNameFieldController = TextEditingController();
  TextEditingController branchCodeFieldController = TextEditingController();
  TextEditingController accountNumberFieldController = TextEditingController();
  TextEditingController upiFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => hideKeyboard(context),
      child: Scaffold(
        appBar: commonAppBarModule(title: 'Send To Bank'),

        body: SingleChildScrollView(
          child: Column(
            children: [

              AvailableBalanceModule(),
              BankInfo(),
              BankDetailsForm(
                formKey: formKey,
                holderNameFieldController: holderNameFieldController,
                bankNameFieldController: bankNameFieldController,
                branchCodeFieldController: branchCodeFieldController,
                accountNumberFieldController: accountNumberFieldController,
                upiFieldController: upiFieldController,
              ),
              const SizedBox(height: 20),
              SendToBankButton(
                formKey: formKey,
                holderNameFieldController: holderNameFieldController,
                bankNameFieldController: bankNameFieldController,
                branchCodeFieldController: branchCodeFieldController,
                accountNumberFieldController: accountNumberFieldController,
                upiFieldController: upiFieldController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

