import 'package:food_delivery/models/payment_option_screen_model/offer_codes_model.dart';
import 'package:get/get.dart';

class PaymentOptionScreenController extends GetxController {
  List<OfferCodesModel> offerCodeList = [
    OfferCodesModel(
      title: 'Test',
      description: 'Lorem Ipsum is simply dummy text',
      code: '123456'
    ),
    OfferCodesModel(
        title: 'Dummy',
        description: 'Lorem Ipsum is simply dummy text',
        code: '123456'
    ),
    OfferCodesModel(
        title: 'Wise',
        description: 'Lorem Ipsum is simply dummy text',
        code: '123456'
    ),
  ];
}