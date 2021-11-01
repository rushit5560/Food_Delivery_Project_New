import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen.dart';
import 'package:get/get.dart';

class RecentSelling extends StatelessWidget {
  const RecentSelling({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(() => ProductDetailScreen());
      },
      child: Container(
        //margin: EdgeInsets.only(left: 15, right: 15),
        child: ListView.builder(
          itemCount: 3,
            //physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemBuilder: (context, index){
              return Container(
                margin: EdgeInsets.only(bottom: 10),
                width: Get.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.colorGrey
                ),
                child: Row(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: Row(
                        //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              flex: 2,
                              child: Image.asset(Images.ic_category1)),

                          Expanded(
                            flex: 8,
                            child: Container(
                              height: Get.height/7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Hot Dog",
                                    style: TextStyle(color: AppColors.colorDarkPink, fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Container(
                                    child: Flexible(
                                      child: Text("Lorem Ipsum is simply dummy",
                                        maxLines: 2, style: TextStyle(color: Colors.black, fontSize: 16),),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$150.00",
                                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5,),
                                      Text("Type - Regular"),
                                      SizedBox(width: 5,),
                                      Text("Qty - 150gms"),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),


                        ],
                      ),
                    ),

                    CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColors.colorDarkPink,
                      child: Icon(Icons.add, color: Colors.white,),
                    )
                  ],

                ),
              );
            }),
      ),
    );
  }
}
