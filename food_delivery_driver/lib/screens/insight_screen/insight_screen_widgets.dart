import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/app_colors.dart';

class OrdersAndEarningModule extends StatelessWidget {
  const OrdersAndEarningModule({Key? key}) : super(key: key);

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
                      'Earnings ',
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

class OrderListModule extends StatelessWidget {
  const OrderListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 15,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'John Doe',
                          textScaleFactor: 1.3,
                          style: TextStyle(
                            color: AppColors.colorDarkPink,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Delivery Date 25 Oct, 7:00AM',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('ORDER ID - GFG4FJJ'),
                        const SizedBox(width: 5),
                        Text(
                          '\$150.00',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
