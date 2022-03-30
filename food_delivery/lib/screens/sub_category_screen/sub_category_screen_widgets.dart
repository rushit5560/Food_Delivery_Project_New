

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/api_url.dart';
import '../../common/constant/app_colors.dart';
import '../../common/constant/enums.dart';
import '../../controllers/sub_category_screen_controller/sub_category_screen_controller.dart';
import '../products_list_screen/products_list_screen.dart';

class SubCategorySearchFieldModule extends StatelessWidget {
  SubCategorySearchFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SubCategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: screenController.subCategorySearchFieldController,
        decoration: _inputDecoration(),
        onChanged: (value){
          print('Search value : $value');
        },
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.all(15),
      filled: true,
      fillColor: Colors.grey.shade200,
      hintText: 'Search',
      prefixIcon: Icon(
        Icons.search_rounded,
        color: Colors.grey,
        size: 25,
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey.shade200),
      ),
    );
  }

}

class SubCategoryListModule extends StatelessWidget {
  final screenController = Get.find<SubCategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: screenController.subCategoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index){
          return GestureDetector(
            onTap: () => _onItemClick(index),
            child: Container(
              child: Column(
                children: [
                  Expanded(
                    flex: 85,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        _categoryItemImageModule(index),
                        _categoryItemNameModule(index),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: Container(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _categoryItemImageModule(int index) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Image(
            image: NetworkImage("${ApiUrl.ApiMainPath}${screenController.subCategoryList[index].image}"),
          ),
        ),
      ),
    );
  }

  Widget _categoryItemNameModule(int index) {
    return Positioned(
      bottom: -15,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: Text(
              '${screenController.subCategoryList[index].name}',
              textScaleFactor: 0.85,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _onItemClick(int index) {
    log("Cat Id : ${screenController.subCategoryList[index].id}");
    Get.to(()=> ProductsListScreen(), arguments: [ProductsEnum.SubCategoryWiseProducts, screenController.subCategoryList[index].id]);
  }

}
