import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:get/get.dart';

import '../../controllers/language_screen_controller/language_screen_controller.dart';

class LanguageListModule extends StatelessWidget {
  LanguageScreenController languageScreenController = Get.find<LanguageScreenController>();

  // LanguageListModule({required this.languageScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        itemCount: languageScreenController.languageList.length,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 3,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print('index - $index');
              languageScreenController.isClicked.value = index;
            },
            child: Obx(
              ()=> languageScreenController.isLoading.value
                  ? Container()
                  : Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.colorDarkPink),
                  color: languageScreenController.isClicked.value == index ? AppColors.colorDarkPink : Colors.white
                ),
                child: Center(
                  child: Text(
                    '${languageScreenController.languageList[index]}',
                    textScaleFactor: 1.2,
                    style: TextStyle(
                      color: languageScreenController.isClicked.value == index? Colors.white : Colors.black
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ContinueButtonModule extends StatelessWidget {
  const ContinueButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.colorDarkPink,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
          child: Text(
            'Continue',
            textScaleFactor: 1.1,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
