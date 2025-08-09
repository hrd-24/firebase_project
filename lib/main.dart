import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:starting_slicing/app/feature/splash_screen.dart';
import 'package:starting_slicing/app/utils/theme_decoration.dart';
import 'package:starting_slicing/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp()); 
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
      context,
      designSize: Size(375, 812), // Ukuran desain dasar
      minTextAdapt: true, // Adaptasi teks berdasarkan ukuran layar
      splitScreenMode: false,
    );

    return MaterialApp(
      home:  SplashScreen(),
      title: 'Papay',
      debugShowCheckedModeBanner: false,
      theme: themeDataDecoration(),
    );
  }
}
