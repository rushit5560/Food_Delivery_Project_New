class ApiUrl {
  // static const ApiMainPath = "http://5.189.147.159:9501/";
  static const ApiMainPath = "http://5.189.147.159:9501/";

  static const SignUpApi = ApiMainPath + "store/create";
  static const SignInApi = ApiMainPath + "store/SignIn";
  static const TodayOrderApi = ApiMainPath + "order/getAllOrder/Restaurant/";
  static const StoreProductApi = ApiMainPath + "product/getAll/Restaurant/";

  static const AllCityApi = ApiMainPath + "city";
  static const AddProductApi = ApiMainPath + "product/create";
  static const GetProfileApi = ApiMainPath + "store/find/";

  static const GetRestaurantProductsApi = ApiMainPath + "product/getAll/Restaurant/";

}