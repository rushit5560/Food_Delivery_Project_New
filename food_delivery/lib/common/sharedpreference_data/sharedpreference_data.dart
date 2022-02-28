import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../constant/user_details.dart';

class SharedPreferenceData {
  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String userRoleKey = "userRoleKey";
  String userTokenKey = "userTokenKey";

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


}
