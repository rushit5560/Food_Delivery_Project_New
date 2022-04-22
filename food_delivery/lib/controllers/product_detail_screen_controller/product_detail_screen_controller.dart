import 'dart:convert';
import 'dart:developer';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../common/constant/user_details.dart';
import '../../models/cart_models/create_cart_model.dart';
import '../../models/my_wishlist_model/add_food_in_wishlist_model.dart';
import '../../models/product_details_model/give_product_review_model.dart';
import '../../models/product_details_model/product_details_model.dart';
import '../cart_screen_controller/cart_screen_controller.dart';



class ProductDetailScreenController extends GetxController{
  String productId = Get.arguments;

  /// Use For Get Cart API Call
  final cartScreenController = Get.find<CartScreenController>();

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  RxInt qty = 1.obs;

  String productName = '';
  String productRestaurantId = '';
  int productPrice = 0;
  String productDescription = '';

  RxDouble subTotalAmount = 0.0.obs;
  String? selectedProductRestaurantId;
  double? itemTotalPrice;
  RxDouble itemAddonPrice = 0.0.obs;


  void onClickedDec() {
    isLoading(true);
    if (qty > 1) {
      qty--;
      subTotalAmount.value = (productPrice * qty.value).toDouble();
      itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    }
    isLoading(false);
  }

  void onClickedInc() {
    isLoading(true);
    qty++;
    subTotalAmount.value = (productPrice * qty.value).toDouble();
    itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
    // if(qty < 9){
    //   qty++;
    // }
    isLoading(false);
  }

  /// Product Review
  giveProductReview(double rating) async {
    // isLoading(true);
    String url = ApiUrl.ProductReviewApi;
    print('Url : $url');

    try{
      Map<String, dynamic> data = {
        "Product" : "$productId",
        "Customer" : "${UserDetails.userId}",
        "Review" : "Testy Dish",
        "Rating" : "$rating"
      };

      http.Response response = await http.post(Uri.parse(url),body: data);
      print('response : $response');

      GiveProductReviewModel giveProductReviewModel = GiveProductReviewModel.fromJson(json.decode(response.body));
      isSuccessStatus = giveProductReviewModel.status.obs;

      print('isSuccessStatus : $isSuccessStatus');

      if(isSuccessStatus.value){
        Get.snackbar('${giveProductReviewModel.message}', '');
      } else {
        print('Give Product Review False False');
      }
    } catch(e) {
      print('Give Review Error : $e');
    } finally{
      // isLoading(false);
    }
  }

  /// Product details
  getProductByProductId() async {
    isLoading(true);
    String url = ApiUrl.ProductByIdApi;
    String finalUrl = url + "$productId";
    print('finalUrl : $finalUrl');

    try {
      http.Response response = await http.get(Uri.parse(finalUrl));
      print('response : $response');

      ProductDetailsModel productDetailsModel =
          ProductDetailsModel.fromJson(json.decode(response.body));
      isSuccessStatus = productDetailsModel.status.obs;

      if (isSuccessStatus.value) {
        productRestaurantId = productDetailsModel.product.store.id;
        productName = productDetailsModel.product.productName;
        productPrice = productDetailsModel.product.price;
        productDescription = productDetailsModel.product.description;
        subTotalAmount.value = (productPrice * qty.value).toDouble();
        selectedProductRestaurantId = productDetailsModel.product.store.id;
        log("selectedProductRestaurantId : $selectedProductRestaurantId");
        itemTotalPrice = subTotalAmount.value + itemAddonPrice.value;
      } else {
        print('Get Product By Id Else Else');
      }
    } catch (e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }

  /// Add Product In Cart
  addUserCartItemFunction() async {
    isLoading(true);
    String url = ApiUrl.CreateUserCartApi;
    log("Create Cart URL : $url");

    try {
      Map<String, dynamic> bodyData = {
        "UserId" : "${UserDetails.userId}",
        "RestaurantId" : "$selectedProductRestaurantId",
        "Quantity" : "$qty",
        "SubTotal" : "$subTotalAmount",
        "ProductId" : "$productId",
        "ProductQuantity" : "$qty",
        "ProductPrice" : "$productPrice",
        "ItemTotalPrice" : "$itemTotalPrice",
        "AddonTotalPrice" : "$itemAddonPrice"
      };
      log("bodyData : $bodyData");

      http.Response response = await http.post(Uri.parse(url), body: bodyData);
      log("response : ${response.body}");

      CreateCartModel createCartModel = CreateCartModel.fromJson(json.decode(response.body));
      isSuccessStatus = createCartModel.status.obs;

      if(isSuccessStatus.value) {
        log("Cart Added Details : ${createCartModel.cart.quantity}");
        Fluttertoast.showToast(msg: "Product Added in Cart!");
        await cartScreenController.getUserCartDetailsByIdFunction();
      } else {
        log("addUserCartItemFunction Else Else");
        if(createCartModel.message.contains("This product has already been used")) {
          Fluttertoast.showToast(msg: "Product Already in Cart!");
        } else if(createCartModel.message.contains("")) {

        }
      }


    } catch(e) {
      log("addUserCartItemFunction Error :: $e");
    } finally {
      isLoading(false);
    }

  }

  /// Delete Cart
  /*deleteCartFunction() async {
    // isLoading(true);
    String url = ApiUrl.DeleteUserCartApi;
    log("Delete User Cart API URL : $url");

    try{
      Map<String, dynamic> data = {"cartid" : "${UserCartDetails.userCartId}"};
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);

    } catch(e) {

    } finally {
      // isLoading(false);
    }

  }*/

  /// Add Food in Wishlist
  addFoodInWishlistFunction({required String productId, required String restaurantId}) async {
    isLoading(true);
    String url = ApiUrl.AddFoodInWishlistApi;
    log("Add Food In Wishlist Function : $url");

    try {
      Map<String, dynamic> data = {
        "UserId" : "${UserDetails.userId}",
        "ProductId" : "$productId",
        "RestaurantId" : "$restaurantId"
      };
      log("data : $data");

      http.Response response = await http.post(Uri.parse(url), body: data);
      // log("Add Food Wishlist Response : ${response.body}");

      AddFoodInWishlistModel addFoodInWishlistModel = AddFoodInWishlistModel.fromJson(json.decode(response.body));
      isSuccessStatus = addFoodInWishlistModel.status.obs;
      log("isSuccessStatus : $isSuccessStatus");

      if(isSuccessStatus.value) {
        Fluttertoast.showToast(msg: "${addFoodInWishlistModel.message}");
      } else {
        log("addFoodInWishlistFunction Else Else");
        if(addFoodInWishlistModel.message.contains("Food already exist")) {
          Fluttertoast.showToast(msg: "Food already exist in wishlist!");
        }
      }

    } catch(e) {
      log("addFoodInWishlistFunction Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  @override
  void onInit() {
    getProductByProductId();
    super.onInit();
  }
}