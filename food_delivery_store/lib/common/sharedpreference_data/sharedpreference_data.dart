import 'package:food_delivery_admin/common/store_details.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceData{
  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String userRoleKey = "userRoleKey";
  String userTokenKey = "userTokenKey";


  // This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Decode the JWT and Get UserId & Role
    Map<String, dynamic> decodedToken = JwtDecoder.decode(userToken);
    String storeId = decodedToken["_id"];
    String storeRole = decodedToken["role"];
    print('userId : $storeId');

    //Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(userTokenKey);
    prefs.remove(userRoleKey);

    //Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userIdKey, storeId);
    prefs.setString(userRoleKey, storeRole);
    prefs.setString(userTokenKey, userToken);

    // Now Set Prefs Data in UserDetails in Code
    StoreDetails.isStoreLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    StoreDetails.storeId = prefs.getString(userIdKey) ?? "";
    StoreDetails.storeRole = prefs.getString(userRoleKey) ?? "";
    StoreDetails.storeToken = prefs.getString(userTokenKey) ?? "";

    print('UserDetails.isUserLoggedIn : ${StoreDetails.isStoreLoggedIn}');
    print('UserDetails.userId : ${StoreDetails.storeId}');
    print('UserDetails.userRole : ${StoreDetails.storeRole}');
    print('UserDetails.userToken : ${StoreDetails.storeToken}');
  }

  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, "");
    prefs.setString(userRoleKey, "");
    prefs.setString(userTokenKey, "");
    // print('Clear isUserLoggedInKey : ${prefs.getBool(isUserLoggedInKey)}');
    // print('Clear userIdKey : ${prefs.getString(userIdKey)}');
    // print('Clear userRoleKey : ${prefs.getString(userRoleKey)}');
    // print('Clear userTokenKey : ${prefs.getString(userTokenKey)}');
    // print('Clear userWalletIdKey : ${prefs.getString(userWalletIdKey)}');
  }
}