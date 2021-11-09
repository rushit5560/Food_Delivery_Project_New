import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/app_colors.dart';
import 'package:food_delivery_admin/common/app_images.dart';


class OrdersAndRevenueModule extends StatelessWidget {
  const OrdersAndRevenueModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Orders ',
                      style: TextStyle(
                          color: AppColors.colorDarkPink
                      ),
                    ),
                    Text(
                      '500',
                      style: TextStyle(
                        color: AppColors.colorDarkPink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Revenue ',
                      style: TextStyle(
                          color: AppColors.colorDarkPink
                      ),
                    ),
                    Text(
                      '\$2000.00',
                      style: TextStyle(
                        color: AppColors.colorDarkPink,
                        fontWeight: FontWeight.bold,
                      ),
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
}

class RecentTransactionText extends StatelessWidget {
  const RecentTransactionText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Recent Transactions',
        textScaleFactor: 1.5,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TransactionsListModule extends StatelessWidget {
  const TransactionsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _transactionsListTile();
      },
    );
  }

  Widget _transactionsListTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      _imageModule(),
                      const SizedBox(width: 10),
                      Expanded(child: _nameModule()),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
              _priceTagModule(),

            ],
          ),
        ),
      ),
    );
  }

  _imageModule() {
    return Image.asset('${Images.ic_category1}', scale: 2);
  }

  _nameModule() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hot Dog',
          maxLines: 1,
          textScaleFactor: 1.3,
          style: TextStyle(
            color: AppColors.colorDarkPink,
            fontWeight: FontWeight.bold
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Delivery Date 25 Oct, 7:00AM',
          textScaleFactor: 0.9,
          maxLines: 1,
        ),
        const SizedBox(height: 5),
        Text(
          'Order ID 5FJH8HF',
          maxLines: 1,
        ),
      ],
    );
  }

  _priceTagModule() {
    return Text(
      '\$250.00',
      textScaleFactor: 1.2,
      style: TextStyle(
        fontWeight: FontWeight.bold
      ),
    );
  }
}
