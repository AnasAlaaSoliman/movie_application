import 'package:flutter/material.dart';

import '../core/theme/color_pallete.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final IconData? suffix;
  final VoidCallback? onPressed;

  CustomButton({
    required this.text,
    required this.textColor,
    required this.buttonColor,
    this.suffix,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        padding: EdgeInsets.symmetric(vertical: 15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
          ),

          SizedBox(width: 10,),

          Icon(suffix,color: ColorPallete.white,),
        ],
      ),
    );
  }
}
