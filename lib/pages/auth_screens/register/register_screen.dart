import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../../core/route/route_name.dart';
import '../../../core/theme/App_assets.dart';
import '../../../core/theme/App_strings.dart';
import '../../../core/theme/color_pallete.dart';
import '../../../models/user_data_model.dart';
import '../../../utils/firebase_auth_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  bool isEnglish = true;
  bool _isObscur = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorPallete.yellow),
        backgroundColor: ColorPallete.black,
        title: Center(
          child: Text("register", style: TextStyle(color: ColorPallete.yellow)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Bounceable(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 20,
                    children: [
                      Image.asset(AppAssets.player3),
                      CircleAvatar(
                        radius: 90,
                        backgroundImage: AssetImage(AppAssets.player1),
                      ),
                      //SizedBox(height: 10,),
                      Image.asset(AppAssets.player2),

                      // SizedBox(height: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Text("Avatar", style: TextStyle(color: ColorPallete.white)),
                SizedBox(height: 10),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Name is required';
                    }
                    if (value.length < 3) {
                      return 'Name must be at least 3 letters';
                    }
                    return null;
                  },

                  style: TextStyle(color: ColorPallete.white),
                  decoration: InputDecoration(
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 4,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: ColorPallete.blueBlack,
                    hintText: AppStrings.name,
                    hintStyle: TextStyle(color: ColorPallete.white),
                    prefixIcon: Icon(
                      Icons.account_box,
                      color: ColorPallete.white,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _emailController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is Required';
                    }
                    final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}',
                    );
                    if (!emailRegex.hasMatch(value)) {
                      return 'please enter a valid email';
                    }
                    return null;
                  },
                  style: TextStyle(color: ColorPallete.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
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
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _passwordController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }
                    final passwordRegex = RegExp(
                      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$',
                    );
                    if (!passwordRegex.hasMatch(value)) {
                      return 'Password must contain at least 8 chars, one uppercase, one lowercase, one number, and one special character';
                    }
                    return null;
                  },
                  obscureText: _isObscur,
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
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
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  obscureText: _isObscur,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Confirm your password ';
                    }
                    if (value != _passwordController.text) {
                      return 'Passwords do not match';
                    }
                  },
                  style: TextStyle(color: ColorPallete.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: ColorPallete.blueBlack,
                    hintText: AppStrings.confirmPassword,
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
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(
                        color: Colors.red,
                        width: 2,
                        style: BorderStyle.solid,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),

                TextFormField(
                  autovalidateMode: AutovalidateMode.always,
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Email is Required';
                    }
                    final phoneRegex = RegExp(r"^01[0125]\d{8}$");
                    if (!phoneRegex.hasMatch(value)) {
                      return 'please enter a valid phone Number';
                    }
                    return null;
                  },
                  style: TextStyle(color: ColorPallete.white),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 10,
                    ),
                    filled: true,
                    fillColor: ColorPallete.blueBlack,
                    hintText: AppStrings.phoneNumber,
                    hintStyle: TextStyle(color: ColorPallete.white),
                    prefixIcon: Icon(Icons.phone, color: ColorPallete.white),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(color: Colors.red, width: 2),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      UserDataModel? user =
                          await FirebaseAuthUtils.createUserWithEmailAndPassword(
                            _nameController.text,
                            _emailController.text,
                            _passwordController.text,
                            _phoneController.text,
                          );
                      if (user != null) {
                        print('Account created');
                        Navigator.pushReplacementNamed(
                          context,
                          RouteName.navigation_screen,
                        );
                      }
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorPallete.yellow,
                    minimumSize: Size(double.infinity, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    AppStrings.createAccount,
                    style: TextStyle(
                      color: ColorPallete.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.alreadyHaveAccount,
                      style: TextStyle(
                        color: ColorPallete.white,
                        fontWeight: FontWeight.w400,
                        fontSize: 19,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, RouteName.login);
                      },
                      child: Text(
                        AppStrings.login,
                        style: TextStyle(
                          color: ColorPallete.yellow,
                          fontWeight: FontWeight.w400,
                          fontSize: 19,
                        ),
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
          ),
        ),
      ),
    );
  }
}
