import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/controllrs/items_screen_controller/items_screen_controller.dart';
import 'package:get/get.dart';

class MainTabsModule extends StatelessWidget {
  ItemScreenController itemScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Row(
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
                    border: Border.all(
                        color: AppColors.colorDarkPink,
                        width: 2
                    ),
                    color: itemScreenController.isStoreProductsSelected.value ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Store Products',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: itemScreenController.isStoreProductsSelected.value ? Colors.white : AppColors.colorDarkPink,
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
                    border: Border.all(
                        color: AppColors.colorDarkPink,
                        width: 2
                    ),
                    color: itemScreenController.isAdminProductsSelected.value ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Admin Products',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: itemScreenController.isAdminProductsSelected.value ? Colors.white : AppColors.colorDarkPink,
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
  // const StoreProductsListModule({Key? key}) : super(key: key);
  ItemScreenController itemScreenController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemCount: itemScreenController.storeProductLists.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index){
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
            image: AssetImage('${itemScreenController.storeProductLists[index].img}'),
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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${itemScreenController.storeProductLists[index].name}',
                textScaleFactor: 0.85,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),

              Text(
                'Qty ${itemScreenController.storeProductLists[index].qty}',
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

class AdminProductsModule extends StatelessWidget {
  const AdminProductsModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProductsListModule();
  }
}


