import 'package:flutter/material.dart';

import '../core/App_assets.dart';
import '../core/App_strings.dart';
import '../core/app_colors.dart';
import '../register/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isEnglish = true;
  bool _isObscur = true;
  @override
  Widget build(BuildContext context) {
    bool _isObscure = true;
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppAssets.player, height: 118, width: 121),
                SizedBox(height: 30),
                TextFormField(
                  style: TextStyle(color: AppColors.wight),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
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
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      AppStrings.forgetPassword,
                      style: TextStyle(
                        color: AppColors.yelow,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yelow,
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.login,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.dontHaveAccount,
                      style: TextStyle(
                        color: AppColors.wight,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(height: 20),

                    /*
                    Text(AppStrings.create,
                      style: TextStyle(
                          color: AppColor.yelow,
                          fontWeight: FontWeight.w400,
                          fontSize: 19
                      ),),
                      */
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const RegisterScreen(),
                          ),
                        );
                      },
style:ElevatedButton.styleFrom(
  backgroundColor: AppColors.black
) ,

                      child: Text(AppStrings.create,
                      style: TextStyle(
color: AppColors.wight,
                        fontSize: 12
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  AppStrings.oR,
                  style: TextStyle(
                    color: AppColors.yelow,
                    fontWeight: FontWeight.w400,
                    fontSize: 19,
                  ),
                ),
                SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.yelow,
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 10,
                      children: [
                        Image.asset(AppAssets.icon_google),
                        Text(
                          AppStrings.loginWithGoogle,

                          style: TextStyle(
                            color: AppColors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10),
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
          ),
        ),
      ),
    );
  }
}
