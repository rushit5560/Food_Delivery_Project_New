import 'package:flutter/material.dart';
import 'package:food_delivery/common/custom_appbar.dart';
import 'package:food_delivery/screens/wallet_screen/wallet_screen_widgets.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBarModule(title: 'My Wallet'),

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              WalletValue(),
              WalletButton(),
              SizedBox(height: 5,),
              Divider(color: Colors.grey,),
              SizedBox(height: 5,),
              PriceRow(),
              SizedBox(height: 5,),
              Divider(color: Colors.grey,),
              SizedBox(height: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
