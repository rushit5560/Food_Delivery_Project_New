import 'package:get/get.dart';

class ProductDetailScreenController extends GetxController{
  RxBool isLoading = false.obs;
  RxInt qty = 1.obs;

  void onClickedDec() {
    isLoading(true);
    if (qty > 0) {
      qty--;
    }
    isLoading(false);
  }

  void onClickedInc() {
    isLoading(true);
    if(qty < 9){
      qty++;
    }
    isLoading(false);
  }
}