import 'package:flutter/material.dart';

class ElevatedButtonCustomWidget extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? backGroundColor;
  final Color? foreGroundColor;
  final Color? borderColor;
  const ElevatedButtonCustomWidget({
    super.key,
    required this.onPressed,
    required this.text,
    this.backGroundColor,
    this.foreGroundColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              onPressed.call();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: backGroundColor ?? Color(0xFFF6BD00),
              foregroundColor: foreGroundColor ?? Color(0xFF121312),
              side:  BorderSide(color:borderColor??Colors.transparent,width: 2 ),
              padding: EdgeInsetsGeometry.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(15),
              ),
            ),
            child: Text(text,style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20),),
          ),
        ),
      ],
    );
  }
}
