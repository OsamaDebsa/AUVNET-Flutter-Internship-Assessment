import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void flutterToast({required String msg}) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Colors.grey[800],
    textColor: Colors.white,
    fontSize: 16.0,
  );
}
