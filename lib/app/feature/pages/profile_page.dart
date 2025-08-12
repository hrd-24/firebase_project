import 'package:flutter/material.dart';
import 'package:starting_slicing/app/constants/app_style.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App bar section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CircleAvatar(
                      radius: 18,
                      backgroundImage: NetworkImage(
                        'https://upload.wikimedia.org/wikipedia/commons/7/7c/Profile_avatar_placeholder_large.png',
                      ),
                    ),
                    const Spacer(),
                    Text(
                      'Akun',
                      style: AppTextStyle.bold(fontSize: AppFontSize.h4),
                    ),
                    const Spacer(),
                    const SizedBox(width: 36), // agar teks tetap center
                  ],
                ),
              ),

              const Divider(height: 1),

              // Profile section
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 28,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=1',
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Ahmad Fauzi',
                          style: AppTextStyle.bold(fontSize: AppFontSize.h5),
                        ),
                        Text(
                          'ahmad.fauzi@email.com',
                          style: AppTextStyle.regular(
                            // fontSize: AppFontSize.body2,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),

              const Divider(height: 1),

              // Section Akun
              _buildSectionTitle('Akun'),
              _buildMenuItem(Icons.person_outline, 'Detail pribadi'),
              _buildMenuItem(Icons.notifications_none, 'Notifikasi'),
              _buildMenuItem(Icons.settings_outlined, 'Pengaturan akun'),
              _buildMenuItem(Icons.receipt_long_outlined, 'Ringkasan Donasi'),

              const SizedBox(height: 16),

              // Section Umum
              _buildSectionTitle('Umum'),
              _buildMenuItem(Icons.help_outline, 'FAQ & Bantuan'),
              _buildMenuItem(Icons.description_outlined, 'Kebijakan & Ketentuan'),
              _buildMenuItem(Icons.logout, 'Keluar'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
      child: Text(
        title,
        style: AppTextStyle.bold( color: Colors.grey[600]),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: AppTextStyle.regular(),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: () {},
    );
  }
}
