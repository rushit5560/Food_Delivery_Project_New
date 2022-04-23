class FieldValidator {

  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Please Full name';
    }
    return null;
  }

  String? validateUserName(String value) {
    if (value.isEmpty) {
      return 'Please Enter UserName';
    }
    return null;
  }

  String? validateFeedback(String value) {
    if (value.isEmpty) {
      return 'Please Enter Feedback';
    }
    return null;
  }

  String ? validateEmail(String value) {
    if (value.isEmpty) {
      return "Please Enter Email";
    } else if (!isNumeric(value) &&
        !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
      return "Invalid Email";
    } else {
      return null;
    }
  }

  String ? validatePassword(String value) {
    if (value.isEmpty) {
      return "Please Enter Password";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String ? validateOldPassword(String value) {
    if (value.isEmpty) {
      return "Please Enter Old Password";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String ? validateNewPassword(String value) {
    if (value.isEmpty) {
      return "Please Enter New Password";
    } else if (value.length < 6) {
      return "Length should be 6 character";
    } else {
      return null;
    }
  }

  String ? validateMobile(String value) {
    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
    RegExp regExp = new RegExp(pattern);
// Indian Mobile number are of 10 digit only
    if (value.isEmpty) {
      return "Please Enter Mobile Number";
    } else if (value.length != 10){
      return 'Mobile Number Must be of 10 Digit';
    } else if (!regExp.hasMatch(value)) {
      return 'Only Numeric Character Should be Allow';
    } else{
      return null;
    }

  }

  bool isNumeric(String s) {
    if (s.isEmpty) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  String? validateAddress(String value) {
    if (value.isEmpty) {
      return 'Please Enter Address';
    }
    return null;
  }
}
