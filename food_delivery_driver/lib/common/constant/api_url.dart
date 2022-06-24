class ApiUrl {
  static const ApiMainPath = "http://192.168.0.105:4000/";

  static const SignInApi = ApiMainPath + "deliveryperson/signIn";
  static const SignUpApi = ApiMainPath + "deliveryperson/signUp";
  static const CreateDriverWalletApi = ApiMainPath + "deliverypersonwallet/create";
  static const GetProfileApi = ApiMainPath + "deliveryperson/find/";
  static const GetAllOrdersApi = ApiMainPath + "order/getAllOrder";
  static const BankInfoApi = ApiMainPath + "BankInfo/create";
  static const AllCityApi = ApiMainPath + "city";
  static const GetAllRestaurantsApi = ApiMainPath + "store/getAllStore";
  static const GetAllZoneApi = ApiMainPath + "Zone/getAllZone";

  /// Change Password API
  static const ChangePasswordApi = ApiMainPath + "deliveryperson/changepassword";

  /// Forgot Password API
  static const ForgotPasswordApi = ApiMainPath + "deliveryperson/forgotpassword";

  /// Get orders status wise
  static const RestaurantAllOrdersApi = ApiMainPath + "order/getAllOrder/Restaurant/";

}