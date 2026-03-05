import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:movie_app/core/theme/image_repository.dart';
import 'package:movie_app/core/theme/color_pallete.dart';
import 'package:movie_app/customWidget/custom_button.dart';
import 'package:movie_app/customWidget/darged_avatar_menu.dart';
import 'package:movie_app/customWidget/textfield.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  State<UpdateProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<UpdateProfilePage> {
  int newAvatarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        iconTheme: IconThemeData(color: ColorPallete.yellow),
        centerTitle: true,
        title: Text(
          'Pick Avatar',
          style: TextStyle(
            color: ColorPallete.yellow,
            fontSize: 19,
            fontWeight: .w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Bounceable(
              onTap: () async {
                final int selectedIndex = await showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return DargedAvatarMenu();
                  },
                );

                if (selectedIndex != null) {
                  setState(() {
                    newAvatarIndex = selectedIndex;
                  });
                }
              },
              child: CircleAvatar(
                radius: 80,
                child: Image.asset(ImageRepository.avatars[newAvatarIndex]),
              ),
            ),
            SizedBox(height: 35),
            textfield(false, Icons.person),
            SizedBox(height: 18),
            textfield(false, Icons.phone),
            SizedBox(height: 30),
            InkWell(
              child: Text(
                " Reset Password",
                style: TextStyle(
                  color: ColorPallete.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onTap: () {},
            ),

            //Spacer(flex:1,),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        //alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomButton(
                onPressed: (){},
                text: "Delete Account",
                textColor: ColorPallete.white,
                buttonColor: ColorPallete.red,
              ),

              SizedBox(height: 15),

              CustomButton(
                onPressed: (){},
                text: "Update Data",
                textColor: ColorPallete.black,
                buttonColor: ColorPallete.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
