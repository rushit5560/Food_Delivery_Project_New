import 'dart:convert';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/category_screen_model/all_category_model.dart';

class CategoryScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;
  List<AllCategory> allCategoryList = [];

  getAllCategoryList() async {
    isLoading(true);
    String url =ApiUrl.AllCategoryApi;
    print('Url : $url');

    try{
      http.Response response = await http.get(Uri.parse(url));

      print('Response : $response');

      AllCategoryModel allCategoryModel = AllCategoryModel.fromJson(json.decode(response.body));
      isSuccessStatus = allCategoryModel.status.obs;

      if(isSuccessStatus.value){
        allCategoryList = allCategoryModel.allCategory;
        print('allCategoryList : $allCategoryList');
      } else {
        print('Get All Category Else Else');
      }
    } catch(e) {
      print('Error : $e');
    } finally {
      isLoading(false);
    }
  }


  // List<CategoryModel> categoryList = [
  //   CategoryModel(name: 'Pizza', img: '${Images.ic_category1}'),
  //   CategoryModel(name: 'Burger', img: '${Images.ic_category2}'),
  //   CategoryModel(name: 'Sandwich', img: '${Images.ic_category3}'),
  //   CategoryModel(name: 'Hotdog', img: '${Images.ic_category4}'),
  //   CategoryModel(name: 'Tacos', img: '${Images.ic_category5}'),
  //   CategoryModel(name: 'Burrito', img: '${Images.ic_category6}'),
  //   CategoryModel(name: 'Muffins', img: '${Images.ic_category1}'),
  //   CategoryModel(name: 'Donuts', img: '${Images.ic_category2}'),
  //   CategoryModel(name: 'Bacon', img: '${Images.ic_category3}'),
  //   CategoryModel(name: 'Pizza', img: '${Images.ic_category1}'),
  //   CategoryModel(name: 'Burger', img: '${Images.ic_category2}'),
  //   CategoryModel(name: 'Sandwich', img: '${Images.ic_category3}'),
  //   CategoryModel(name: 'Hotdog', img: '${Images.ic_category4}'),
  //   CategoryModel(name: 'Tacos', img: '${Images.ic_category5}'),
  //   CategoryModel(name: 'Burrito', img: '${Images.ic_category6}'),
  //   CategoryModel(name: 'Muffins', img: '${Images.ic_category1}'),
  //   CategoryModel(name: 'Donuts', img: '${Images.ic_category2}'),
  //   CategoryModel(name: 'Bacon', img: '${Images.ic_category3}'),
  // ];

  @override
  void onInit() {
    getAllCategoryList();
    super.onInit();
  }
}