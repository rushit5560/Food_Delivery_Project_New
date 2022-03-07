class ApiUrl {
  // static const ApiMainPath = "http://5.189.147.159:9501/";
  // static const ApiMainPath = "http://192.168.29.94:4000/";
  static const ApiMainPath = "http://5.189.147.159:9501/";

  static const RegisterApi = ApiMainPath + "user/signUp";
  static const SignInApi = ApiMainPath + "user/signIn";
  static const CreateUserWalletApi = ApiMainPath + "wallet/create";
  static const UpdateUserProfile = ApiMainPath + "user/";

  static const AllCategoryApi = ApiMainPath + "Category/getAllCategory";
  static const AllCityApi = ApiMainPath + "city";
  static const ProductByIdApi = ApiMainPath + "product/find/";
  static const ProductReviewApi = ApiMainPath + "FoodReview/create";
  static const AllProductsApi = ApiMainPath + "product";
  static const BannerApi = ApiMainPath + "banner";

  static const CategoryWiseProductApi = ApiMainPath + "product/find/category/";
  static const UserAllOrderApi = ApiMainPath + "order/getAllOrder/Customer/";
  static const UserAccountApi = ApiMainPath + "user/find/";
  static const FoodCampaignApi = ApiMainPath + "FoodCampaign/getAllFoodCampaign";
  static const AllAreaUsingCityIdApi = ApiMainPath + "area/find/";
  static const ContactUsApi = ApiMainPath + "Contactus/create";
}