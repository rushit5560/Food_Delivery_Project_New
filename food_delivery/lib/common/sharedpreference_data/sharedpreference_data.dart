import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../constant/user_details.dart';

class SharedPreferenceData {
  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String userRoleKey = "userRoleKey";
  String userTokenKey = "userTokenKey";
  String userWalletIdKey = "userWalletIdKey";

  // This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Decode the JWT and Get UserId & Role
    Map<String, dynamic> decodedToken = JwtDecoder.decode(userToken);
    String userId = decodedToken["_id"];
    String userRole = decodedToken["role"];
    print('userId : $userId');

    //Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(userTokenKey);
    prefs.remove(userRoleKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userIdKey, userId);
    prefs.setString(userRoleKey, userRole);
    prefs.setString(userTokenKey, userToken);

    // Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.userRole = prefs.getString(userRoleKey) ?? "";
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";

    print('UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    print('UserDetails.userId : ${UserDetails.userId}');
    print('UserDetails.userRole : ${UserDetails.userRole}');
    print('UserDetails.userToken : ${UserDetails.userToken}');
  }

  setWalletIdInPrefs({required String walletId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userWalletIdKey, walletId);
    print('Prefs Wallet Id : ${prefs.getString(userWalletIdKey)}');
  }


  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, "");
    prefs.setString(userRoleKey, "");
    prefs.setString(userTokenKey, "");
    prefs.setString(userWalletIdKey, "");

    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }


}
