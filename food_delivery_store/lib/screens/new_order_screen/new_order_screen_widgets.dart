import 'package:flutter/material.dart';
import 'package:food_delivery_admin/common/constants/app_colors.dart';
import 'package:food_delivery_admin/common/constants/app_images.dart';
import 'package:get/get.dart';
import '../../controllers/new_order_screen_controller/new_order_screen_controller.dart';

class TabsModule extends StatelessWidget {
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  // newOrderScreenController.isTodayOrderSelected.value = true;
                  // newOrderScreenController.isNewOrderSelected.value = false;
                  newOrderScreenController.selectedTabIndex.value = 1;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.colorDarkPink,
                        width: 2
                    ),
                    color: newOrderScreenController.selectedTabIndex.value == 1 ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(/*horizontal:12, */vertical: 12),
                    child: Center(
                      child: Text(
                        'All',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: newOrderScreenController.selectedTabIndex.value == 1 ? Colors.white : AppColors.colorDarkPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  // newOrderScreenController.isTodayOrderSelected.value = false;
                  // newOrderScreenController.isNewOrderSelected.value = true;
                  newOrderScreenController.selectedTabIndex.value = 2;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.colorDarkPink,
                        width: 2
                    ),
                    color: newOrderScreenController.selectedTabIndex.value == 2 ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Pending',
                        textScaleFactor: 1.1,
                        style: TextStyle(
                          color: newOrderScreenController.selectedTabIndex.value == 2 ? Colors.white : AppColors.colorDarkPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 4,
              child: GestureDetector(
                onTap: () {
                  // newOrderScreenController.isTodayOrderSelected.value = true;
                  // newOrderScreenController.isNewOrderSelected.value = false;
                  newOrderScreenController.selectedTabIndex.value = 3;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.colorDarkPink,
                        width: 2
                    ),
                    color: newOrderScreenController.selectedTabIndex.value == 3 ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
                    child: Text(
                      'On The Way',
                      textScaleFactor: 1.1,
                      //maxLines: 1,
                      style: TextStyle(
                        color: newOrderScreenController.selectedTabIndex.value == 3 ? Colors.white : AppColors.colorDarkPink,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  // newOrderScreenController.isTodayOrderSelected.value = false;
                  // newOrderScreenController.isNewOrderSelected.value = true;
                  newOrderScreenController.selectedTabIndex.value = 4;
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: AppColors.colorDarkPink,
                        width: 2
                    ),
                    color: newOrderScreenController.selectedTabIndex.value == 4 ? AppColors.colorDarkPink : Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 12),
                    child: Center(
                      child: Text(
                        'Delivered',
                        textScaleFactor: 1.1,
                        maxLines: 1,
                        style: TextStyle(
                          color: newOrderScreenController.selectedTabIndex.value == 4 ? Colors.white : AppColors.colorDarkPink,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class TodayOrdersModule extends StatelessWidget {
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.pendingOrderList.length == 0 ?
    Center(child: Text("There is No Today Order")):
    ListView.builder(
      itemCount: newOrderScreenController.pendingOrderList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _todayOrderListTile(index);
      },
    );
  }

  Widget _todayOrderListTile(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(index)),
                      const SizedBox(width: 10),
                      _amountAndButton(index),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          _invoiceButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }
  Widget _orderName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newOrderScreenController.pendingOrderList[index].storeId.firstName +  " " + newOrderScreenController.pendingOrderList[index].storeId.lastName,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          newOrderScreenController.pendingOrderList[index].orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          newOrderScreenController.pendingOrderList[index].details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5,),

        Text(
          'Order On ${newOrderScreenController.pendingOrderList[index].orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5,),
        Text(
          'Order ID ${newOrderScreenController.pendingOrderList[index].id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }
  Widget _amountAndButton(index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + newOrderScreenController.pendingOrderList[index].amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                'Confirm',
                textScaleFactor: 0.8,
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
  Widget _invoiceButton() {
    return GestureDetector(
      onTap: () {
        print('Print Invoice');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Print Invoice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class NewOrderModule extends StatelessWidget {
  NewOrderModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: newOrderScreenController.allOrderList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _newOrderListTile(index);
      },
    );
  }

  Widget _newOrderListTile(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey.shade200,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _orderImage(),
              const SizedBox(width: 10),
              Expanded(child: _orderName(index)),
              const SizedBox(width: 10),
              _amountAndButton(index),

            ],
          ),
        ),
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }
  Widget _orderName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${newOrderScreenController.allOrderList[index].storeId.firstName}' +" " + '${newOrderScreenController.allOrderList[index].storeId.lastName}',
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          '${newOrderScreenController.allOrderList[index].orderNumber}',
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
  Widget _amountAndButton(index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          '\$${newOrderScreenController.allOrderList[index].amount}',
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                '${newOrderScreenController.allOrderList[index].orderStatusId.status}',
                textScaleFactor: 0.8,
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
}*/

class AllOrderModule extends StatelessWidget {
  AllOrderModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.allOrderList.length == 0  ?
    Center(child: Text("There is No All Order")):
    ListView.builder(
      itemCount: newOrderScreenController.allOrderList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _todayOrderListTile(index);
      },
    );
  }

  Widget _todayOrderListTile(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(index)),
                      const SizedBox(width: 10),
                      _amountAndButton(index),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          _invoiceButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }
  Widget _orderName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newOrderScreenController.allOrderList[index].storeId.firstName +  " " + newOrderScreenController.allOrderList[index].storeId.lastName,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          newOrderScreenController.allOrderList[index].orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + newOrderScreenController.allOrderList[index].orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          newOrderScreenController.allOrderList[index].details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${newOrderScreenController.allOrderList[index].orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${newOrderScreenController.allOrderList[index].id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }
  Widget _amountAndButton(index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + newOrderScreenController.allOrderList[index].amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                'Confirm',
                textScaleFactor: 0.8,
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
  Widget _invoiceButton() {
    return GestureDetector(
      onTap: () {
        print('Print Invoice');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Print Invoice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class PendingOrderModule extends StatelessWidget {
  PendingOrderModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.pendingOrderList.length == 0 ?
    Center(child: Text("There is no Pending Order")):
    ListView.builder(
      itemCount: newOrderScreenController.pendingOrderList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _todayOrderListTile(index);
      },
    );
  }

  Widget _todayOrderListTile(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(index)),
                      const SizedBox(width: 10),
                      _amountAndButton(index),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          _invoiceButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }
  Widget _orderName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newOrderScreenController.pendingOrderList[index].storeId.firstName +  " " + newOrderScreenController.pendingOrderList[index].storeId.lastName,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          newOrderScreenController.pendingOrderList[index].orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + newOrderScreenController.pendingOrderList[index].orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          newOrderScreenController.pendingOrderList[index].details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${newOrderScreenController.pendingOrderList[index].orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${newOrderScreenController.pendingOrderList[index].id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }
  Widget _amountAndButton(index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + newOrderScreenController.pendingOrderList[index].amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                'Confirm',
                textScaleFactor: 0.8,
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
  Widget _invoiceButton() {
    return GestureDetector(
      onTap: () {
        print('Print Invoice');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Print Invoice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class OnTheWayModule extends StatelessWidget {
  OnTheWayModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.onTheWayList.length == 0 ?
    Center(child: Text("There Is No On The Way Order")):
    ListView.builder(
      itemCount: newOrderScreenController.onTheWayList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _todayOrderListTile(index);
      },
    );
  }

  Widget _todayOrderListTile(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(index)),
                      const SizedBox(width: 10),
                      _amountAndButton(index),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          _invoiceButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }
  Widget _orderName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newOrderScreenController.onTheWayList[index].storeId.firstName +  " " + newOrderScreenController.onTheWayList[index].storeId.lastName,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          newOrderScreenController.onTheWayList[index].orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          "Status: " + newOrderScreenController.onTheWayList[index].orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5),
        Text(
          newOrderScreenController.onTheWayList[index].details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5),

        Text(
          'Order On ${newOrderScreenController.onTheWayList[index].orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5),
        Text(
          'Order ID ${newOrderScreenController.onTheWayList[index].id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }
  Widget _amountAndButton(index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + newOrderScreenController.onTheWayList[index].amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                'Confirm',
                textScaleFactor: 0.8,
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
  Widget _invoiceButton() {
    return GestureDetector(
      onTap: () {
        print('Print Invoice');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Print Invoice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class DeliveredModule extends StatelessWidget {
  DeliveredModule({Key? key}) : super(key: key);
  final newOrderScreenController = Get.find<NewOrderScreenController>();

  @override
  Widget build(BuildContext context) {
    return newOrderScreenController.deliveredList.length == 0 ?
    Center(child: Text("There is no Delivered Order")):
    ListView.builder(
      itemCount: newOrderScreenController.deliveredList.length,
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index){
        return _todayOrderListTile(index);
      },
    );
  }

  Widget _todayOrderListTile(index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _orderImage(),
                      const SizedBox(width: 10),
                      Expanded(child: _orderName(index)),
                      const SizedBox(width: 10),
                      _amountAndButton(index),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 15),
          _invoiceButton(),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  Widget _orderImage() {
    return Image.asset('${Images.ic_category1}', scale: 2.5);
  }
  Widget _orderName(index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          newOrderScreenController.deliveredList[index].storeId.firstName +  " " + newOrderScreenController.deliveredList[index].storeId.lastName,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(
              color: AppColors.colorDarkPink, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          newOrderScreenController.deliveredList[index].orderNumber,
          textScaleFactor: 1.2,
          maxLines: 1,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          "Status: " + newOrderScreenController.deliveredList[index].orderStatusId.status,
          textScaleFactor: 0.7,
          maxLines: 1,
          //style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          newOrderScreenController.deliveredList[index].details,
          maxLines: 2,
          textScaleFactor: 0.7,
        ),

        SizedBox(height: 5,),

        Text(
          'Order On ${newOrderScreenController.deliveredList[index].orderDate}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        SizedBox(height: 5,),
        Text(
          'Order ID ${newOrderScreenController.deliveredList[index].id}',
          maxLines: 1,
          textScaleFactor: 0.7,
        ),
        // SizedBox(height: 5,),
        // Text(
        //   'Payment Method - Wallet',
        //   maxLines: 1,
        //   textScaleFactor: 0.7,
        // ),
      ],
    );
  }
  Widget _amountAndButton(index) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          "\$" + newOrderScreenController.deliveredList[index].amount.toString(),
          textScaleFactor: 1.3,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),

        GestureDetector(
          onTap: () {print('Confirm');},
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.colorDarkPink,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              child: Text(
                'Confirm',
                textScaleFactor: 0.8,
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
  Widget _invoiceButton() {
    return GestureDetector(
      onTap: () {
        print('Print Invoice');
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.colorDarkPink,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            'Print Invoice',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}




