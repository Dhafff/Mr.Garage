import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(this.message, {super.key,  required this.onPressed});

  final String message;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    const primaryButtonColor = Color(0xFF007EA7);

    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: ElevatedButton(
        style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(
            Size(320, 54),
          ),
          foregroundColor: WidgetStateProperty.all(Colors.white),
          backgroundColor: WidgetStateProperty.all(primaryButtonColor),
        ),
        onPressed: onPressed,
        child: Text(
          message, // Display the passed-in message
          style: const TextStyle(
              fontFamily: 'Rubik', fontWeight: FontWeight.w400, fontSize: 16),
        ),
      ),
    );
  }
}