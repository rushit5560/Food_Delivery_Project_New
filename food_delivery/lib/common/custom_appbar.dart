import 'package:flutter/material.dart';

import 'constant/app_colors.dart';
import 'constant/app_images.dart';

PreferredSizeWidget commonAppBarModule({required title, index = 0}) {
  return AppBar(
    leading: index == 1
        ? Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: Image.asset(Images.ic_drawer_menu, scale: 2.5,),
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
              onTap: () => print('Clk Scanner'),
              child: Image.asset(Images.ic_barcode_scan, height: 25, width: 25),
            )
          : /*index == 2
              ? Image.asset(Images.ic_scanner, height: 28, width: 28)
              :*/ Container(),
      SizedBox(width: 20)
    ],
  );
}