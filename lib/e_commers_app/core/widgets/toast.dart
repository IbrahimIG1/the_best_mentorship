import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void showToast(String message, {Color background = Colors.black87, Toast toastLength = Toast.LENGTH_SHORT}) {
  Fluttertoast.showToast(
    msg: message,
    backgroundColor: background,
    textColor: Colors.white,
    gravity: ToastGravity.CENTER,
    toastLength: toastLength
  );
}
