import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:get/get.dart';

class RewardPointScreen extends StatelessWidget {
   RewardPointScreen({Key? key}) : super(key: key);

  PageController controller = PageController(viewportFraction: 1, keepPage: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Reward Point'),
      body: PageView.builder(
        itemCount: 3,
        controller: controller,
          itemBuilder: (BuildContext context, int itemIndex){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 7,
                      child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            height: Get.height/1.7,
                            margin: EdgeInsets.only(left: 40, right: 40),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey.shade500),
                              //color: Colors.grey,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(Images.ic_reward),

                                Text("Reward", style: TextStyle(
                                    color: AppColors.colorDarkPink, fontSize: 20),),

                                SizedBox(height: 10),

                                Text("100 Point", style: TextStyle(
                                    color: Colors.grey.shade500),)

                              ],
                            ),
                          ),

                          Positioned(
                            bottom: -20,
                            child: Container(
                              height: 45,
                              width: Get.height/4,
                              //margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.colorDarkPink
                              ),
                              child: Center(
                                child: Text("Redeem now", style: TextStyle(color: Colors.white, fontSize: 18,
                                    fontWeight: FontWeight.bold),),
                              ),
                            ),
                          )
                        ],

                      ),
                    ),

                    Expanded(
                      flex: 3,
                      child: Container(),
                    ),
                  ],
                ),
              ),
            );
          }
      ),
    );
  }
}
