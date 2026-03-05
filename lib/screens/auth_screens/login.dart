import 'package:flutter/material.dart';
import '../../core/app_colors.dart';
import 'forget_password/forget_password_screen.dart';
class Login  extends StatelessWidget{
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       floatingActionButton: FloatingActionButton(
         onPressed: () {
           Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) =>  ForgetPasswordScreen(),
             ),
           );
         },
         backgroundColor: AppColors.mainColor,
         foregroundColor: Colors.white,
         shape: const CircleBorder(),
         child: const Icon(Icons.add),
       ),

       floatingActionButtonLocation:
       FloatingActionButtonLocation.endFloat,


   );
  }
}