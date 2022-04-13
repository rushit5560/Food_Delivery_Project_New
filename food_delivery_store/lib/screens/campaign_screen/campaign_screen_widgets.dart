import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:get/get.dart';
import '../../common/constants/app_images.dart';
import '../../controllers/campaign_screen_controller/campaign_screen_controller.dart';


class CampaignListModule extends StatelessWidget {
  CampaignListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CampaignScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        return _campaignListTile(context);
      },
    );
  }

  Widget _campaignListTile(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              _imageModule(),
              const SizedBox(width: 15),
              Expanded(child: _nameModule()),
              _joinButtonModule(context),
            ],
          ),
        ),
      ),
    );
  }
  Widget _imageModule() {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(Images.ic_category1),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _nameModule() {
    return Text(
      "Campaign Name",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _joinButtonModule(BuildContext context) {
    return GestureDetector(
      onTap: () => _joinButtonAlertDialogModule(context),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.colorDarkPink),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "Join",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }

  _joinButtonAlertDialogModule(BuildContext context) {

    Widget joinButton() {
      return GestureDetector(
        onTap: () {},
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.colorDarkPink),
            color: AppColors.colorDarkPink,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "Join",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }
    Widget cancelButton() {
      return GestureDetector(
        onTap: ()=> Get.back(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.colorDarkPink),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "Cancel",
              style: TextStyle(
                color: AppColors.colorDarkPink,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ),
      );
    }

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("campaign Name"),
      content: Text("You want join this campaign ?"),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            joinButton(),
            cancelButton(),
          ],
        ),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return alert;
      },
    );




  }

}
