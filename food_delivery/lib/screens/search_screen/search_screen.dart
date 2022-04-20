import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/search_screen_controller/search_screen_controller.dart';
import 'search_screen_widgets.dart';

class SearchScreen extends StatelessWidget {
  final searchScreenController = Get.put(SearchScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SearchTextFieldModule(),
              Expanded(
                child: SearchFoodListModule(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
