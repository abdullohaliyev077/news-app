import 'package:flutter/material.dart';
import 'package:flutter_application_2/Config/Colors.dart';
import 'package:fluttertoast/fluttertoast.dart';


successMessage(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: greenColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
errorMessage(String message) => Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: darkPrimaryColor,
      textColor: Colors.white,
      fontSize: 16.0,
    );
