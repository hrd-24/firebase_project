import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starting_slicing/app/constants/app_image.dart';
import 'package:starting_slicing/app/feature/authentication/view/login_screen.dart';
import 'package:starting_slicing/app/feature/intro_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 2), () async {
      final prefs = await SharedPreferences.getInstance();
      final introSeen = prefs.getBool('intro_seen') ?? false;

      if (introSeen) {
        // Jika sudah pernah lihat intro → ke Login
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => LoginScreen()),
        );
      } else {
        // Jika belum → tampilkan Screen
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const ScreenSimple()),
        );
      }
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(AppImage.kLogoPNG, width: 100, height: 100),
            const SizedBox(height: 20),
            // const Text(
            //   'Mobile Application',
            //   style: TextStyle(
            //     fontSize: 32,
            //     fontWeight: FontWeight.bold,
            //     color: Color(0xFFF00303),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
