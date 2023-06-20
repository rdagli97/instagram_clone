import 'package:flutter/material.dart';

class FollowButton extends StatelessWidget {
  final Function()? onPressed;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String text;
  const FollowButton({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.text,
    required this.textColor,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 2),
      child: TextButton(
        onPressed: onPressed,
        child: Container(
          decoration: BoxDecoration(
            color: backgroundColor,
            border: Border.all(
              color: borderColor,
            ),
            borderRadius: BorderRadius.circular(5),
          ),
          alignment: Alignment.center,
          width: 250,
          height: 27,
          child: Text(
            text,
            style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
