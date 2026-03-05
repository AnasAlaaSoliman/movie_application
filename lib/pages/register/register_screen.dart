import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import '../../core/theme/App_assets.dart';
import '../../core/theme/App_strings.dart';
import '../../core/theme/color_pallete.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool isEnglish = true;
  bool _isObscur = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,

      appBar: AppBar(
        toolbarHeight: 70,
        iconTheme: IconThemeData(color: ColorPallete.yellow),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          "register",
          style: TextStyle(
            color: ColorPallete.yellow,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Bounceable(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  Image.asset(AppAssets.player3),
                  CircleAvatar(
                    radius: 60,
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
            SizedBox(height: 20),
            TextFormField(
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
                prefixIcon: Icon(Icons.account_box, color: ColorPallete.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
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
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
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

                prefixIcon: Icon(Icons.lock_outline, color: ColorPallete.white),

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
              ),
            ),
            SizedBox(height: 24),
            TextFormField(
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
                prefixIcon: Icon(Icons.lock_outline, color: ColorPallete.white),
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
              ),
            ),
            SizedBox(height: 24),

            TextFormField(
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
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {},
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
            SizedBox(height: 10),
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
                Bounceable(
                  onTap: () {
                    Navigator.pop(context);
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
    );
  }
}
