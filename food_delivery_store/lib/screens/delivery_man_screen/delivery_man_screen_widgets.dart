import 'dart:developer';

import 'package:food_delivery_admin/common/common_widgets.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/screens/delivery_man_screen/add_delivery_man_screen/add_delivery_man_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../../common/constants/app_colors.dart';
import '../../controllers/delivery_man_screen_controller/delivery_man_screen_controller.dart';
import '../../models/delivery_man_models/get_all_delivery_man_model.dart';
import 'update_delivery_man_alert_dialog/update_delivery_man_alert_dialog.dart';

class DeliveryManListModule extends StatelessWidget {
  DeliveryManListModule({Key? key}) : super(key: key);
  final screenController = Get.find<DeliveryManScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.allDeliveryManList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        DeliveryManGetList singleDeliveryMan = screenController.allDeliveryManList[i];
        return _deliveryManListTile(
            context: context, singleDeliveryMan: singleDeliveryMan);
      },
    );
  }

  Widget _deliveryManListTile(
      {required BuildContext context,
      required DeliveryManGetList singleDeliveryMan}) {
    String imgUrl = "${ApiUrl.ApiMainPath}${singleDeliveryMan.image}";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(imgUrl),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${singleDeliveryMan.firstName} ${singleDeliveryMan.lastName}",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${singleDeliveryMan.phone}",
                            // style: TextStyle(),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "${singleDeliveryMan.email}",
                            // style: TextStyle(),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            screenController.isLoading(true);
                            screenController.updateFNameFieldController.text = singleDeliveryMan.firstName;
                            screenController.updateLNameFieldController.text = singleDeliveryMan.lastName;
                            screenController.updatePhoneFieldController.text = singleDeliveryMan.phone.toString();
                            screenController.updateAddressFieldController.text = singleDeliveryMan.address;
                            // screenController.deliveryManIdentity = singleDeliveryMan.identityType.obs;
                            screenController.updateIdentityNumberFieldController.text = singleDeliveryMan.identityNumber;
                            screenController.updateEmailFieldController.text = singleDeliveryMan.email;
                            // screenController.deliveryManType = singleDeliveryMan.deliveryManType.obs;
                            screenController.deliveryManGender = singleDeliveryMan.gender.obs;

                            log("Length : ${screenController.allZoneList.length}");
                            log("Zone : ${singleDeliveryMan.zone.name}");
                            log("FNAME : ${singleDeliveryMan.firstName}");

                            for(int i = 0; i < screenController.allZoneList.length; i++) {
                              if(screenController.allZoneList[i].id == singleDeliveryMan.zone.id) {
                                screenController.updateZoneDropDownValue = screenController.allZoneList[i];
                              }
                            }
                            log("updateZoneDropDownValue : ${screenController.updateZoneDropDownValue.areaName}");

                            editDeliveryManAlertDialog(context, singleDeliveryMan);
                            screenController.isLoading(false);
                          },
                          child: Icon(
                            Icons.edit_rounded,
                            color: Colors.grey,
                            size: 20,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () async => await screenController
                              .deleteDeliveryBoyByIdFunction(
                                  deliveryBoyId: singleDeliveryMan.id),
                          child: Icon(
                            Icons.delete_rounded,
                            color: Colors.red,
                            size: 20,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  editDeliveryManAlertDialog(
      BuildContext context, DeliveryManGetList singleDeliveryBoy) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Obx(() => screenController.isLoading.value
              ? CustomCircularProgressIndicator()
              : StatefulBuilder(builder: (context, setState2) {
                  return AlertDialog(
                    content: UpdateDeliveryManAlertDialog(
                      singleDeliveryBoy: singleDeliveryBoy,
                    ),
                  );
                }));
        });
  }
}

class AddDeliveryManButtonModule extends StatelessWidget {
  const AddDeliveryManButtonModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Get.to(() => AddDeliveryManScreen(), transition: Transition.zoom),
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
