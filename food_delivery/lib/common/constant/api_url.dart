class ApiUrl {
  static const ApiMainPath = "http://5.189.147.159:9501/";

  /// SignIn & SignUp API
  static const RegisterApi = ApiMainPath + "user/signUp";
  static const SignInApi = ApiMainPath + "user/signIn";

  /// Create User Wallet API
  // static const CreateUserWalletApi = ApiMainPath + "wallet/create";
  static const GetUserWalletApi = ApiMainPath + "wallet/find/user/";

  /// User Profile API
  static const UpdateUserProfile = ApiMainPath + "user/";
  static const GetUserProfileApi = ApiMainPath + "user/find/";

  /// Category & Sub Category API
  static const AllCategoryApi = ApiMainPath + "Category/getAllCategory";
  static const RestaurantWiseCategoryApi = ApiMainPath + "Category/Restaurant/find/";
  static const CategoryWiseSubCategoryApi = ApiMainPath + "Subcategory/find/category/";

  /// City, Area API
  static const AllCityApi = ApiMainPath + "city";
  static const AllAreaUsingCityIdApi = ApiMainPath + "area/find/";

  /// Campaign API
  static const FoodCampaignApi = ApiMainPath + "FoodCampaign/getAllFoodCampaign";

  /// Banner API
  static const BannerApi = ApiMainPath + "banner";

  /// Product API
  static const AllProductsApi = ApiMainPath + "product/GetAllproduct";
  static const ProductByIdApi = ApiMainPath + "product/find/";
  static const ProductReviewApi = ApiMainPath + "FoodReview/create";
  static const CategoryWiseProductApi = ApiMainPath + "product/find/category/";

  /// User Orders API
  static const UserAllOrderApi = ApiMainPath + "order/getAllOrder/Customer/";

  /// User Account API
  static const UserAccountApi = ApiMainPath + "user/find/";

  /// Contact Us API
  static const ContactUsApi = ApiMainPath + "Contactus/create";

  /// Restaurant API
  static const AllRestaurantApi = ApiMainPath + "store/getAllStore";
  static const SearchRestaurantApi = ApiMainPath + "store/getsearchdata";

  /// Cart API
  static const GetUserCartApi = ApiMainPath + "cart/user/find/";
  static const CreateUserCartApi = ApiMainPath + "cart/create";
  static const DeleteUserCartApi = ApiMainPath + "cart/delete/Cart";
  static const UpdateCartItemQuantityApi = ApiMainPath + "cart/quantity";
  static const DeleteCartItemApi = ApiMainPath + "cart/delete/CartItem";

  /// Search Products API
  static const SearchFoodProductsApi = ApiMainPath + "product/getsearchdata";

  /// Change Password API
  static const ChangePasswordApi = ApiMainPath + "user/changepassword";

}