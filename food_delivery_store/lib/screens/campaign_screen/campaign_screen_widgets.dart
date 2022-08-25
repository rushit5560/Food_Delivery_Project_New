import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/api_url.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/models/campaign_models/get_all_campaign_model.dart';
import 'package:food_delivery_admin/models/campaign_models/joined_campaign_model.dart';
import 'package:get/get.dart';
import '../../controllers/campaign_screen_controller/campaign_screen_controller.dart';

/// All Campaign
class AllCampaignListModule extends StatelessWidget {
  AllCampaignListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CampaignScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.campaignList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        CampaignListElement singleItem = screenController.campaignList[i];
        return _campaignListTile(context, singleItem);
      },
    );
  }

  Widget _campaignListTile(BuildContext context, CampaignListElement singleItem) {
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
              _imageModule(singleItem),
              const SizedBox(width: 15),
              Expanded(child: _nameModule(singleItem)),
              _joinButtonModule(context, singleItem),
            ],
          ),
        ),
      ),
    );
  }
  Widget _imageModule(CampaignListElement singleItem) {
    String imgUrl = ApiUrl.ApiMainPath + singleItem.campaignImage;
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _nameModule(CampaignListElement singleItem) {
    return Text(
      "${singleItem.title}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _joinButtonModule(BuildContext context, CampaignListElement singleItem) {
    return GestureDetector(
      onTap: () => _joinButtonAlertDialogModule(context, singleItem),
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
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _joinButtonAlertDialogModule(BuildContext context, CampaignListElement singleItem) {

    Widget joinButton() {
      return GestureDetector(
        onTap: () {
          log("singleItem Id : ${singleItem.id}");
          screenController.joinCampaignFunction(campaignId: singleItem.id);
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.colorDarkPink),
            color: AppColors.colorDarkPink,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "Yes",
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
              "No",
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
      title: Text("${singleItem.title}"),
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

/// Joined Campaign
class JoinedCampaignListModule extends StatelessWidget {
  JoinedCampaignListModule({Key? key}) : super(key: key);
  final screenController = Get.find<CampaignScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: screenController.joinedCampaignList.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) {
        JoinedCampaignElement singleItem = screenController.joinedCampaignList[i];
        return _campaignListTile(context, singleItem);
      },
    );
  }

  Widget _campaignListTile(BuildContext context, JoinedCampaignElement singleItem) {
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
              _imageModule(singleItem),
              const SizedBox(width: 15),
              Expanded(child: _nameModule(singleItem)),
              _joinButtonModule(context, singleItem),
            ],
          ),
        ),
      ),
    );
  }
  Widget _imageModule(JoinedCampaignElement singleItem) {
    String imgUrl = ApiUrl.ApiMainPath + singleItem.campaignId.campaignImage;
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: NetworkImage(imgUrl),
          fit: BoxFit.contain,
        ),
      ),
    );
  }

  Widget _nameModule(JoinedCampaignElement singleItem) {
    return Text(
      "${singleItem.campaignId.title}",
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    );
  }

  Widget _joinButtonModule(BuildContext context, JoinedCampaignElement singleItem) {
    return GestureDetector(
      onTap: () => _joinButtonAlertDialogModule(context, singleItem),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppColors.colorDarkPink),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Text(
            "Unjoin",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  _joinButtonAlertDialogModule(BuildContext context, JoinedCampaignElement singleItem) {

    Widget joinButton() {
      return GestureDetector(
        onTap: () {
          log("singleItem Id : ${singleItem.id}");
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColors.colorDarkPink),
            color: AppColors.colorDarkPink,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Text(
              "Yes",
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
              "No",
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
      title: Text("${singleItem.campaignId.title}"),
      content: Text("You want unjoin this campaign ?"),
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


class CampaignTabModule extends StatelessWidget {
  CampaignTabModule({Key? key}) : super(key: key);
  final screenController = Get.find<CampaignScreenController>();

  @override
  Widget build(BuildContext context) {
    return TabBar(
      // isScrollable: true,
      controller: screenController.tabController,
      indicatorColor: Colors.white,
      tabs: [

        /// All Campaign
        GestureDetector(
          onTap: () {
            screenController.isLoading(true);
            screenController.tabController.index = 0;
            screenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: screenController.tabController.index == 0
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
              child: Center(
                child: Text(
                  'All Campaigns',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    color: screenController.tabController.index == 0
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

        /// Joined Campaign
        GestureDetector(
          onTap: () {
            screenController.isLoading(true);
            screenController.tabController.index = 1;
            screenController.isLoading(false);
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: AppColors.colorDarkPink, width: 2),
              color: screenController.tabController.index == 1
                  ? AppColors.colorDarkPink
                  : Colors.white,
            ),
            child: Padding(
              padding:
              const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
              child: Center(
                child: Text(
                  'Joined campaign',
                  textScaleFactor: 1.1,
                  style: TextStyle(
                    color: screenController.tabController.index == 1
                        ? Colors.white
                        : AppColors.colorDarkPink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}


