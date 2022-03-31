import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/common/constants/app_images.dart';


class OrdersRevenuePendingModule extends StatelessWidget {
  const OrdersRevenuePendingModule({Key? key}) : super(key: key);

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
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Pending ',
                      style: TextStyle(
                          color: AppColors.colorDarkPink
                      ),
                    ),
                    Text(
                      '450',
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

class TopSellingText extends StatelessWidget {
  const TopSellingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        'Top Selling Items',
        textScaleFactor: 1.5,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class TopSellingItemsListModule extends StatelessWidget {
  const TopSellingItemsListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _topSellingItemListTile();
      },
    );
  }

  Widget _topSellingItemListTile() {
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
              _soldNumberModule(),
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
          'Apparel',
          textScaleFactor: 0.9,
          maxLines: 1,
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            Text(
              'Revenue ',
              maxLines: 1,
            ),
            Text(
              '\$2098.00',
              maxLines: 1,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }

  _soldNumberModule() {
    return Text(
      '65 Sold',
      textScaleFactor: 1.2,
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
    );
  }



}
