import 'package:flutter/material.dart';
import 'package:starting_slicing/app/feature/model/donasi_model.dart';
import 'package:starting_slicing/app/feature/pages/profile_page.dart';
import 'package:starting_slicing/app/feature/pages/donasi_page.dart';
import 'package:starting_slicing/app/feature/pages/home_page.dart';
import 'package:starting_slicing/app/feature/pages/profile_yayasan_page.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<DonasiModel> _donasiList = [];

  void _handleAddDonasi(DonasiModel donasi) {
    setState(() {
      _donasiList.add(donasi);
      _currentIndex = 1; // Pindah ke tab Donasi
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screens = [
      HomePage(
        onAddDonasi: _handleAddDonasi,
      ), // cukup panggil tanpa onAddDonasi
      const DonasiPage(),
      const ProfilePage(),
      const AboutPage(),
    ];

    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.volunteer_activism),
            label: 'Donasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Profile Yayasan',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }
}
