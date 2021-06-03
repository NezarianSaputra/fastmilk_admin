import 'package:flutter/material.dart';

import 'size_config.dart';

//import 'package:shop_app/size_config.dart';
const kPrimaryColor = Color(0xFFFE931D);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kSecondaryColor = Color(0xFFBADBAD);
const kTextColor = Color(0xFFFE931D);

const kAnimationDuration = Duration(milliseconds: 200);

// final headingStyle = TextStyle(
//   fontSize: getProportionateScreenWidth(28),
//   fontWeight: FontWeight.bold,
//   color: Colors.black,
//   height: 1.5,
// );

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp usernameValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
// const String kUsernameNullError = "Please enter your username";
// const String kInvalidUsernameError = "Please enter valid username";
const String kEmailNullError = "Please enter your email";
const String kInvalidEmailError = "Email not registered";
const String kPassNullError = "Please enter your password";
const String kShortPassError = "password is too short";
const String kMatchPassError = "ID don't match";
const String kNamelNullError = "Please enter your name";
const String kPhoneNumberNullError = "Please enter your phone number";
const String kAddressNullError = "Please enter your address";
const String kPhoneNumberShortError = "Phone number is too short";

// final otpInputDecoration = InputDecoration(
//   contentPadding: EdgeInsets.symmetric(
//     vertical: getProportionateScreenWidth(15),
//   ),
//   enabledBorder: outlineInputBorder(),
//   focusedBorder: outlineInputBorder(),
//   border: outlineInputBorder(),
// );

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
      borderRadius: BorderRadius.circular(15),
      borderSide: BorderSide(color: kTextColor));
}
