import 'package:flutter/material.dart';

class textfield extends StatefulWidget {
  final String message;
  final bool isPassword;
  final IconData pstfixIcon;

  const textfield( this.isPassword,this.pstfixIcon,{this.message = '', super.key});

  @override
  State<textfield> createState() => _textfieldState();
}

class _textfieldState extends State<textfield> {
  bool _isHidden = false;


  @override
  Widget build(BuildContext context) {
    return Container(
      //////////textfield
      margin: EdgeInsets.symmetric( horizontal: 5),
      child: TextField(
        obscureText: widget.isPassword ? _isHidden : _isHidden,
        style: TextStyle(fontSize: 20,fontWeight: .w400,color: ColorPallete.white),
        decoration: InputDecoration(
          hintText: widget.message,
          prefixIcon: Icon(widget.pstfixIcon,color: ColorPallete.white,),
          suffixIcon: widget.isPassword
              ? InkWell(
            onTap: () {
              setState(() => _isHidden = !_isHidden);
            },
            child: Icon(Icons.visibility),
          )
              : null,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
          filled: true,
          fillColor: ColorPallete.gray,
        ),
      ),
    );

    /////////////Button
  }
}
