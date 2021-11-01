import 'package:flutter/material.dart';
import 'package:food_delivery/common/app_colors.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController searchFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: searchFieldController,
                cursorColor: Colors.grey,
                onChanged: (value){
                  print('$value');
                },
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  hintText: 'Search',
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  prefixIcon: Icon(Icons.search_rounded, color: AppColors.colorDarkPink),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
