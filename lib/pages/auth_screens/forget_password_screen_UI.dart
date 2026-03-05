import 'package:flutter/material.dart';
import '../../core/theme/color_pallete.dart';

class ForgetPasswordScreenUI extends StatelessWidget {
   const ForgetPasswordScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,
      appBar: AppBar(
        backgroundColor: ColorPallete.background,
        iconTheme:const IconThemeData(color:ColorPallete.yellow),
        centerTitle: true,
        title: Text("Forget Password",
          style: TextStyle(fontSize:16 ,
              fontWeight:FontWeight.w400,
              color:ColorPallete.yellow
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset("assets/images/forget_password.png",fit:BoxFit.cover,),
          SizedBox(height: 30,),
      Container(
      width: 398,
      height: 56,
      decoration: BoxDecoration(
        color:ColorPallete.textField,
        borderRadius: BorderRadius.circular(14),

      ),
      child: TextFormField(
        style: TextStyle(
          color:Colors.white
        ),

        maxLines:2,
        decoration: InputDecoration(
          hintText: "Email",
          prefixIcon:Icon(Icons.email,color: Colors.white,size:30,),
          hintStyle: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w400,
            
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 18,
            horizontal: 16,
          ),
        ),
      ),
      ),
          SizedBox(height: 30,),

          SizedBox(

            height: 56,
            width: 398,
            child: ElevatedButton(

              onPressed: ()  {},

              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(16),
                  backgroundColor: ColorPallete.background,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),

              child: Text("Verify Email", style: TextStyle(color: ColorPallete.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w400),),
            ),
          ),
        ],
        
      ),



    );

  }
}