import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:movie_app/core/route/route_name.dart';
import 'package:movie_app/core/theme/App_assets.dart';
import 'package:movie_app/core/theme/color_pallete.dart';
import '../../../core/theme/App_strings.dart';
import '../../../screens/auth_screens/forget_password/forget_password_screen.dart';
import '../register/register_screenUI.dart';

class LoginScreenUI extends StatefulWidget {
  const LoginScreenUI({super.key});

  @override
  State<LoginScreenUI> createState() => _LoginScreenStateUI();
}

class _LoginScreenStateUI extends State<LoginScreenUI> {
  bool isEnglish = true;
  bool _isObscur = true;

  @override
  Widget build(BuildContext context) {
    //bool _isObscure = true;
    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 40),
            child: Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppAssets.player, height: 118, width: 121),
                  SizedBox(height: 70),
                  TextFormField(
                    style: TextStyle(color: ColorPallete.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 10,
                      ),
                      filled: true,
                      fillColor: ColorPallete.blueBlack,
                      hintText: 'Email',
                      hintStyle: TextStyle(color: ColorPallete.white),
                      prefixIcon: Icon(Icons.email, color: ColorPallete.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  TextFormField(
                    obscureText: _isObscur,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 4,
                        horizontal: 10,
                      ),
                      filled: true,
                      fillColor: ColorPallete.blueBlack,
                      hintText: AppStrings.passWard,
                      hintStyle: TextStyle(color: ColorPallete.white),

                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: ColorPallete.white,
                      ),

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
                        color: ColorPallete.white,
                      ),

                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Bounceable(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const ForgetPasswordScreen(),
                            ),
                          );
                        },
                        child: Text(
                          AppStrings.forgetPassword,
                          style: TextStyle(
                            color: ColorPallete.yellow,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        RouteName.navigation_screen,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.yellow,
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      AppStrings.login,
                      style: TextStyle(
                        color: ColorPallete.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.dontHaveAccount,
                        style: TextStyle(
                          color: ColorPallete.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
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
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreenUI(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorPallete.black,
                        ),

                        child: Text(
                          AppStrings.create,
                          style: TextStyle(
                            color: ColorPallete.yellow,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Divider(
                          color: ColorPallete.yellow,
                          thickness: 2,
                        ),
                      ),
                      Text(
                        AppStrings.oR,
                        style: TextStyle(
                          color: ColorPallete.yellow,
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: ColorPallete.yellow,
                          thickness: 2,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 27),

                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorPallete.yellow,
                      minimumSize: Size(double.infinity, 50),
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
                              color: ColorPallete.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 30),
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
      ),
    );
  }
}
