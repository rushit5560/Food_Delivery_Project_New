class FieldValidator {
  String? validateFullName(String value) {
    if (value.isEmpty) {
      return 'Field is Required';
    }

    return null;
  }

  String? validateSellerName(String value) {
    if (value.isEmpty) {
      return 'Please Enter Seller name';
    }

    return null;
  }

  String? validateStoreName(String value) {
    if (value.isEmpty) {
      return 'Please Enter Store name';
    }

    return null;
  }

  String? validateRange(String value) {
    if (value.isEmpty) {
      return 'Please Enter Delivery Range';
    }

    return null;
  }

  String? validateProduct(String value) {
    if (value.isEmpty) {
      return 'Product Title is Required';
    }

    return null;
  }

  String? validateDescription(String value) {
    if (value.isEmpty) {
      return 'Description is Required';
    }

    return null;
  }

  String? validatePrice(String value) {
    if (value.isEmpty) {
      return 'Field is Required';
    }

    return null;
  }

  String? validateMrp(String value) {
    if (value.isEmpty) {
      return 'Mrp is Required';
    }

    return null;
  }

  String? validateQty(String value) {
    if (value.isEmpty) {
      return 'Quantity is Required';
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

  String ? validateMobile(String value) {
// Indian Mobile number are of 10 digit only
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
      return 'Address is Required';
    }
    return null;
  }

  String? validateCity(String value) {
    if (value.isEmpty) {
      return 'Please Select City';
    }
    return null;
  }

  String? validateStoreAddress(String value) {
    if (value.isEmpty) {
      return 'Please Enter Store Address';
    }
    return null;
  }
}
