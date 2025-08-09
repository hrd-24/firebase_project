import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Tambahkan ini
import 'package:starting_slicing/app/constants/export.dart';
import 'package:starting_slicing/app/feature/authentication/view/register_screen.dart';
import 'package:starting_slicing/app/feature/bottom_nav.dart';
import 'package:starting_slicing/app/widgets/default_button.dart';
import 'package:starting_slicing/app/widgets/input_decoration.dart';

@RoutePage()
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static const String id = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _goToRegistScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => RegistScreen()),
    );
  }

  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      try {
        final userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim(),
            );

        // Navigasi ke HomeScreen setelah login berhasil
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => BottomNavScreen()),
        );
      } on FirebaseAuthException catch (e) {
        String errorMessage = 'Terjadi kesalahan.';
        if (e.code == 'user-not-found') {
          errorMessage = 'Pengguna tidak ditemukan.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Password salah.';
        }

        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(errorMessage)));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: AppSpacing.p20,
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
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
                      "Welcome Back",
                      style: AppTextStyle.bold(
                        fontSize: AppFontSize.h4,
                        color: AppColor.Screen,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      "Login to continue",
                      style: AppTextStyle.regular(
                        fontSize: AppFontSize.body,
                        color: AppColor.Screen,
                      ),
                    ),
                  ),
                ],
              ),
              AppSpacing.h24,
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
              TextFormField(
                controller: _emailController,
                decoration: customInputDecoration('Email').copyWith(
                  prefixIcon: Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: Icon(Icons.email_outlined, color: AppColor.Screen),
                  ),
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Email tidak boleh kosong' : null,
              ),
              AppSpacing.h16,
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
              TextFormField(
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
                validator: (value) =>
                    value!.isEmpty ? 'Password tidak boleh kosong' : null,
              ),
              AppSpacing.h24,
              DefaultButton(
                onPressed: _login,
                text: 'LOG IN',
                backgroundColor: AppColor.Screen,
                textColor: Colors.white,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: _goToRegistScreen,
                    child: Text(
                      "Sign up now",
                      style: AppTextStyle.regular(color: AppColor.Screen),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
