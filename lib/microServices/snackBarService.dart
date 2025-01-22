import 'package:flutter/material.dart';

class SnackBarService {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey = 
      GlobalKey<ScaffoldMessengerState>();

  static void showMessage(String message, Color color) {
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color,),
    );
  }
}