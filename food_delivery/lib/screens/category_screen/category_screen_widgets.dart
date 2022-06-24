import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/category_screen_controller/category_screen_controller.dart';
import 'package:food_delivery/controllers/home_screen_controller/home_screen_controller.dart';
import 'package:food_delivery/screens/restaurant_wise_category_screen/restaurant_wise_category_screen.dart';
import 'package:food_delivery/screens/sub_category_screen/sub_category_screen.dart';
import 'package:get/get.dart';

class SearchFieldModule extends StatelessWidget {
  final categoryScreenController = Get.find<CategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: TextFormField(
        cursorColor: Colors.black,
        controller: categoryScreenController.searchFieldController,
        decoration: _inputDecoration(),
        onChanged: (value){
          if(value.isEmpty || value == "") {
            categoryScreenController.isLoading(true);
            categoryScreenController.searchCategoryList = [];
            categoryScreenController.isLoading(false);
            // categoryScreenController.loadUI();
          }
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
      suffixIcon: GestureDetector(
        onTap: () async {
          categoryScreenController.searchCategoryFunction();
        },
        child: Icon(
          Icons.search_rounded,
          color: AppColors.colorDarkPink,
          size: 25,
        ),
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
  //final categoryScreenController = Get.find<CategoryScreenController>();
  // CategoryListModule({required this.categoryScreenController});
  final homeScreenController = Get.find<HomeScreenController>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: homeScreenController.categoryList.isEmpty
      ? Center(child: Text("No Category Available!"))
      : GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: homeScreenController.categoryList.length,
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
            image: NetworkImage("${ApiUrl.ApiMainPath}${homeScreenController.categoryList[index].image}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _categoryItemNameModule(int index) {
    return Positioned(
      bottom: -15,
      child: Container(
        width: Get.width * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: Text(
              '${homeScreenController.categoryList[index].name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
    //log("Cat Id : ${homeScreenController.categoryList[index].id}");
    //Get.to(()=> SubCategoryScreen(), arguments: homeScreenController.categoryList[index].id);
    log('homeScreenController.categoryList[index].id: ${homeScreenController.categoryList[index].sId}');
    Get.to(()=> RestaurantWiseCategoryScreen(), arguments: homeScreenController.categoryList[index].sId);
  }
}

class SearchCategoryListModule extends StatelessWidget {
  SearchCategoryListModule({Key? key}) : super(key: key);
  final categoryScreenController = Get.find<CategoryScreenController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: categoryScreenController.searchCategoryList.isEmpty
          ? Center(child: Text("No Category Available!"))
          : GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: categoryScreenController.searchCategoryList.length,
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
            image: NetworkImage("${ApiUrl.ApiMainPath}${categoryScreenController.searchCategoryList[index].image}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _categoryItemNameModule(int index) {
    return Positioned(
      bottom: -15,
      child: Container(
        width: Get.width * 0.22,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Center(
            child: Text(
              '${categoryScreenController.searchCategoryList[index].name}',
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
    log("Cat Id : ${categoryScreenController.searchCategoryList[index].id}");
    Get.to(()=> SubCategoryScreen(), arguments: categoryScreenController.searchCategoryList[index].id);
  }

}

