import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/multi_select_flutter.dart';
import '../common/constants/api_url.dart';
import '../models/add_product_model/all_attributes_model.dart';

class ExtraScreenController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  RxList<ListElement1> allAttributesList = [ListElement1(name: "Select Attributes", id: "0")].obs;

  List<MultiSelectItem> attributeDropDownData = [];



  /// Attributes
  getAllAttributesFunction() async {
    isLoading(true);
    String url = ApiUrl.GetAllAttributesApi;
    log("URL : $url");

    try{
      http.Response response = await http.get(Uri.parse(url));
      log("Response : $response");

      AllAttributesModule allAttributesModule = AllAttributesModule.fromJson(json.decode(response.body));
      isSuccessStatus = allAttributesModule.status.obs;

      if(isSuccessStatus.value) {
        allAttributesList.clear();
        attributeDropDownData.clear();

        if(allAttributesModule.list.length == 0) {
          allAttributesList.add(ListElement1(name: "Select Attributes", id: "0"));
        } else {
          allAttributesList.addAll(allAttributesModule.list);
          attributeDropDownData = allAttributesList.map((element) {
            return MultiSelectItem(element, element.name!);
          }).toList();

        }
        log("List Length : ${allAttributesList.length}");
      } else {
        log("getAllAttributesFunction Else Else");
      }


    } catch(e) {
      log("getAllAttributesFunction Error : $e");
    } finally {
      isLoading(false);
    }

  }

  @override
  void onInit() {
    getAllAttributesFunction();
    super.onInit();
  }
}