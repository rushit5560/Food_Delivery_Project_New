import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/controllers/order_details_screen_controller/order_details_screen_controller.dart';
import 'package:food_delivery/screens/Invoice_screen/invoice_screen_widgets.dart';
import 'package:get/get.dart';

class InvoiceScreen extends StatelessWidget {
  InvoiceScreen({Key? key}) : super(key: key);
  OrderDetailsScreenController orderDetailsScreenController = Get.put(OrderDetailsScreenController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Invoice'),

      body: SingleChildScrollView(
        child: Obx(()=>
        orderDetailsScreenController.isLoading.value ?
            CircularProgressIndicator():
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                ShippingAddressModule(),
                SizedBox(height: 10),
                BillingAddressModule(),
                SizedBox(height: 10),
                OrderDetailsModule(),
                SizedBox(height: 10),
                PaymentMethodModule(),
                SizedBox(height: 10),
                ProductDetailsListModule(),
                SizedBox(height: 10),
                TotalPaymentModule()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
