import 'package:coffee_escapades/config/constants.dart';
import 'package:flutter/material.dart';

class customButton extends StatelessWidget {
  // Custom button with a few customizable parameters
  final VoidCallback? onPressed;
  final String buttonText;
  final Color color;
  final bool actionButton;

  const customButton({super.key, required this.onPressed, required this.buttonText, required this.color, this.actionButton = false});

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: onPressed == null ? 0.4 : 1.0,
      child: SizedBox(
        height: 32,
        child: MaterialButton(
          disabledColor: color,
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 12),
          onPressed: onPressed,
          color: color,
          shape: actionButton
              ? RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: const BorderSide(
                    color: Colors.blue,
                    width: 0.7,
                  ))
              : RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
          elevation: onPressed == null ? 0 : 1,
          child: Text(
            buttonText,
            style: kButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
