import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:get/get.dart';
import 'package:timelines/timelines.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: AppColors.colorGrey),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "ORDER ID - GFG4FJJ",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
              Container(
                child: Text(
                  "25 Oct, 7:00AM",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Hot Dog",
                  style: TextStyle(
                      fontSize: 19,
                      color: AppColors.colorDarkPink,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                child: Text("\$150.00",
                    style: TextStyle(fontSize: 18, color: Colors.black)),
              )
            ],
          )
        ],
      ),
    );
  }
}

class OrderTimeLine extends StatelessWidget {
   OrderTimeLine({Key? key}) : super(key: key);

  List<String> timeline = [
    "Order Placed",
    "Order Confirmed",
    "Preparing Order",
    "On The Way",
    "Order Delivered"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //mainAxisAlignment: MainAxisAlignment.start,
        children: [
          /*Text(
            "Order Timeline",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Text("hkjh")*/

          Text(
            "Order Timeline",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),

          Container(
            height: Get.height /2.5,
            child: Timeline.tileBuilder(
              builder: TimelineTileBuilder.fromStyle(
                //connectorStyle: ConnectorStyle,

                contentsAlign: ContentsAlign.alternating,
                contentsBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Text(timeline[index]),
                ),
                itemCount: timeline.length,
              ),
            ),
          )


        ],
      ),
    );
  }
}

class OrderAddress extends StatelessWidget {
  const OrderAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Lorem Ipsum",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              ),
              Text(
                "\$150.00",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorGrey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry 545751",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text("Lorem Ipsum is (545751)",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DeliveryAddress extends StatelessWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Delivering At",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorGrey),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry 545751",
                    style: TextStyle(color: Colors.black, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  child: Text("Lorem Ipsum is (545751)",
                      style: TextStyle(color: Colors.black, fontSize: 16)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class paymentMethod extends StatelessWidget {
  const paymentMethod({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Payment Method",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
            decoration: BoxDecoration(color: AppColors.colorGrey),
            child: Row(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Image.asset(
                    Images.ic_wallet,
                    scale: 1.5,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                  child: Text("App Wallet",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold)),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
                color: AppColors.colorGrey),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Sub Total",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        "\$150",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Delivery Fee",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        "\$0",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Promo Code",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        "\$0",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Paid By Wallet",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      child: Text(
                        "\$150",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.only(top: 15, left: 15, right: 10, bottom: 15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.colorGrey),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Amount To Pay",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  child: Text(
                    "\$0",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
