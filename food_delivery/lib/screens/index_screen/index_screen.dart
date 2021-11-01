import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/screens/basket_screen/basket_screen.dart';
import 'package:food_delivery/screens/home_screen/home_screen.dart';
import 'package:food_delivery/screens/my_profile_screen/my_profile_screen.dart';
import 'package:food_delivery/screens/order_detail_screen/order_detail_screen.dart';
import 'package:food_delivery/screens/reward_point/reward_point.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    OrderDetailScreen(),
    RewardPointScreen(),
    BasketScreen(),
    MyProfileScreen()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.home), label: ""),
          ],
          // backgroundColor: AppColors.colorDarkPink,
          currentIndex: selectedIndex,
          fixedColor: Colors.white,
          onTap: onItemTapped,

        ),
      ),
    );
  }
}
