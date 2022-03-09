import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/driver_details.dart';

class SharedPreferenceData {
  String isDriverLoggedInKey = 'isDriverLoggedInKey';
  String driverIdKey = 'driverIdKey';
  String driverRoleKey = 'driverRoleKey';
  String driverTokenKey = 'driverTokenKey';
  String driverWalletIdKey = 'driverWalletIdKey';

  setDriverLoginDetailsInPrefs({required String driverToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Decode the JWT and Get UserId & Role
    Map<String, dynamic> decodedToken = JwtDecoder.decode(driverToken);
    String driverId = decodedToken["_id"];
    String driverRole = decodedToken["role"];
    print('userId : $driverId');

    //Remove Old Id & Token
    prefs.remove(driverIdKey);
    prefs.remove(driverTokenKey);
    prefs.remove(driverRoleKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isDriverLoggedInKey, true);
    prefs.setString(driverIdKey, driverId);
    prefs.setString(driverRoleKey, driverRole);
    prefs.setString(driverTokenKey, driverToken);

    DriverDetails.isDriverLoggedIn = prefs.getBool(isDriverLoggedInKey) ?? false;
    DriverDetails.driverId = prefs.getString(driverIdKey) ?? "";
    DriverDetails.driverRole = prefs.getString(driverRoleKey) ?? "";
    DriverDetails.driverToken = prefs.getString(driverTokenKey) ?? "";

    print('Driver LoggedIn Status : ${DriverDetails.isDriverLoggedIn}');
    print('Driver Id : ${DriverDetails.driverId}');
    print('Driver Role : ${DriverDetails.driverRole}');
    print('Driver Token : ${DriverDetails.driverToken}');
  }

  setWalletIdInPrefs({required String walletId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(driverWalletIdKey, walletId);
    print('Prefs Wallet Id : ${prefs.getString(driverWalletIdKey)}');
    DriverDetails.driverWalletId = prefs.getString(driverWalletIdKey) ?? "";
  }

  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(isDriverLoggedInKey, false);
    prefs.setString(driverIdKey, "");
    prefs.setString(driverRoleKey, "");
    prefs.setString(driverTokenKey, "");
    prefs.setString(driverWalletIdKey, "");

    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }

}