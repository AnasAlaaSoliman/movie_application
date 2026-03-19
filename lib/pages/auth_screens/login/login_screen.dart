import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../../core/route/route_name.dart';
import '../../../core/theme/App_assets.dart';
import '../../../core/theme/App_strings.dart';
import '../../../core/theme/color_pallete.dart';
import '../../../utils/firebase_auth_utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isEnglish = true;
  bool _isObscur = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 40),
            child: Column(
              children: [

                Image.asset(AppAssets.player, height: 118, width: 121),

                const SizedBox(height: 70),

                TextFormField(
                  controller: emailController,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorPallete.blueBlack,
                    hintText: 'Email',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.email, color: Colors.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),


                TextFormField(
                  controller: passwordController,
                  obscureText: _isObscur,
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: ColorPallete.blueBlack,
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white),
                    prefixIcon: const Icon(Icons.lock_outline, color: Colors.white),

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
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Bounceable(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          RouteName.forget_password,
                        );
                      },
                      child: const Text(
                        "Forget Password",
                        style: TextStyle(
                          color: ColorPallete.yellow,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                ElevatedButton(
                  onPressed: () async {

                    var user =
                    await FirebaseAuthUtils.signInWithEmailAndPassword(
                        emailController.text,
                        passwordController.text
                    );

                    if(user != null){

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Login Successful"),
                        ),
                      );

                      Navigator.pushReplacementNamed(
                        context,
                        RouteName.navigation_screen,
                      );

                    }else{

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Email or Password incorrect"),
                        ),
                      );

                    }

                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.yellow,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),

                  child: const Text(
                    "Login",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: Colors.white),
                    ),

                    TextButton(
                      onPressed: () {

                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.register,
                        );

                      },
                      child: const Text(
                        "Create",
                        style: TextStyle(color: ColorPallete.yellow),
                      ),
                    )
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
    );
  }
}