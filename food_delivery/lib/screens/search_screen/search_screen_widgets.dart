import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constant/app_colors.dart';
import '../../controllers/search_screen_controller/search_screen_controller.dart';

class SearchTextFieldModule extends StatelessWidget {
  SearchTextFieldModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: screenController.searchFieldController,
      cursorColor: Colors.grey,
      onChanged: (value){
        print('$value');
      },
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        isDense: true,
        contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.grey.shade200),
        ),
        prefixIcon: Icon(Icons.search_rounded, color: AppColors.colorDarkPink),
      ),
    );
  }
}

class SearchFoodListModule extends StatelessWidget {
  const SearchFoodListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder();
  }
}

