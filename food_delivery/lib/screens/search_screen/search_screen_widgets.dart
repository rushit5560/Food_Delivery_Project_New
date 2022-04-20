import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_functions.dart';
import 'package:get/get.dart';

import '../../common/constant/api_url.dart';
import '../../common/constant/app_colors.dart';
import '../../controllers/search_screen_controller/search_screen_controller.dart';
import '../../models/search_screen_models/search_product_model.dart';
import '../product_detail_screen/product_details_screen.dart';

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
        hintText: 'Search Food',
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
        suffixIcon: GestureDetector(
          onTap: () async {
            if(screenController.searchFieldController.text.trim().isNotEmpty) {
              await screenController.searchFoodProductsFunction();
              hideKeyboard();
            }
          },
          child: Icon(
              Icons.search_rounded,
              color: AppColors.colorDarkPink,
            size: 22,
          ),
        ),
      ),
    );
  }
}

class SearchFoodListModule extends StatelessWidget {
  SearchFoodListModule({Key? key}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.searchedFoodList.length,
      itemBuilder: (context, i) {
        SingleFoodItem singleFoodItem = screenController.searchedFoodList[i];
        return SearchedFoodListTile(singleFoodItem: singleFoodItem);
      },
    );
  }
}

class SearchedFoodListTile extends StatelessWidget {
  final SingleFoodItem singleFoodItem;
  SearchedFoodListTile({Key? key, required this.singleFoodItem}) : super(key: key);
  final screenController = Get.find<SearchScreenController>();

  @override
  Widget build(BuildContext context) {
    String productImage = ApiUrl.ApiMainPath + "${singleFoodItem.image}";
    return GestureDetector(
      onTap: () {
        print('Product Id : ${singleFoodItem.id}');
        Get.to(()=> ProductDetailScreen(), arguments: singleFoodItem.id);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: AppColors.colorGrey),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 7,
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(productImage),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${singleFoodItem.productName}",
                              maxLines: 1,
                              style: TextStyle(
                                  color: AppColors.colorDarkPink,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              child: Flexible(
                                child: Text(
                                  "${singleFoodItem.description}",
                                  maxLines: 1,
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 16),
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${singleFoodItem.price}",
                                  style: TextStyle(
                                      fontSize: 19, fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 5),
                                Text("Type - ${singleFoodItem.productType.value}"),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    "Qty - 150gms",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              CircleAvatar(
                radius: 15,
                backgroundColor: AppColors.colorDarkPink,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}


