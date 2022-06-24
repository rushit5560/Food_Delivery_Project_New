import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/controllers/order_details_screen_controller/order_details_screen_controller.dart';
import 'package:get/get.dart';

class ShippingAddressModule extends StatelessWidget {
  ShippingAddressModule({Key? key}) : super(key: key);

  final screenController = Get.find<OrderDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Shipping Address",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address:"),
                    Text(screenController.storeAddress)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mobile Number:"),
                    Text(screenController.storeMobile)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email:"),
                    Text(screenController.storeEmail)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class BillingAddressModule extends StatelessWidget {
  BillingAddressModule({Key? key}) : super(key: key);

  final screenController = Get.find<OrderDetailsScreenController>();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Billing Address",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Name:"),
                    Text(screenController.billingName)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Address:"),
                    Text(screenController.billingAddress)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Mobile Number:"),
                    Text(screenController.billingMobile)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Email:"),
                    Text(screenController.billingEmail)
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class OrderDetailsModule extends StatelessWidget {
  OrderDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<OrderDetailsScreenController>();


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Order Details",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Id:"),
                    Text(screenController.orderId1)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date:"),
                    Text(screenController.orderDate)
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Time:"),
                    Text(screenController.orderDate)
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class PaymentMethodModule extends StatelessWidget {
  const PaymentMethodModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Payment Method:",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Id:"),
                    Text("abc")
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Date:"),
                    Text("12-2-22")
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Time:"),
                    Text("3:50")
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class ProductDetailsListModule extends StatelessWidget {
  ProductDetailsListModule({Key? key}) : super(key: key);

  final screenController = Get.find<OrderDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Product Details:",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        ListView.builder(
          itemCount: screenController.productList.length,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(width: 2)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Product Name:"),
                          SizedBox(width: 5),
                          Text(screenController.productList[index].productId.productName)
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Price:"),
                          SizedBox(width: 5),
                          Text(screenController.productList[index].productId.price.toString())
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Quantity:"),
                          SizedBox(width: 5),
                          Text(screenController.productList[index].productId.quantity.toString())
                        ],
                      ),
                      SizedBox(height: 5),
                      Row(
                       // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal:"),
                          SizedBox(width: 5),
                          Text("100")
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },

        )
      ],
    );
  }
}

class TotalPaymentModule extends StatelessWidget {
  const TotalPaymentModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Total Payment",style: TextStyle(fontWeight: FontWeight.bold),),
        SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 2)
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping:"),
                    Text("+10")
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Coupon Discount:"),
                    Text("-10")
                  ],
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subtotal:"),
                    Text("180")
                  ],
                ),
                Divider(color: Colors.black),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total:"),
                    Text("200")
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
