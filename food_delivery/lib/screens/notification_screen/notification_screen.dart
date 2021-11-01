import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';

import 'notification_screen_widgets.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: commonAppBarModule(title: 'Notification'),

      body: NotificationListModule(),
    );
  }
}
