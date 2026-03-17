import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../core/route/route_name.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';
import '../../customWidget/custom_button.dart';
import '../../customWidget/darged_avatar_menu.dart';
import '../../customWidget/textfield.dart';
import '../../models/user_data_model.dart';

class UpdateProfilePage extends StatefulWidget {
  @override
  State<UpdateProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<UpdateProfilePage> {

  int newAvatarIndex = 0;

  late TextEditingController nameController;
  late TextEditingController phoneController;

  UserDataModel? currentUser;

  @override
  void initState() {
    super.initState();

    nameController = TextEditingController();
    phoneController = TextEditingController();

    getUserData();
  }

  Future<void> getUserData() async {

    var doc = await FirebaseFirestore.instance
        .collection(UserDataModel.collectionName)
        .doc("1")
        .get();

    currentUser = UserDataModel.fromFireStore(doc.data()!);

    nameController.text = currentUser!.userName;
    phoneController.text = currentUser!.phoneNumber;

    setState(() {});
  }

  Future<void> updateUserData() async {

    currentUser!.userName = nameController.text;
    currentUser!.phoneNumber = phoneController.text;

    await FirebaseFirestore.instance
        .collection(UserDataModel.collectionName)
        .doc(currentUser!.userId)
        .update(currentUser!.toFireStore());
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, size: 25),
        ),
        iconTheme: IconThemeData(color: ColorPallete.yellow),
        centerTitle: true,
        title: Text(
          'Update Profile',
          style: TextStyle(
            color: ColorPallete.yellow,
            fontSize: 19,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),

      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Bounceable(
              onTap: () async {
                final int? selectedIndex =
                await showModalBottomSheet<int>(
                  context: context,
                  builder: (context) => DargedAvatarMenu(),
                );

                if (selectedIndex != null) {
                  setState(() {
                    newAvatarIndex = selectedIndex;
                  });
                }
              },
              child: CircleAvatar(
                radius: 80,
                child: Image.asset(
                  ImageRepository.avatars[newAvatarIndex],
                ),
              ),
            ),

            SizedBox(height: 35),

            textfield.name(controller: nameController,false, Icons.person),

            SizedBox(height: 18),

            textfield.name(controller: phoneController,false, Icons.phone),

            SizedBox(height: 30),

            InkWell(
              child: Text(
                "Reset Password",
                style: TextStyle(
                  color: ColorPallete.white,
                  fontSize: 20,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, RouteName.forget_password);
              },
            ),
          ],
        ),
      )),

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [

            CustomButton(
              onPressed: () {},
              text: "Delete Account",
              textColor: ColorPallete.white,
              buttonColor: ColorPallete.red,
            ),

            SizedBox(height: 15),

            CustomButton(
              onPressed: updateUserData,
              text: "Update Data",
              textColor: ColorPallete.black,
              buttonColor: ColorPallete.yellow,
            ),
          ],
        ),
      ),
    );
  }
}