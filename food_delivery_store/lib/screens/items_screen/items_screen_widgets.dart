import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:get/get.dart';
import '../../common/constants/api_url.dart';
import '../../controllers/items_screen_controller/items_screen_controller.dart';
import '../../models/items_screen_models/get_restaurant_all_product_model.dart';
import 'update_item_screen/update_item_screen.dart';

class MainTabsModule extends StatelessWidget {
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 10),
              child: GestureDetector(
                onTap: () {
                  itemScreenController.isStoreProductsSelected.value = true;
                  itemScreenController.isAdminProductsSelected.value = false;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColors.colorDarkPink, width: 2),
                    color: itemScreenController.isStoreProductsSelected.value
                        ? AppColors.colorDarkPink
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Store Products',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color:
                              itemScreenController.isStoreProductsSelected.value
                                  ? Colors.white
                                  : AppColors.colorDarkPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 20, left: 10),
              child: GestureDetector(
                onTap: () {
                  itemScreenController.isStoreProductsSelected.value = false;
                  itemScreenController.isAdminProductsSelected.value = true;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border:
                        Border.all(color: AppColors.colorDarkPink, width: 2),
                    color: itemScreenController.isAdminProductsSelected.value
                        ? AppColors.colorDarkPink
                        : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Admin Products',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color:
                              itemScreenController.isAdminProductsSelected.value
                                  ? Colors.white
                                  : AppColors.colorDarkPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoreProductsModule extends StatelessWidget {
  const StoreProductsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProductsListModule();
  }
}

class StoreProductsListModule extends StatelessWidget {
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return itemScreenController.storeProductList.length == 0
        ? Center(child: Text("There is No Store Products"))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: itemScreenController.storeProductList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                StoreFood storeSingleItem = itemScreenController.storeProductList[index];
                return GestureDetector(
                  onTap: () => _bottomSheetModule(context, storeSingleItem),
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
            image: NetworkImage('${ApiUrl.ApiMainPath}' +
                '${itemScreenController.storeProductList[index].image}'),
          ),
        ),
      ),
    );
  }

  Widget _categoryItemNameModule(int index) {
    return Positioned(
      bottom: -18,
      child: Container(
        width: Get.width / 4,
        height: 38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '${itemScreenController.storeProductList[index].productName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 0.85,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                'Qty ${itemScreenController.storeProductList[index].quantity}',
                textScaleFactor: 0.60,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


 Future _bottomSheetModule(BuildContext context, StoreFood storeSingleItem) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      itemScreenController.isLoading(true);

                      itemScreenController.updateFoodNameFieldController.text = storeSingleItem.productName;
                      itemScreenController.updateFoodDescriptionFieldController.text = storeSingleItem.description;
                      itemScreenController.updateFoodPriceFieldController.text = storeSingleItem.price.toString();
                      itemScreenController.updateFoodDiscountFieldController.text = storeSingleItem.discount.toString();
                      itemScreenController.updateFoodQtyFieldController.text = storeSingleItem.quantity.toString();
                      itemScreenController.updateFoodMrpFieldController.text = storeSingleItem.mrp.toString();
                      itemScreenController.updateStartTimeString.value = storeSingleItem.startTime;
                      itemScreenController.updateEndTimeString.value = storeSingleItem.endTime;
                      itemScreenController.updatePhotoUrl = ApiUrl.ApiMainPath + storeSingleItem.image;


                      itemScreenController.updateFoodTypeValue.value = storeSingleItem.productType.value;


                      for(int i = 0; i < itemScreenController.getRestaurantCategoryList.length; i++) {
                        if(itemScreenController.getRestaurantCategoryList[i].id == storeSingleItem.category.id) {
                          itemScreenController.updateCategoryDropDownValue = itemScreenController.getRestaurantCategoryList[i];
                        }
                      }

                      for(int i = 0; i <itemScreenController.getSubCategoryList.length; i++) {
                        if(itemScreenController.getSubCategoryList[i].id == storeSingleItem.subCategory.id) {
                          itemScreenController.updateSubCategoryDropDownValue = itemScreenController.getSubCategoryList[i];
                        }
                      }

                      itemScreenController.updateSelectedAttributes.clear();
                      for(int i = 0; i < storeSingleItem.attribute.length; i++) {
                        Map<String, String> item = {"value" : "${storeSingleItem.attribute[i].id}", "label" : "${storeSingleItem.attribute[i].label}"};
                        itemScreenController.updateSelectedAttributes.add(item);
                      }

                      itemScreenController.updateSelectedAddons.clear();
                      for(int i = 0; i < storeSingleItem.addon.length; i++) {
                        Map<String, String> item = {"value" : "${storeSingleItem.addon[i].id}", "label" : "${storeSingleItem.addon[i].label}"};
                        itemScreenController.updateSelectedAddons.add(item);
                      }

                      log("updateFoodNameFieldController : ${itemScreenController.updateFoodNameFieldController.text}");
                      log("updateFoodDescriptionFieldController : ${itemScreenController.updateFoodDescriptionFieldController.text}");
                      log("updateFoodPriceFieldController : ${itemScreenController.updateFoodPriceFieldController.text}");
                      log("updateFoodDiscountFieldController : ${itemScreenController.updateFoodDiscountFieldController.text}");
                      log("updateFoodQtyFieldController : ${itemScreenController.updateFoodQtyFieldController.text}");
                      log("updateFoodMrpFieldController : ${itemScreenController.updateFoodMrpFieldController.text}");
                      log("updateStartTimeString : ${itemScreenController.updateStartTimeString}");
                      log("updateEndTimeString : ${itemScreenController.updateEndTimeString}");
                      log("updateFoodTypeValue : ${itemScreenController.updateFoodTypeValue}");
                      log("updateCategoryDropDownValue : ${itemScreenController.updateCategoryDropDownValue.name}");
                      log("updateSubCategoryDropDownValue : ${itemScreenController.updateSubCategoryDropDownValue!.name}");
                      log("updateSubCategoryDropDownValue : ${itemScreenController.updateSelectedAttributes}");
                      log("updateSelectedAddonList : ${itemScreenController.updateSelectedAddons}");

                      Get.back();
                      Get.to(()=> UpdateItemScreen(productId: storeSingleItem.id), transition: Transition.zoom)!
                      .then((value) async {
                        await itemScreenController.getStoreProductList();
                      });

                      itemScreenController.isLoading(false);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.colorDarkPink,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Text(
                          "Update",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GestureDetector(
                    onTap: () async {
                      await itemScreenController.deleteStoreProductByIdFunction(productId: storeSingleItem.id);
                      Get.back();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.colorDarkPink,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        child: Text(
                          "Delete",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
 }


}

class AdminProductsModule extends StatelessWidget {
  const AdminProductsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdminProductsListModule();
  }
}

class AdminProductsListModule extends StatelessWidget {
  AdminProductsListModule({Key? key}) : super(key: key);
  final itemScreenController = Get.find<ItemScreenController>();

  @override
  Widget build(BuildContext context) {
    return itemScreenController.adminProductsList.length == 0
        ? Center(child: Text("There is No Store Products"))
        : Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: itemScreenController.adminProductsList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  // onTap: () => _onItemClick(index),
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
            image: NetworkImage('${ApiUrl.ApiMainPath}' +
                '${itemScreenController.adminProductsList[index].image}'),
          ),
        ),
      ),
    );
  }

  Widget _categoryItemNameModule(int index) {
    return Positioned(
      bottom: -22,
      child: Container(
        width: Get.width / 4,
        height: 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  '${itemScreenController.adminProductsList[index].productName}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textScaleFactor: 0.85,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                'Qty ${itemScreenController.adminProductsList[index].quantity}',
                textScaleFactor: 0.60,
                style: TextStyle(
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
