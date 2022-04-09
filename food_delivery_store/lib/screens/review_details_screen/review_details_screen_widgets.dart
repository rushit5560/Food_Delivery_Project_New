import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:get/get.dart';

import '../../controllers/review_details_screen_controller/review_details_screen_controller.dart';
import '../../models/customer_review_models/get_single_product_review_model.dart';



class FoodDetailsModule extends StatelessWidget {
  FoodDetailsModule({Key? key}) : super(key: key);
  final screenController = Get.find<ReviewDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _productImage(),

        // const SizedBox(height: 5),
        // _productReviewModule(),

        const SizedBox(height: 5),
        _productDetailsModule(),
      ],
    );
  }

  Widget _productImage() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: Get.width,
        height: Get.height * 0.25,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: NetworkImage("${ApiUrl.ApiMainPath}${screenController.singleProduct.image}"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  // Widget _productReviewModule() {
  //   return Row(
  //     children: [
  //
  //     ],
  //   );
  // }

Widget _productDetailsModule() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${screenController.singleProduct.productName}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Price : ",
                style: TextStyle(fontSize: 16),
              ),

              Expanded(
                child: Text(
                  "${screenController.singleProduct.price}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Tax : ",
                style: TextStyle(fontSize: 16),
              ),

              Expanded(
                child: Text(
                  "0",
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Discount : ",
                maxLines: 1,
                style: TextStyle(fontSize: 16),
              ),

              Expanded(
                child: Text(
                  "${screenController.singleProduct.discount}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Available Time Starts : ",
                style: TextStyle(fontSize: 16),
              ),

              Expanded(
                child: Text(
                  "${screenController.singleProduct.startTime}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),

          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                "Available Time Ends : ",
                style: TextStyle(fontSize: 16),
              ),

              Expanded(
                child: Text(
                  "${screenController.singleProduct.endTime}",
                  maxLines: 1,
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),

          const Divider(thickness: 1),

          Text(
            "Addons",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          const SizedBox(height: 5),
          ListView.builder(
            itemCount: screenController.singleProduct.addon!.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, i) {
              return Row(
                children: [
                  Text(
                    "${screenController.singleProduct.addon![i].value.name}",
                    style: TextStyle(fontSize: 13),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${screenController.singleProduct.addon![i].value.price}",
                    style: TextStyle(fontSize: 13),
                  ),
                ],
              );
            },
          ),

          const Divider(thickness: 1),

          Text(
            "Short Description :",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),

          const SizedBox(height: 5),
          Text(
            "${screenController.singleProduct.description}",
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
}
}



class FoodReviewListModule extends StatelessWidget {
  FoodReviewListModule({Key? key}) : super(key: key);
  final screenController = Get.find<ReviewDetailsScreenController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Product Reviews",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        ListView.builder(
          itemCount: screenController.productReviewList.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, i) {
            SingleReview singleItem = screenController.productReviewList[i];
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _imageAndNameModule(singleItem),
                        const SizedBox(height: 5),
                        _reviewStarAndDateModule(singleItem),
                        const SizedBox(height: 5),
                        _reviewDescription(singleItem),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _imageAndNameModule(SingleReview singleItem) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage("${ApiUrl.ApiMainPath}${singleItem.customer.photo}"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 20),
        Text(
          "${singleItem.customer.fullName}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );
  }

  Widget _reviewStarAndDateModule(SingleReview singleItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Icon(Icons.star, size: 16, color: Colors.grey),
          const SizedBox(width: 2),
          Text(
            "${singleItem.rating}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(width: 10),
          Text(
            "${singleItem.date.day}/${singleItem.date.month}/${singleItem.date.year}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }

  Widget _reviewDescription(SingleReview singleItem) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Text(
        "${singleItem.review}",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

}

