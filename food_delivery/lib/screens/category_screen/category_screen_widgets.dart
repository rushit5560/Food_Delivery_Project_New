import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen.dart';
import 'package:food_delivery/screens/products_list_screen/products_list_screen.dart';
import 'package:get/get.dart';

import '../../common/constant/enums.dart';
import '../../models/category_screen_model/all_category_model.dart';

class SearchFieldModule extends StatelessWidget {
  TextEditingController searchFieldController;
  SearchFieldModule({required this.searchFieldController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: searchFieldController,
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


class CategoryListModule extends StatelessWidget {
  CategoryScreenController categoryScreenController = Get.find<CategoryScreenController>();
  // CategoryListModule({required this.categoryScreenController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: categoryScreenController.allCategoryList.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index){
          AllCategory singleCategory = categoryScreenController.allCategoryList[index];
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
            image: NetworkImage("${ApiUrl.ApiMainPath}${categoryScreenController.allCategoryList[index].image}"),
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
              '${categoryScreenController.allCategoryList[index].name}',
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
    print('Clicked On : $index');
    Get.to(()=> ProductsListScreen(), arguments: [ProductsEnum.CategoryWiseProducts, categoryScreenController.allCategoryList[index].id]);
    // Get.to(()=> ProductDetailScreen());
  }
}
