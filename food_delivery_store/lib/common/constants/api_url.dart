class ApiUrl {
  // static const ApiMainPath = "http://5.189.147.159:9501/";
  static const ApiMainPath = "http://5.189.147.159:9501/";

  static const SignUpApi = ApiMainPath + "store/create";
  static const SignInApi = ApiMainPath + "store/SignIn";
  static const RestaurantAllOrdersApi = ApiMainPath + "order/getAllOrder/Restaurant/";

  static const AllCityApi = ApiMainPath + "city";
  static const AddProductApi = ApiMainPath + "product/create";
  static const GetProfileApi = ApiMainPath + "store/find/";

  static const GetRestaurantProductsApi = ApiMainPath + "product/getAll/Restaurant/";
  static const GetAdminProductsApi = ApiMainPath + "product";
  static const GetProductDetailsApi = ApiMainPath + "product/find/";

  static const GetSubCategoryApi = ApiMainPath + "Subcategory/find/Category/";
  static const GetAllAttributesApi = ApiMainPath + "Attribute/getAllAttributes";
  static const GetRestaurantAddonsApi = ApiMainPath + "Addon/find/Restaurant/";

  /// Category API
  static const GetRestaurantCategoryApi = ApiMainPath + "Category/Restaurant/find/";
  static const CreateRestaurantCategoryApi = ApiMainPath + "Category/create";
  static const UpdateRestaurantCategoryApi = ApiMainPath + "Category/updatecategory/";
  static const DeleteRestaurantCategoryApi = ApiMainPath + "Category/deletecategory/";

  /// Addon API
  static const CreateAddonApi = ApiMainPath + "Addon/create";
  static const GetAllAddonApi = ApiMainPath + "Addon/find/Restaurant/";
  static const UpdateAddonApi = ApiMainPath + "Addon/update/";
  static const DeleteAddonApi = ApiMainPath + "Addon/delete/";

  static const CreateAttributeApi = ApiMainPath + "Attribute/create";
  static const GetAllAttributeApi = ApiMainPath + "Attribute/getAllAttributes";

  /// Sub Category API
  static const CreateSubCategoryApi = ApiMainPath + "Subcategory/create";
  static const GetAllSubCategoryApi = ApiMainPath + "Subcategory/find/Restaurant/";
  static const UpdateSubCategoryApi = ApiMainPath + "Subcategory/updatesubcategory/";
  static const DeleteSubCategoryApi = ApiMainPath + "Subcategory/deletesubcategory/";


  static const GetAllDeliveryManApi = ApiMainPath + "deliveryperson/Restaurant/find/";
  static const AddDeliveryManApi = ApiMainPath + "deliveryperson/signUp";

  static const GetAllZoneApi = ApiMainPath + "area";

  /// Bank Info API
  static const GetRestaurantBankInfoApi = ApiMainPath + "BankInfo/find/";
  static const EditRestaurantBankInfoApi = ApiMainPath + "BankInfo/create";

  /// Review API
  static const GetCustomerFoodReviewApi = ApiMainPath + "FoodReview/restaurant/find/";
  static const GetFoodReviewsApi = ApiMainPath + "FoodReview/find/";

  /// Employee API
  static const GetRestaurantEmployeeApi = ApiMainPath + "Employee/restaurant/find/";
  static const AddRestaurantEmployeeApi = ApiMainPath + "Employee/create";
  static const DeleteRestaurantEmployeeApi = ApiMainPath + "Employee/delete/";
  static const UpdateRestaurantEmployeeApi = ApiMainPath + "Employee/update/";

  static const GetAllEmployeeRoleAPI = ApiMainPath + "EmployeeRole/getAllEmployeeRole";
}