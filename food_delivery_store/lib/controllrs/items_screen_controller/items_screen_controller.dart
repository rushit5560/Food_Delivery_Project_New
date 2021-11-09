import 'package:food_delivery_admin/common/app_images.dart';
import 'package:food_delivery_admin/models/items_screen_models/store_product_model.dart';
import 'package:get/get.dart';

class ItemScreenController extends GetxController {
  RxBool isStoreProductsSelected = true.obs;
  RxBool isAdminProductsSelected = false.obs;

  List<StoreProductModel> storeProductLists = [
    StoreProductModel(name: 'Pizza', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Burger', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Sandwich', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Hotdog', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Tacos', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Burrito', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Muffins', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Donuts', img: '${Images.ic_category1}', qty: '5'),
    StoreProductModel(name: 'Bacon', img: '${Images.ic_category1}', qty: '5'),
  ];
}