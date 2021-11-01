import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/models/basket_screen_model/cart_item_model.dart';
import 'package:get/get.dart';

class BasketScreenController extends GetxController {
  RxBool isLoading = false.obs;
  List<CartItemModel> basketItemsList = [
    CartItemModel(
      img: Images.ic_category1,
      name: 'Hot Dog',
      amount: '150.00',
      qty: 1,
    ),
    CartItemModel(
      img: Images.ic_category2,
      name: 'Burger',
      amount: '150.00',
      qty: 1,
    ),
    CartItemModel(
      img: Images.ic_category3,
      name: 'Burrito',
      amount: '150.00',
      qty: 1,
    ),
    CartItemModel(
      img: Images.ic_category2,
      name: 'Burger',
      amount: '150.00',
      qty: 1,
    ),
    CartItemModel(
      img: Images.ic_category3,
      name: 'Burrito',
      amount: '150.00',
      qty: 1,
    ),
    CartItemModel(
      img: Images.ic_category2,
      name: 'Burger',
      amount: '150.00',
      qty: 1,
    ),
    CartItemModel(
      img: Images.ic_category3,
      name: 'Burrito',
      amount: '150.00',
      qty: 1,
    ),
  ];

  void onClickedDec(int index) {
    isLoading(true);
    if (basketItemsList[index].qty > 0) {
      basketItemsList[index].qty--;
    }
    isLoading(false);
  }

  void onClickedInc(int index) {
    isLoading(true);
    if(basketItemsList[index].qty < 9){
      basketItemsList[index].qty++;
    }
    isLoading(false);
  }
}