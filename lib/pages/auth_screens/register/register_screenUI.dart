import 'package:flutter/material.dart';

import '../../../core/theme/App_assets.dart';
import '../../../core/theme/App_strings.dart';
import '../../../core/theme/color_pallete.dart';

class RegisterScreenUI extends StatefulWidget {
  const RegisterScreenUI({super.key});

  @override
  State<RegisterScreenUI> createState() => _RegisterScreenStateUI();
}

class _RegisterScreenStateUI extends State<RegisterScreenUI> {
  bool isEnglish = true;
  bool _isObscur = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            AppBar(
              iconTheme: IconThemeData(color: ColorPallete.yellow),
              backgroundColor: ColorPallete.black,
              title: Center(
                child: Text(
                  "register",
                  style: TextStyle(color: ColorPallete.yellow),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 10,
                children: [
                  Image.asset(AppAssets.player3),
                  CircleAvatar(
                    radius: 30,
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
            SizedBox(height: 10),
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
            SizedBox(height: 10),
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
            SizedBox(height: 10),
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
            SizedBox(height: 10),

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
            SizedBox(height: 10),
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
                Text(
                  AppStrings.login,
                  style: TextStyle(
                    color: ColorPallete.yellow,
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
      ),
    );
  }
}
