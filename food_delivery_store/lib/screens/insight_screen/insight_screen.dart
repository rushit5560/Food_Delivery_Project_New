import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';

import 'insight_screen_widgets.dart';

class InsightScreen extends StatelessWidget {
  const InsightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Insight'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          OrdersRevenuePendingModule(),
          const SizedBox(height: 12),
          TopSellingText(),
          const SizedBox(height: 12),
          Expanded(child: TopSellingItemsListModule()),
        ],
      ),
    );
  }
}
