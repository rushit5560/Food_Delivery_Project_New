import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/models/category_screen_model/category_model.dart';
import 'package:get/get.dart';

class CategoryScreenController extends GetxController {
  List<CategoryModel> categoryList = [
    CategoryModel(name: 'Pizza', img: '${Images.ic_category1}'),
    CategoryModel(name: 'Burger', img: '${Images.ic_category2}'),
    CategoryModel(name: 'Sandwich', img: '${Images.ic_category3}'),
    CategoryModel(name: 'Hotdog', img: '${Images.ic_category4}'),
    CategoryModel(name: 'Tacos', img: '${Images.ic_category5}'),
    CategoryModel(name: 'Burrito', img: '${Images.ic_category6}'),
    CategoryModel(name: 'Muffins', img: '${Images.ic_category1}'),
    CategoryModel(name: 'Donuts', img: '${Images.ic_category2}'),
    CategoryModel(name: 'Bacon', img: '${Images.ic_category3}'),
    CategoryModel(name: 'Pizza', img: '${Images.ic_category1}'),
    CategoryModel(name: 'Burger', img: '${Images.ic_category2}'),
    CategoryModel(name: 'Sandwich', img: '${Images.ic_category3}'),
    CategoryModel(name: 'Hotdog', img: '${Images.ic_category4}'),
    CategoryModel(name: 'Tacos', img: '${Images.ic_category5}'),
    CategoryModel(name: 'Burrito', img: '${Images.ic_category6}'),
    CategoryModel(name: 'Muffins', img: '${Images.ic_category1}'),
    CategoryModel(name: 'Donuts', img: '${Images.ic_category2}'),
    CategoryModel(name: 'Bacon', img: '${Images.ic_category3}'),
  ];
}