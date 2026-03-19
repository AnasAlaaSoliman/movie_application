import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';

import '../../core/route/route_name.dart';
import '../../core/theme/color_pallete.dart';
import '../../core/theme/image_repository.dart';
import '../../customWidget/custom_button.dart';
import '../../customWidget/darged_avatar_menu.dart';
import '../../customWidget/textfield.dart';
import '../../utils/firebase_auth_utils.dart';
import '../../utils/firestore_utils.dart';
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
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    currentUser =
    await FirestoreUtils.getUserFromFirestore(user.uid);

    if (currentUser != null) {
      nameController.text = currentUser!.userName;
      phoneController.text = currentUser!.phoneNumber;
      newAvatarIndex = currentUser!.avatarIndex;
    }

    setState(() {});
  }

  Future<void> updateUserData() async {
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) return;

    currentUser!.userName = nameController.text;
    currentUser!.phoneNumber = phoneController.text;
    currentUser!.avatarIndex = newAvatarIndex;

    await FirebaseFirestore.instance
        .collection(UserDataModel.collectionName)
        .doc(user.uid)
        .update(currentUser!.toFireStore());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Updated successfully ✅")),
    );
  }

  Future<void> deleteAccount() async {
    try {
      await FirebaseAuthUtils.deleteCurrentUser();
      Navigator.pushReplacementNamed(context, RouteName.login);
    } catch (e) {
      if (e.toString().contains("REQUIRES_RELOGIN")) {
        showReAuthDialog();
      }
    }
  }

  void showReAuthDialog() {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Re-login required"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(controller: emailController),
            TextField(controller: passwordController, obscureText: true),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await FirebaseAuthUtils.reAuthenticate(
                emailController.text,
                passwordController.text,
              );
              Navigator.pop(context);
              deleteAccount();
            },
            child: Text("Confirm"),
          )
        ],
      ),
    );
  }

  void confirmDelete() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Delete Account"),
        content: Text("Are you sure? This cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              deleteAccount();
            },
            child: Text("Delete"),
          ),
        ],
      ),
    );
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
          icon: Icon(Icons.arrow_back),
        ),
        iconTheme: IconThemeData(color: ColorPallete.yellow),
        centerTitle: true,
        title: Text("Update Profile",
            style: TextStyle(color: ColorPallete.yellow)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
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
                backgroundColor: Colors.transparent,
                backgroundImage: AssetImage(
                  ImageRepository.avatars[newAvatarIndex],
                ),
              ),
            ),
            SizedBox(height: 30),
            textfield.name(controller: nameController, false, Icons.person),
            SizedBox(height: 15),
            textfield.name(controller: phoneController, false, Icons.phone),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, RouteName.forget_password);
                  },
                  child: Text(
                    "Reset Password",
                    style: TextStyle(color: ColorPallete.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomButton(
              onPressed: confirmDelete,
              text: "Delete Account",
              textColor: ColorPallete.white,
              buttonColor: ColorPallete.red,
            ),
            SizedBox(height: 10),
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