import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../driver_details.dart';

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
}