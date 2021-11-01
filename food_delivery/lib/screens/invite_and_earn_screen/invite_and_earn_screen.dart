import 'package:flutter/material.dart';
import 'package:food_delivery/common/common_widgets.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:get/get.dart';

import 'invite_and_earn_screen_widgets.dart';

class InviteAndEarnScreen extends StatelessWidget {
  const InviteAndEarnScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Invite & Earn'),

      body: Column(
        children: [
          SizedBox(height: Get.height * 0.1),
          HeaderAndContentModule(
            header: 'Refer & Earn Wallet Amount Upto From 1 To 15',
            content: 'Lorem ipsum is simply text of the printing and type setting. Lorem ipsum is simply text of the printing and type setting industry. Lorem ipsum is simply text of the printing and type setting industry. Lorem ipsum is simply text of the printing and type setting industry. Lorem ipsum is simply text of the printing and type setting industry. Lorem ipsum is simply text of the printing and type setting industry.',
            index: 1,
          ),
          SizedBox(height: Get.height * 0.08),

          CodeModule(),
          SizedBox(height: Get.height * 0.04),
          InviteFriendButton(),
          SizedBox(height: Get.height * 0.04),
        ],
      ),
    );
  }
}
