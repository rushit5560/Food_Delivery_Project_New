import 'dart:convert';
import 'dart:developer';

import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/models/terms_and_condition_screen_model/terms_and_condition_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class TermsAndConditionScreenController extends GetxController{

  RxBool isLoading = false.obs;
  RxBool isSuccessStatus = false.obs;

  String termsAndCondition = "";
  String aboutUs = "";
  String privacyPolicy = "";

  termsAndConditionFunction()async{
    isLoading(true);
    String url = ApiUrl.termsAndConditionAPI + "619789eea7c5063b32cab139";
    log("Terms & Condition API URL : $url");

    try {

      http.Response response = await http.get(Uri.parse(url));
      log("Terms & Condition Response : ${response.body}");

      TermsAndConditionModel termsAndConditionModel = TermsAndConditionModel.fromJson(json.decode(response.body));
      isSuccessStatus = termsAndConditionModel.status.obs;

      if(isSuccessStatus.value) {
        termsAndCondition= termsAndConditionModel.pageSetup.termsAndCondition;
        log('termsAndCondition: $termsAndCondition');
        aboutUs= termsAndConditionModel.pageSetup.aboutUs;
        log('aboutUs: $aboutUs');
        privacyPolicy= termsAndConditionModel.pageSetup.privacy;
        log('privacyPolicy: $privacyPolicy');
      } else {
        log("Terms & Condition Function Else Else");
      }

    } catch(e) {
      log("Terms & Condition Function Error ::: $e");
    } finally {
      isLoading(false);
    }
  }

  var i;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    termsAndConditionFunction();
  }
}