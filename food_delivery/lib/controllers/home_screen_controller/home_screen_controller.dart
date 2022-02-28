import 'package:food_delivery/common/constant/app_images.dart';
import 'package:get/get.dart';

class CategoryModel{
  CategoryModel({
    required this.image,
    required this.name,
  });

  String image;
  String name;

}

class HomeScreenController extends GetxController{
  var activeIndex = 0.obs;
  List<CategoryModel> category = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategoryList();
  }

  getCategoryList() {
    category.add(
      CategoryModel(
        image: Images.ic_category2,
        name: 'Pizza',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category1,
        name: 'Burger',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category4,
        name: 'Sandwich',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category3,
        name: 'French Fries',
      ),
    );
    category.add(
      CategoryModel(
        image: Images.ic_category5,
        name: 'HotDog',
      ),
    );

  }
}