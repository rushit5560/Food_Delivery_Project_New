import 'package:food_delivery_admin/screens/delivery_man_screen/add_delivery_man_screen/add_delivery_man_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/delivery_man_screen_controller/delivery_man_screen_controller.dart';



class DeliveryManListModule extends StatelessWidget {
  DeliveryManListModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return Container();
      },
    );
  }
}


class AddDeliveryManButtonModule extends StatelessWidget {
  const AddDeliveryManButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> AddDeliveryManScreen(), transition: Transition.zoom),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.add,
                color: Colors.white,
              ),
              SizedBox(width: 10),
              Text(
                'Add Delivery Man',
                textScaleFactor: 1.2,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

