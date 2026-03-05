import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/register/register_screen.dart' as emailController;


import '../core/App_assets.dart';
import '../core/App_strings.dart';
import '../core/app_colors.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screens/home_screen.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

@override
void dispose() {
  emailController.dispose();
  emailController.dispose();
  emailController.dispose();
  emailController.dispose();
  emailController.dispose();
  dispose();
}
class _RegisterScreenState extends State<RegisterScreen> {



  Future<void> registerUser() async {
    bool _isLoading;
    if (!_formKey.currentState!.validate()) return;
    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords don't match")));
      return;
    }

    setState(() => _isLoading = true);

    try {

      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );


      await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).set({
        'name': _nameController.text.trim(),
        'phone': _phoneController.text.trim(),
        'email': _emailController.text.trim(),
        'confirm': _phoneController.text.trim(),
        'password': _emailController.text.trim(),
      });


      Navigator.pushReplacementNamed(context, '/home');
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.message ?? "Error")));
    } finally {

      setState(() => _isLoading = false);
    }
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool isEnglish = true;
  bool _isObscure = true;
  bool _isObscur= true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Form(
        key:_formKey,
        child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppBar(
              iconTheme: IconThemeData(color: AppColors.yelow),
              backgroundColor: AppColors.black,
              title: Center(
                child: Text(
                  "register",
                  style: TextStyle(color: AppColors.yelow),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Image.asset(AppAssets.player3,
                  ),
CircleAvatar(radius: 30,
                backgroundImage:  AssetImage(AppAssets.player1,
                ),),
                  //SizedBox(height: 10,),
                  Image.asset(AppAssets.player2),

                  // SizedBox(height: 10,),
                ],
              ),
            ),
            SizedBox(height: 10),
            Text("Avatar",
            style: TextStyle(color: AppColors.wight),),
            SizedBox(height: 10),
            TextFormField(
              controller: _nameController,

              style: TextStyle(color: AppColors.wight),
              decoration: InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 4,
                  horizontal: 10
                ),
                filled: true,
                fillColor: AppColors.blueBlack,
                hintText: AppStrings.name,
                hintStyle: TextStyle(color: AppColors.wight),
                prefixIcon: Icon(Icons.account_box, color: AppColors.wight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _emailController,
              style: TextStyle(color: AppColors.wight),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                ),
                filled: true,
                fillColor: AppColors.blueBlack,
                hintText: 'Email',
                hintStyle: TextStyle(color: AppColors.wight),
                prefixIcon: Icon(Icons.email, color: AppColors.wight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              obscureText: _isObscure,
              controller: _passwordController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                ),
                filled: true,
                fillColor: AppColors.blueBlack,
                hintText: AppStrings.passWard,
                hintStyle: TextStyle(color: AppColors.wight),

                prefixIcon: Icon(Icons.lock_outline, color: AppColors.wight),

                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscure ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                       _isObscure = !_isObscure;
                    });
                  },
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),

              ),
            ),
            SizedBox(height: 10),
            TextFormField(
              controller: _confirmPasswordController,
              style: TextStyle(color: AppColors.wight),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                ),
                filled: true,
                fillColor: AppColors.blueBlack,
                hintText: AppStrings.confirmPassword,
                hintStyle: TextStyle(color: AppColors.wight),
                prefixIcon: Icon(Icons.lock_outline, color: AppColors.wight),
                suffixIcon: IconButton(
                  icon: Icon(
                    _isObscur ? Icons.visibility_off : Icons.visibility,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    setState(() {
                      _isObscur = !_isObscur;
                    });
                  },
                  color: AppColors.wight,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),

            TextFormField(
              controller: _phoneController,
              style: TextStyle(color: AppColors.wight),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10
                ),
                filled: true,
                fillColor: AppColors.blueBlack,
                hintText: AppStrings.phoneNumber,
                hintStyle: TextStyle(color: AppColors.wight),
                prefixIcon: Icon(Icons.phone, color: AppColors.wight),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(

              onPressed: () {
                registerUser();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.yelow,
                minimumSize: Size(double.infinity, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 0,
              ),
              child: Text(
                AppStrings.createAccount,
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               InkWell(
                 onTap: (){
       Navigator.push(
      context,MaterialPageRoute(builder: (context)=>const HomeScreen(),
      ) ,);
                 },
                 child: Text(
                  AppStrings.alreadyHaveAccount,
                  style: TextStyle(
                    color: AppColors.wight,
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
                ),),
                Text(
                  AppStrings.login,
                  style: TextStyle(
                    color: AppColors.yelow,
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
                ),
              ],
            ),
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {
                setState(() {
                  isEnglish = !isEnglish;
                });
              },
              child: Container(
                width: 90,
                height: 38,
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: Color(0xFF0D1B2A),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Color(0xFFFFD152), width: 2),
                ),
                child: AnimatedAlign(
                  duration: Duration(milliseconds: 250),
                  alignment: isEnglish
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                          isEnglish
                              ? 'https://flagcdn.com/w80/us.png'
                              : 'https://flagcdn.com/w80/eg.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),),
    );
  }
}
