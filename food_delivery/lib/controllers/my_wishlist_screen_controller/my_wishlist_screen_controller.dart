import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/models/my_wishlist_model/wishlist_model.dart';
import 'package:get/get.dart';

class MyWishListScreenController extends GetxController{
  List<WishListModel> wishList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getWishList();
  }

  getWishList(){
    wishList.add(
      WishListModel(
          img: Images.ic_category6,
          name: 'Hot Dog',
          price: '\$150.00',
          qty: '150 gms',
          type: 'Regular'
      ),
    );
    wishList.add(
      WishListModel(
          img: Images.ic_category4,
          name: 'SandWich',
          price: '\$150.00',
          qty: '150 gms',
          type: 'Regular'
      ),
    );
    wishList.add(
      WishListModel(
          img: Images.ic_category3,
          name: 'Burger',
          price: '\$150.00',
          qty: '150 gms',
          type: 'Regular'
      ),
    );
    wishList.add(
      WishListModel(
          img: Images.ic_category5,
          name: 'Pizza',
          price: '\$150.00',
          qty: '150 gms',
          type: 'Regular'
      ),
    );
    wishList.add(
      WishListModel(
          img: Images.ic_category1,
          name: 'Burger',
          price: '\$150.00',
          qty: '150 gms',
          type: 'Regular'
      ),
    );
    wishList.add(
      WishListModel(
          img: Images.ic_category1,
          name: 'Burger',
          price: '\$150.00',
          qty: '150 gms',
          type: 'Regular'
      ),
    );
  }
}