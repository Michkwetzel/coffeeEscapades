import 'package:flutter/material.dart';

class SnackBarService {
  static final GlobalKey<ScaffoldMessengerState> scaffoldKey = 
      GlobalKey<ScaffoldMessengerState>();

  static void showMessage(String message, Color color) {
    // Global snackbar without needing Context
    scaffoldKey.currentState?.showSnackBar(
      SnackBar(content: Text(message), backgroundColor: color,),
    );
  }
}