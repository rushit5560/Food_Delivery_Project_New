import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:get/get.dart';

import '../../common/constants/app_colors.dart';
import '../../common/constants/field_validation.dart';
import '../../common/text_fields_decorations/add_product_textfield_decoration.dart';
import '../../controllers/bank_info_screen_controller/bank_info_screen_controller.dart';

class BankDetailsFormModule extends StatelessWidget {
  BankDetailsFormModule({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Bank Information",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        const SizedBox(height: 15),

        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            border: Border.all(),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [

                _singleItemModule(key: "Bank Name :", value: "${screenController.bankName}"),
                const SizedBox(height: 10),

                _singleItemModule(key: "Branch :", value: "${screenController.branch}"),
                const SizedBox(height: 10),

                _singleItemModule(key: "Holder Name :", value: "${screenController.holderName}"),
                const SizedBox(height: 10),

                _singleItemModule(key: "Account No :", value: "${screenController.accountNo}"),
                const SizedBox(height: 10),

              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _singleItemModule({required String key, required String value}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey.shade200,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Text(
                key,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              flex: 6,
              child: Text(
                value,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EditBankInfoButton extends StatelessWidget {
  EditBankInfoButton({Key? key}) : super(key: key);
  final screenController = Get.find<BankInfoScreenController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        screenController.isLoading(true);

        // screenController.bankNameFieldController.text = "Bank Of Baroda";
        // screenController.branchCodeFieldController.text = "xxx23";
        // screenController.holderNameFieldController.text = "xxx23";
        // screenController.accountNoFieldController.text = "1234567890123";

        editBankInfo(context);

        screenController.isLoading(false);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.edit, color: AppColors.colorLightPink, size: 18),
              const SizedBox(width: 10),
              Text(
                'Edit',
                style: TextStyle(
                  color: AppColors.colorLightPink,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  editBankInfo(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return Obx(
          ()=> screenController.isLoading.value
            ? CustomCircularProgressIndicator()
          : StatefulBuilder(builder: (context, setState2) {
            return AlertDialog(
              content: Form(
                key: screenController.bankInfoFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _headingNameModule(name: "Bank Name"),
                      const SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: screenController.bankNameFieldController,
                        decoration: addProductTextFieldDecoration(hintText: "Bank Name"),
                        validator: (value) => FieldValidator().validateFullName(value!),
                      ),

                      const SizedBox(height: 8),
                      _headingNameModule(name: "Branch"),
                      const SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: screenController.branchCodeFieldController,
                        decoration: addProductTextFieldDecoration(hintText: "Branch"),
                        validator: (value) => FieldValidator().validateFullName(value!),
                      ),

                      const SizedBox(height: 8),
                      _headingNameModule(name: "Holder Name"),
                      const SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: screenController.holderNameFieldController,
                        decoration: addProductTextFieldDecoration(hintText: "Holder Name"),
                        validator: (value) => FieldValidator().validateFullName(value!),
                      ),

                      const SizedBox(height: 8),
                      _headingNameModule(name: "Account Number"),
                      const SizedBox(height: 5),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: screenController.accountNoFieldController,
                        decoration: addProductTextFieldDecoration(hintText: "Account Number"),
                        validator: (value) => FieldValidator().validateFullName(value!),
                      ),

                      const SizedBox(height: 15),
                      _submitButton(),

                    ],
                  ),
                ),
              ),
            );
          }),
        );
      }
    );
  }

  Widget _headingNameModule({required String name}) {
    return Padding(
      padding: const EdgeInsets.only(left: 5),
      child: Text(
        name,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _submitButton() {
    return GestureDetector(
      onTap: () async {
        await screenController.updateRestaurantBankInfoFunction();
      },
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColors.colorDarkPink,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: Text(
              'Submit',
              style: TextStyle(
                color: AppColors.colorLightPink,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

