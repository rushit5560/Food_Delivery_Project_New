import 'package:flutter/material.dart';
import 'package:food_delivery/common/constant/app_colors.dart';
import 'package:food_delivery/common/constant/app_images.dart';
import 'package:food_delivery/controllers/get_all_address_screen_controller/get_all_address_screen_controller.dart';
import 'package:food_delivery/screens/add_address_screen/add_address_screen.dart';
import 'package:get/get.dart';

class AddressListModule extends StatelessWidget {
  AddressListModule({Key? key}) : super(key: key);

  GetAllAddressScreenController getAllAddressScreenController = Get.find<GetAllAddressScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: getAllAddressScreenController.allAddressList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index){
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Row(
                children: [
                  // Image.asset('${Images.ic_account_info_1}'),
                  // SizedBox(width: 15),
                  Expanded(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Address1: ${getAllAddressScreenController.allAddressList[index].address1}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),

                          Text(
                            "Address2: ${getAllAddressScreenController.allAddressList[index].address2}",
                            maxLines: 1,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Pincode: ${getAllAddressScreenController.allAddressList[index].pincode}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      print('Edit');
                    },
                    child: Text(
                      'Edit',
                      textScaleFactor: 1.1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class AddAddressButton extends StatelessWidget {
  const AddAddressButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(()=> AddAddressScreen()),
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
                'Add New Address',
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
