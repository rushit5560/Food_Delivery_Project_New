import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/screens/review_details_screen/review_details_screen.dart';
import 'package:get/get.dart';
import '../../controllers/customer_review_screen_controller/customer_review_screen_controller.dart';
import '../../models/customer_review_models/get_product_review_model.dart';


class CustomerReviewListModule extends StatelessWidget {
  CustomerReviewListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CustomerReviewScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.reviewList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        Review singleItem = screenController.reviewList[i];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Get.to(()=> ReviewDetailsScreen(),
              transition: Transition.zoom,
              arguments: singleItem.product.id,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Image & Food Name Module
                    _imageAndFoodNameModule(singleItem: singleItem),
                    const SizedBox(height: 2),
                    _reviewDetails(singleItem: singleItem),
                    // const SizedBox(height: 2),
                    // _reviewDetails(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _imageAndFoodNameModule({required Review singleItem}) {
    String imageUrl = "${ApiUrl.ApiMainPath}${singleItem.product.image}";
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 80,
          width: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              image: NetworkImage(imageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          // flex: 8,
          child: Text(
            "${singleItem.product.productName}",
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }

  Widget _reviewDetails({required Review singleItem}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${singleItem.customer.fullName}",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 14),
        ),
        const SizedBox(height: 2),
        Row(
          children: [
            Icon(Icons.star, size: 16, color: Colors.grey),
            const SizedBox(width: 2),
            Text(
              "${singleItem.rating}",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Text(
                "(${singleItem.date.year}-${singleItem.date.month}-${singleItem.date.day})",
                maxLines: 1,
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
        const SizedBox(height: 2),
        Text(
          "${singleItem.review}",
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 13),
        ),
      ],
    );

  }


}
