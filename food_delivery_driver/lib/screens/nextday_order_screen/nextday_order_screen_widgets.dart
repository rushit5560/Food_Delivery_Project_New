import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/constant/app_colors.dart';
import 'package:food_delivery_driver/common/constant/app_images.dart';

class NextDayOrderListModule extends StatelessWidget {
  const NextDayOrderListModule({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _todayOrderListTile();
      },
    );
  }

  Widget _todayOrderListTile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _orderImage(),
              const SizedBox(width: 10),
              Expanded(child: _orderName()),
              const SizedBox(width: 10),
              _amountAndButton(),

            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }

  Widget _orderName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe',
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          '123456789',
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          'Lorem ipsum is simply dummy text of the printing and type setting industry 545751',
          maxLines: 2,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5,),
        Text(
          'Lorem Ipsum is (545751)',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5,),
        Text(
          'Order On 25 Oct,7:00AM     Order ID 5FJSH8HF',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5,),
        Text(
          'Payment Method - Wallet',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
      ],
    );
  }

  Widget _amountAndButton() {
    return Column(
      children: [
        Text(
          '\$150.00',
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 15),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}