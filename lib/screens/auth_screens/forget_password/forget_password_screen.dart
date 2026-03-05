import 'package:flutter/material.dart';
import 'package:movie_app/utils/firebase_auth_utils.dart';
import '../../../core/theme/color_pallete.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isLoading = false;

  Future<void> resetPassword() async {

    if (!_formKey.currentState!.validate()) return;

    setState(() {
      isLoading = true;
    });

    try {

      await FirebaseAuthUtils.resetPassword(
        _emailController.text.trim(),
      );

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password reset email sent"),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context);

    } catch (e) {

      setState(() {
        isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to send email"),
          backgroundColor: Colors.red,
        ),
      );

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPallete.background,

      appBar: AppBar(
        backgroundColor: ColorPallete.background,
        iconTheme: const IconThemeData(color: ColorPallete.yellow),
        centerTitle: true,
        title: const Text(
          "Forget Password",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: ColorPallete.yellow,
          ),
        ),
      ),

      body: SingleChildScrollView(

        child: Form(
          key: _formKey,

          child: Column(
            children: [

              Image.asset(
                "assets/images/forget_password.png",
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 30),

              /// Email Field
              Container(
                width: 398,
                height: 56,

                decoration: BoxDecoration(
                  color: ColorPallete.textField,
                  borderRadius: BorderRadius.circular(14),
                ),

                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(color: Colors.white),

                  decoration: const InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email, color: Colors.white, size: 30),
                    hintStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 16,
                    ),
                  ),

                  validator: (value) {

                    if (value == null || value.isEmpty) {
                      return "Please enter your email";
                    }

                    if (!value.contains("@") || !value.contains(".")) {
                      return "Enter a valid email";
                    }

                    return null;
                  },
                ),
              ),

              const SizedBox(height: 30),

              /// Button
              SizedBox(
                height: 56,
                width: 398,

                child: isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : ElevatedButton(

                  onPressed: resetPassword,

                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(16),
                    backgroundColor: ColorPallete.yellow,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),

                  child: const Text(
                    "Verify Email",
                    style: TextStyle(
                      color: ColorPallete.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}