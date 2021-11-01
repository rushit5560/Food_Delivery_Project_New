import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_images.dart';
import 'package:food_delivery/screens/basket_screen/basket_screen.dart';
import 'package:food_delivery/screens/category_screen/category_screen.dart';
import 'package:food_delivery/screens/home_screen/home_screen.dart';
import 'package:food_delivery/screens/my_profile_screen/my_profile_screen.dart';
import 'package:food_delivery/screens/search_screen/search_screen.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  int selectedIndex = 0;
  final widgetOptions = [
    HomeScreen(),
    CategoryScreen(),
    SearchScreen(),
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
              icon: Image.asset(
                  selectedIndex == 0
                      ? '${Images.ic_bottom_bar_light_1}'
                      : '${Images.ic_bottom_bar_1}',
                  scale: 2.5),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  selectedIndex == 1
                      ? '${Images.ic_bottom_bar_light_2}'
                      : '${Images.ic_bottom_bar_2}',
                  scale: 2.5),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  selectedIndex == 2
                      ? '${Images.ic_bottom_bar_light_3}'
                      : '${Images.ic_bottom_bar_3}',
                  scale: 2.5),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  selectedIndex == 3
                      ? '${Images.ic_bottom_bar_light_4}'
                      : '${Images.ic_bottom_bar_4}',
                  scale: 2.5),
              label: "",
            ),
            BottomNavigationBarItem(
              icon: Image.asset(
                  selectedIndex == 4
                      ? '${Images.ic_bottom_bar_light_5}'
                      : '${Images.ic_bottom_bar_5}',
                  scale: 2.5),
              label: "",
            ),
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


// Image(
// image: AssetImage('${Images.ic_bottom_bar_1}'),
// height: 25, width: 25
// )