import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'constant/app_colors.dart';
import 'constant/app_images.dart';

PreferredSizeWidget commonAppBarModule({required title, index = 0}) {
  return AppBar(
    leading: index == 1
        ? Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Image.asset(Images.ic_drawer_menu, scale: 2.5),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );

      },
    ) : null,

    title: Text("$title", style: TextStyle(color: Colors.black),),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomRight: Radius.circular(25),
        bottomLeft: Radius.circular(25),
      ),
    ),
    backgroundColor: AppColors.colorLightPink,
    actions: [
      index == 1
          ? GestureDetector(
              onTap: () {

              },
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Container(
                  width: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.colorDarkPink
                  ),
                  child: Center(
                    child: Text("GO ONLINE", style: TextStyle(
                      color: Colors.white, fontSize: 14
                    ),),
                  ),
                ),
              )
            )
          : Container(),
      SizedBox(width: 20)
    ],
  );
}