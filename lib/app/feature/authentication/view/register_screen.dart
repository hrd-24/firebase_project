import 'package:flutter/material.dart';
import 'package:starting_slicing/app/constants/app_color.dart';
import 'package:starting_slicing/app/constants/app_spacing.dart';
import 'package:starting_slicing/app/constants/app_style.dart';
import 'package:starting_slicing/app/feature/authentication/view/login_screen.dart';
import 'package:starting_slicing/app/service/user_account.dart';
import 'package:starting_slicing/app/widgets/default_button.dart';
import 'package:starting_slicing/app/widgets/input_decoration.dart';

class RegistScreen extends StatefulWidget {
  @override
  State<RegistScreen> createState() => _RegistScreenState();
}

class _RegistScreenState extends State<RegistScreen> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscureText = true;

  final UserCreate _userCreate = UserCreate();

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void register() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Semua field harus diisi!")));
      return;
    }

    String? result = await UserCreate().createAccount(
      name: name,
      email: email,
      password: password,
    );

    if (result == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Akun berhasil dibuat!")));
      Navigator.pop(context); // Kembali ke halaman sebelumnya
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Error: $result")));
    }
  }

  void _goToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppSpacing.p20,
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 40),
                const Center(
                  child: Image(
                    image: AssetImage('assets/images/icon.jpg'),
                    height: 250,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "Create An Account",
                    style: AppTextStyle.bold(
                      fontSize: AppFontSize.h4,
                      color: AppColor.Screen,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Name",
                style: AppTextStyle.bold(
                  fontSize: AppFontSize.body,
                  color: AppColor.Screen,
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              decoration: customInputDecoration('Name'),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Email",
                style: AppTextStyle.bold(
                  fontSize: AppFontSize.body,
                  color: AppColor.Screen,
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: customInputDecoration('Email').copyWith(
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8),
                  child: Icon(Icons.email_outlined, color: AppColor.Screen),
                ),
              ),
            ),
            SizedBox(height: 16),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Password",
                style: AppTextStyle.bold(
                  fontSize: AppFontSize.body,
                  color: AppColor.Screen,
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: _obscureText,
              decoration: customInputDecoration('Password').copyWith(
                suffixIcon: IconButton(
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                  onPressed: _togglePasswordVisibility,
                ),
              ),
            ),
            SizedBox(height: 24),
            DefaultButton(
              text: "SIGN UP",
              onPressed: register,
              backgroundColor: AppColor.Screen,
              textColor: Colors.white,
              useShadow: true,
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Have an account already?'),
                TextButton(
                  onPressed: _goToLoginScreen,
                  child: Text(
                    "Log in",
                    style: AppTextStyle.regular(color: AppColor.Screen),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
