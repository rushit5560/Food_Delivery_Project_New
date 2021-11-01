import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppNameModule extends StatelessWidget {
  // const AppNameModule({Key? key, required String appName}) : super(key: key);
  String appName;
  AppNameModule({required this.appName});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 15),
        child: Text(
          "" + "$appName",
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 34),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoActivityIndicator(
        radius: 15,
      ),
      padding: EdgeInsets.only(bottom: 50),
    );
  }
}



Widget appNameModule(String appName) {
  return Expanded(
    child: Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 15),
      child: Text(
        "" + "$appName",
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 34),
        textAlign: TextAlign.center,
      ),
    ),
  );
}