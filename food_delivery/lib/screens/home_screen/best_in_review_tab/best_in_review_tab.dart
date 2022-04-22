import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/api_url.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/screens/product_detail_screen/product_details_screen.dart';
import 'package:get/get.dart';
import '../../../controllers/home_screen_controller/home_screen_controller.dart';
import '../../../models/home_screen_models/get_products_filter_wise_model.dart';



class BestInReview extends StatelessWidget {
  BestInReview({Key? key}) : super(key: key);
  final homeScreenController = Get.find<HomeScreenController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.only(left: 15, right: 15),
      child: ListView.builder(
        itemCount: homeScreenController.bestReviewList.length,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (context, index){
            BestReviewListElement singleItem =  homeScreenController.bestReviewList[index];
            String imgUrl = ApiUrl.ApiMainPath + "${singleItem.image}";
            return GestureDetector(
              onTap: (){
                Get.to(() => ProductDetailScreen(), arguments: singleItem.id);
              },
              child: Container(
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
                              child: Image.network(imgUrl)),

                          Expanded(
                            flex: 8,
                            child: Container(
                              height: Get.height/7,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("${singleItem.productName}",
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(color: AppColors.colorDarkPink, fontSize: 20,
                                        fontWeight: FontWeight.bold),),
                                  SizedBox(height: 5,),
                                  Container(
                                    child: Flexible(
                                      child: Text("${singleItem.description}",
                                        maxLines: 2, style: TextStyle(color: Colors.black, fontSize: 16),),
                                    ),
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("\$${singleItem.price}",
                                        style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),),
                                      SizedBox(width: 5,),
                                      Text("Type - ${singleItem.productType.value}"),
                                      SizedBox(width: 5,),
                                      Expanded(
                                          child: Text(
                                              "Qty - 150gms",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                      ),
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
              ),
            );
          }),
    );
  }
}
