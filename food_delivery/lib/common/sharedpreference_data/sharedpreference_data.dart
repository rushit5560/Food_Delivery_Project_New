import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../constant/user_cart_details.dart';
import '../constant/user_details.dart';

class SharedPreferenceData {
  /// All Prefs Key
  String isUserLoggedInKey = "isUserLoggedInKey";
  String userIdKey = "userIdKey";
  String userRoleKey = "userRoleKey";
  String userTokenKey = "userTokenKey";
  String userWalletIdKey = "userWalletIdKey";
  String userNameKey = "userNameKey";
  String userProfileImageKey = "userProfileImageKey";

  String isUserCartCreatedKey = "isUserCartCreatedKey";
  String userCartIdKey = "userCartIdKey";
  String userCartRestaurantIdKey = "userCartRestaurantIdKey";

  /// This Function Use For Set UserLoginStatus, UserId & Token in sharedPreference
  setUserLoginDetailsInPrefs({required String userToken}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    /// Decode the JWT and Get UserId & Role
    Map<String, dynamic> decodedToken = JwtDecoder.decode(userToken);
    String userId = decodedToken["_id"];
    String userRole = decodedToken["role"];
    print('userId : $userId');

    /// Remove Old Id & Token
    prefs.remove(userIdKey);
    prefs.remove(userTokenKey);
    prefs.remove(userRoleKey);

    /// Add UserId, Token & UserLoggedInStatus
    prefs.setBool(isUserLoggedInKey, true);
    prefs.setString(userIdKey, userId);
    prefs.setString(userRoleKey, userRole);
    prefs.setString(userTokenKey, userToken);

    /// Now Set Prefs Data in UserDetails in Code
    UserDetails.isUserLoggedIn = prefs.getBool(isUserLoggedInKey) ?? false;
    UserDetails.userId = prefs.getString(userIdKey) ?? "";
    UserDetails.userRole = prefs.getString(userRoleKey) ?? "";
    UserDetails.userToken = prefs.getString(userTokenKey) ?? "";

    print('UserDetails.isUserLoggedIn : ${UserDetails.isUserLoggedIn}');
    print('UserDetails.userId : ${UserDetails.userId}');
    print('UserDetails.userRole : ${UserDetails.userRole}');
    print('UserDetails.userToken : ${UserDetails.userToken}');
  }

  /// Set UserName & Profile Pic
  setUserNameAndProfileImageInPrefs({required String userName, required String userProfile}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    /// Remove Old Data
    prefs.remove(userNameKey);
    prefs.remove(userProfileImageKey);

    /// Add New Data
    prefs.setString(userNameKey, "$userName");
    prefs.setString(userProfileImageKey, userProfile);

    /// Set Data in Local Variable
    UserDetails.userName = prefs.getString(userNameKey) ?? "UserName";
    UserDetails.userProfilePic = prefs.getString(userProfileImageKey) ?? "";

    log("userName : ${UserDetails.userName}");
    log("userProfilePic : ${UserDetails.userProfilePic}");
  }

  setWalletIdInPrefs({required String walletId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(userWalletIdKey, walletId);
    print('Prefs Wallet Id : ${prefs.getString(userWalletIdKey)}');
  }

  setUserCartDetails({required String cartId, required String cartRestaurantId}) async {
    /// Set Cart Details in Prefs
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserCartCreatedKey, true);
    prefs.setString(userCartIdKey, cartId);
    prefs.setString(userCartRestaurantIdKey, cartRestaurantId);

    /// Set Cart Details in Local Variable
    UserCartDetails.isCartCreated = prefs.getBool(isUserCartCreatedKey) ?? false;
    UserCartDetails.userCartId = prefs.getString(userCartIdKey) ?? "";
    UserCartDetails.userCartRestaurantId = prefs.getString(userCartRestaurantIdKey) ?? "";

    log("isCartCreated ::: ${UserCartDetails.isCartCreated}");
    log("userCartId ::: ${UserCartDetails.userCartId}");
    log("userCartRestaurantId ::: ${UserCartDetails.userCartRestaurantId}");

  }

  deleteUserCartDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(isUserCartCreatedKey, false);
    prefs.setString(userCartIdKey, "");
    prefs.setString(userCartRestaurantIdKey, "");

    log("isUserCartCreatedKey : ${prefs.getBool(isUserCartCreatedKey)}");
    log("userCartIdKey : ${prefs.getString(userCartIdKey)}");
    log("userCartRestaurantIdKey : ${prefs.getString(userCartRestaurantIdKey)}");

    UserCartDetails.isCartCreated = false;
    UserCartDetails.userCartId = "";
    UserCartDetails.userCartRestaurantId = "";
  }


  /// Clear All UserLoggedIn Data
  clearUserLoginDetailsFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    prefs.setBool(isUserLoggedInKey, false);
    prefs.setString(userIdKey, "");
    prefs.setString(userRoleKey, "");
    prefs.setString(userTokenKey, "");
    prefs.setString(userWalletIdKey, "");

    prefs.setBool(isUserCartCreatedKey, false);
    prefs.setString(userCartIdKey, "");
    prefs.setString(userCartRestaurantIdKey, "");

  }


}
