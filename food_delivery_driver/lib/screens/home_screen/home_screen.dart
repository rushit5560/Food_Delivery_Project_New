import 'package:flutter/material.dart';
import 'package:food_delivery_driver/common/custom_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'Home', index: 1),
    );
  }
}
