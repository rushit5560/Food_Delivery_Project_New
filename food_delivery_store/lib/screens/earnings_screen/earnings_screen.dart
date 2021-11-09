import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/custom_appbar.dart';
import 'earnings_screen_widgets.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Earnings'),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 12),
          OrdersAndRevenueModule(),
          const SizedBox(height: 12),
          RecentTransactionText(),
          const SizedBox(height: 12),
          Expanded(child: TransactionsListModule()),
        ],
      ),
    );
  }
}
